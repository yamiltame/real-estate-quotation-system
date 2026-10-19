 <?php
class Ventas{
	use Controller;
	use Database;
	public function index(){
		check_sesion();
		$cantidadmostrar=10;
		$compag=(!isset($_GET['pag'])) ? 1: $_GET['pag'];
		$orden=(isset($_GET['orden'])) ? $_GET['orden']: "";
		$last=(isset($_GET['last'])) ? $_GET['last']: 0;
		$cond="";
		$buscar= (isset($_POST['buscar'])) ? $_POST['buscar']: ((isset($_GET['buscar'])) ? $_GET['buscar']: "");
		$cond= ($buscar!="") ? "where (nombre like '%".$buscar."%')" : "where 1";
		$cond.= ($orden!="") ? (($last==0) ? " order by ".$orden." asc " : " order by ".$orden." desc ") : " order by id desc ";
		$inf=($compag-1)*$cantidadmostrar;
		$tabla=$this->tabla_ventas($cond."limit ".$inf.",".$cantidadmostrar,$orden,$last,$compag,$buscar,$compag,$inf,$cantidadmostrar);
		$empaginamiento=$this->empaginamiento_ventas("select id from cotizaciones ".$cond,$compag,$cantidadmostrar,array("orden"=>$orden,"last"=>$last,"buscar"=>$buscar));
		$busqueda= ($buscar!="") ? "<div><i>Resultados para '".$buscar."'</i></div>" : "";
		$data['titulo']='Ventas';
		$data['tabla']=$tabla;
		$data['busqueda']=$busqueda;
		$data['empaginamiento']=$empaginamiento;		
		$this->view('ventas',$data);
	}

	public function ver($id){
		check_sesion();
		$res=$this->query("select * from ventas where id=:id",['id'=>$id[2]]);
		$data=$res[0];
		show($data);
		//$this->view('ventas',$data);
	}

	public function vender($id){
		check_sesion();
		$res=$this->query("select id,(select nombre from desarrollos where lotes.desarrollo=desarrollos.id) as desarrollo,manzana,num,superficie,precio,meses_12,meses_24,friendsnfamily,apartado as c_id from lotes where id=:id",['id'=>$id[2]]);
		$data=$res[0];
		$data['info_lote']=json_encode($res[0]);
		$data['titulo']="Vender lote";
		$data['esquemas']=$this->get_esquemas($data['friendsnfamily']);
		$data['clientes']=$this->get_clientes($data['c_id']);
		//show($data);
		$this->view('vender_lote',$data);
	}

	public function get_esquemas($ff){
		$form="<select class='form-control' name='esquema' required><option value='' selected>---esquema</option>";
		$sql="select * from esquemas ";
		$sql.= ($ff) ? '' : "where nombre!='Friends and Family'";
		$sql.=" order by nombre asc";
		$res=$this->query($sql);
		foreach($res as $row){
			$form.="<option value='".json_encode($row)."'>".$row['nombre']."</option>";
		}
		$form.="</select>";
		return $form;
	}

	public function get_clientes($id=0){
		if($id==0){
			$form="<select class='form-control' name='cliente'><option value='' selected>---cliente</option>";
			$res=$this->query("select * from clientes order by nombre asc");
			foreach($res as $row){
				$form.="<option value='".json_encode($row)."'>".$row['nombre']."</option>";
			}
			$form.="</select>";
		}else{
			$res=$this->query("select * from clientes where id=:id",['id'=>$id]);
			$form="<input type='hidden' name='cliente' value='".json_encode($res[0])."'><b>".$res[0]['nombre']."</b>";
		}
		return $form;
	}

	public function venta(){
		check_sesion();
		show($_SESSION['user']);
		show($_POST);
		$esquema=json_decode($_POST['esquema'],true);
		$cliente=json_decode($_POST['cliente'],true);
		$info_lote=json_decode($_POST['info_lote'],true);
		$date=date_create('now');
		$fecha=$date->format('d-m-Y');
		$Conv=[
			'12 meses'=>'meses_12',
			'24 meses'=>'meses_24',
			'Contado'=>'precio',
			'Friends and Family'=>'friendsnfamily'
		];
		$clave=$_SESSION['user']['nombre']."_".$info_lote['desarrollo']."M".$info_lote['manzana']."#".$info_lote['num']."_".$Conv[$esquema['nombre']]."_".str_replace(' ', '', $cliente['nombre']);
		show($clave);
		$sql="insert into ventas values(null,'".$clave."',".$_SESSION['user']['id'].",".$cliente['id'].",".$info_lote['id'].",".$esquema['id'].",'".$date->format('Y-m-d')."',".$info_lote[$Conv[$esquema['nombre']]].",'{}')";
		show($sql);
		$this->query($sql);
		$sql="update lotes set vendido=1 where id=".$info_lote['id'];
		$this->query($sql);
		redirect('ventas');
	}

	public function borrar($id){
		check_sesion();
		$res=$this->query("delete from ventas where id=:id",['id'=>$id[2]]);
		$this->query("update lotes set vendido=0 where id=:id",['id'=>$id[3]]);
		redirect('ventas');
	}

	function tabla_ventas($condicion,$orden,$last,$pag,$buscar,$compag){
		$titulos= array("fecha","clave","Ver","Borrar");
        $tabla="<table class='mb-0 table table-striped table-bordered'><thead class='table-primary'><tr>";
		$sql="select id,fecha,clave,lote from ventas ".$condicion;
		foreach ($titulos as $t){
			if($t!="Ver" && $t!="Borrar"){
				if($last==0){
					$tabla.="<th scope='col'><a href='?orden=$t&last=1&buscar=$buscar'>".$t."</a></th>";
					}
				else{
					$tabla.="<th scope='col'><a href='?orden=$t&last=0&buscar=$buscar'>".$t."</a></th>";
					}
				}
			}
		$tabla.="<th scope='col'>Ver</th>";
		$tabla.="<th scope='col'>Borrar</th></tr></thead> <tbody>";
		$result=$this->query($sql);
		if(!$result){
			$tabla.="<tr>No se encontraron resultados para la búsqueda...</tr>";
		}else{
			while($row=array_shift($result)){
    	    	$tabla.="<tr>";
        		$tabla.="<td>".$row['fecha']."</td>";
        		$tabla.="<td>".$row['clave']."</td>";
        		$tabla.="<td><a href='".ROOT."/ventas/ver/".$row['id']."' class='btn btn-primary' target='_blank'>Ver</a></td>";
        		$tabla.="<td><a href='".ROOT."/ventas/borrar/".$row['id']."/".$row['lote']."' class='btn btn-danger'>Borrar</a></td></tr>";
    		}
    	}
		$tabla.="</tbody></table>";
		return $tabla;
	}

    function empaginamiento_ventas($sql,$compag,$cantidadmostrar,$extras){
        $line="";
        //la variable extras debe ser un array con las claves para los parametros...
        foreach ($extras as $clave => $valor){
            $line.=$clave."=".$valor."&";
            }
        $user=new User;
        //show($sql);
        $registros=$user->query($sql);
        if(!$registros){
        	$registros=[];
        }
	    $paginas=ceil(count($registros)/$cantidadmostrar);
        $increment=(($compag +1) <= $paginas) ? ($compag +1): $paginas;
        $decrement=(($compag -1) < 1) ? 1: ($compag-1);
        $desde=$compag - 4;
        $hasta=$compag +5;
        $desde=($desde<1)? 1 : $desde;
        $hasta=($hasta>$paginas)? $paginas : $hasta;
        $empaginamiento="<a href='?pag=$decrement&$line'>atrás</a>";
        for($i=$desde;$i<=$hasta;$i++){
            if($i==$compag){ $empaginamiento.="<a href='?pag=$i&$line'><b>($i)</b></a>";}
            else{ $empaginamiento.="<a href='?pag=$i&$line'>($i)</a>";}
        }
        $empaginamiento.="<a href='?pag=$increment&$line'>Siguiente</a>";
        return $empaginamiento;
    }

}