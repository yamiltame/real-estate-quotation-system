<?php
class Cotizar{
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
		$tabla=$this->tabla_cotizaciones($cond."limit ".$inf.",".$cantidadmostrar,$orden,$last,$compag,$buscar,$compag,$inf,$cantidadmostrar);
		$empaginamiento=$this->empaginamiento_cotizaciones("select id from cotizaciones ".$cond,$compag,$cantidadmostrar,array("orden"=>$orden,"last"=>$last,"buscar"=>$buscar));
		$busqueda= ($buscar!="") ? "<div><i>Resultados para '".$buscar."'</i></div>" : "";
		$data['titulo']='Cotizaciones';
		$data['tabla']=$tabla;
		$data['busqueda']=$busqueda;
		$data['empaginamiento']=$empaginamiento;		
		$this->view('cotizar',$data);
	}

	public function ver($id){
		check_sesion();
		date_default_timezone_set('America/Mexico_City');
		$hoy=date_create('now')->format('d-m-Y');
		$res=$this->query("select datos from cotizaciones where id=:id",['id'=>$id[2]]);
		$data=json_decode($res[0]['datos'],TRUE);
		$data['hoy']=$hoy;
		$this->view('cotizacion',$data);
	}
 
	public function borrar($id){
		check_sesion();
		$res=$this->query("delete from cotizaciones where id=:id",['id'=>$id[2]]);
		redirect('cotizar');
	}

	public function lote($id){
		check_sesion();
		$res=$this->query("select id,(select nombre from desarrollos where lotes.desarrollo=desarrollos.id) as desarrollo,manzana,num,superficie,precio,meses_12,meses_24,friendsnfamily,apartado as c_id,archivo,tipo from lotes where id=:id",['id'=>$id[2]]);
		$data=$res[0];
		$data['archivo']=$res[0]['archivo'];
		$data['info_lote']=json_encode($res[0]);
		$data['titulo']='Cotizar lote';
		$data['vendedor']=$_SESSION['user']['nombre'];
		$data['contacto_v']=$_SESSION['user']['contacto'];
		$data['esquemas']=$this->get_esquemas($data['friendsnfamily']);
		$data['clientes']=$this->get_clientes($data['c_id']);
		$data['agentes']=$this->get_vendedores();
		$this->view('cotizar_lote',$data);
	}
 
	public function cotizacion(){
		check_sesion();
		date_default_timezone_set('America/Mexico_City');
		$data['titulo']='Cotización';
		$date=date_create('now');
		$data['fecha']=$date->format('d-m-Y');
		$data['vendedor']=$_SESSION['user']['nombre'];
		$data['contacto_v']=implode(',',json_decode($_SESSION['user']['contacto'],TRUE));
		$esquema=json_decode($_POST['esquema'],TRUE);
		$cliente=json_decode($_POST['cliente'],TRUE);
		$agente=json_decode($_POST['agente'],TRUE);
		$info_lote=json_decode($_POST['info_lote'],TRUE);
		$data['archivo']=$info_lote['archivo'];
		$data['cliente']=$cliente['nombre'] ?? '';
		$data['agente']=$agente['nombre'] ?? '';
		$data['contacto_c']=implode(',',json_decode($cliente['contacto'] ?? '{}',TRUE));
		$data['contacto_a']=implode(',',json_decode($agente['contacto'] ?? '{}',TRUE));
		$data['desarrollo']=$info_lote['desarrollo'];
		$data['tipo']=$info_lote['tipo'];
		$data['num']=$info_lote['num']; 
		$data['manzana']=$info_lote['manzana'];
		$data['superficie']=$info_lote['superficie'];
		$data['precio']=money_fmt($info_lote['precio']);
		$data['costo_m2_lista']=money_fmt($info_lote['precio']/$info_lote['superficie']);
		if($esquema['nombre']=='12 meses'){
			$price=$info_lote['meses_12'];
			$data['costo_m2']=$info_lote['meses_12']/$info_lote['superficie'];
		}else if($esquema['nombre']=='24 meses'){
			$price=$info_lote['meses_24'];
			$data['costo_m2']=$info_lote['meses_24']/$info_lote['superficie'];
		}else if($esquema['nombre']=='Friends and Family'){
			$price=$info_lote['friendsnfamily'];
			$data['costo_m2']=$info_lote['friendsnfamily']/$info_lote['superficie'];
		}else if($esquema['nombre']=='Contado'){
			$price=$info_lote['precio'];
			$data['costo_m2']=$info_lote['precio']/$info_lote['superficie'];
		}else{
			$price=$info_lote['superficie']*$esquema['costo_m2'];
			$data['costo_m2']=$esquema['costo_m2'];
		}
		$data['esquema']=$esquema['nombre'];
		$data['pagos']=$esquema['pagos'];
		$data['interes']=( ($price/$info_lote['precio'] -1) < 0) ? 0: round(($price/$info_lote['precio']-1)*100,2);
		$data['enganche']=money_fmt($price*$esquema['enganche']/100)."   (".$esquema['enganche']."%)";
		$data['mensualidades']=money_fmt($esquema['mensualidades']*$price/100)."   (".$esquema['mensualidades']."%)";
		$data['finiquito']=money_fmt($esquema['finiquito']*$price/100)."   (".$esquema['finiquito']."%)";
		$data['pago_m']=money_fmt($price*($esquema['mensualidades']/100)/$esquema['pagos']);
		$data['precio_final']=money_fmt($price);
		$data['precio_m2']=money_fmt($info_lote['precio']/$info_lote['superficie']);
		$data['calendario']=$this->calendario_pagos($price,$esquema,$data['fecha']);
		$nombre=$data['vendedor']."_".$data['desarrollo']."_lote".$data['num']."_".$data['cliente']."_".$data['esquema'];
		$sql="insert into cotizaciones values (null,now(),'".$nombre."','".json_encode($data,JSON_UNESCAPED_UNICODE)."')";
		$con=$this->connect();
		$stm=$con->prepare($sql);
		try{
			$stm->execute();
		}catch(Exception $e){
			redirect('cotizar');
		}
		$stm=$con->prepare("select last_insert_id() as id");
		$stm->execute();
		$id=$stm->fetchAll(PDO::FETCH_ASSOC)[0]['id'];
		redirect('cotizar/ver/'.$id);
	}

	public function calendario_pagos($price,$esquema,$fecha){
		$interval=DateInterval::createFromDateString('1 month');
		$date=date_create($fecha);
		$tabla="<tr><td>1</td><td>".make_fecha($date->format('d-m-Y'))."</td><td>Enganche(".$esquema['enganche']."%)</td><td>".money_fmt($price*$esquema['enganche']/100)."</td></tr>";
		$sum=round($price*$esquema['enganche']/100);
		for($i=1;$i<$esquema['pagos'];$i++){
			$date=date_add($date,$interval);
			$tabla.="<tr><td>".($i+1)."</td><td>".make_fecha($date->format('d-m-Y'))."</td><td>Mensualidad</td><td>".money_fmt($price*($esquema['mensualidades']/100)/$esquema['pagos'])."</td></tr>";
			$sum+=round($price*($esquema['mensualidades']/100)/$esquema['pagos']);
		}
		$ultimo=round($price)-round($esquema['finiquito']*$price/100)-$sum;
		$tabla.="<tr><td>".($esquema['pagos']+1)."</td><td>".make_fecha($date->format('d-m-Y'))."</td><td>Mensualidad</td><td>".money_fmt($ultimo)."</td></tr>";
		$date=date_add($date,$interval);
		$tabla.="<tr><td>".($esquema['pagos']+2)."</td><td>".make_fecha($date->format('d-m-Y'))."</td><td>Escrituración y entrega(".$esquema['finiquito']."%)</td><td>".money_fmt($esquema['finiquito']*$price/100)."</td></tr>";
		$sum+=$ultimo+round($esquema['finiquito']*$price/100);
		$tabla.="<tr><td></td><td></td><td><b>Total: </b><td><b>".money_fmt($sum)."</b></td></tr>";
		return $tabla;
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

	public function get_vendedores($id=0){
		$form="<select class='form-control' name='agente'><option value='' selected required>---vendedor</option>";
		$res=$this->query("select * from agentes order by nombre asc");
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

	function tabla_cotizaciones($condicion,$orden,$last,$pag,$buscar,$compag){
		$titulos= array("fecha","nombre","Ver","Borrar");
        $tabla="<table class='mb-0 table table-striped table-bordered'><thead class='table-primary'><tr>";
		$sql="select id,fecha,nombre from cotizaciones ".$condicion;
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
        		$tabla.="<td>".$row['nombre']."</td>";
        		$tabla.="<td><a href='".ROOT."/cotizar/ver/".$row['id']."' class='btn btn-primary' target='_blank'>Ver</a></td>";
        		$tabla.="<td><a href='".ROOT."/cotizar/borrar/".$row['id']."' class='btn btn-danger'>Borrar</a></td></tr>";
    		}
    	}
		$tabla.="</tbody></table>";
		return $tabla;
	}

    function empaginamiento_cotizaciones($sql,$compag,$cantidadmostrar,$extras){
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