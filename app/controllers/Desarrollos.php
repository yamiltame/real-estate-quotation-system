
   <?php
class Desarrollos{
	use Controller;
	use Database;
	public function index(){
		$cantidadmostrar=10;
		$compag=(!isset($_GET['pag'])) ? 1: $_GET['pag'];
		$orden=(isset($_GET['orden'])) ? $_GET['orden']: "";
		$last=(isset($_GET['last'])) ? $_GET['last']: 0;
		$cond="";
		$buscar= (isset($_POST['buscar'])) ? $_POST['buscar']: ((isset($_GET['buscar'])) ? $_GET['buscar']: "");
		$cond= ($buscar!="") ? "where (nombre like '%".$buscar."%')" : "where 1";
		$cond.= ($orden!="") ? (($last==0) ? " order by ".$orden." asc " : " order by ".$orden." desc ") : " order by id desc ";
		$inf=($compag-1)*$cantidadmostrar;
		$tabla=$this->tabla_desarrollos($cond."limit ".$inf.",".$cantidadmostrar,$orden,$last,$compag,$buscar,$compag,$inf,$cantidadmostrar);
		$empaginamiento=$this->empaginamiento_desarrollos("select id from clientes ".$cond,$compag,$cantidadmostrar,array("orden"=>$orden,"last"=>$last,"buscar"=>$buscar));
		$busqueda= ($buscar!="") ? "<div><i>Resultados para '".$buscar."'</i></div>" : "";

		$info['tabladesarrollos']=$tabla;
		$info['busqueda']=$busqueda;
		$info['empaginamiento']=$empaginamiento;
		$info['titulo']="Desarrollos";
		$this->view('desarrollos',$info);
	}
 

	public function registrar(){
		if($_SERVER['REQUEST_METHOD']=='POST'){
			unset($_POST['id']);
			//crear desarrollo
			$con=$this->connect();
			$sql="insert into desarrollos values (null,:nombre,:precio,:meses_12,:meses_24,:friendsnfamily)";
			$stm=$con->prepare($sql);
			$data['desarrollo']=0;
			//show($_POST);
			if($stm->execute($_POST)){
				$sql="select last_insert_id() as id";
				$stm=$con->prepare($sql);
				if($stm->execute()){					
					$data['desarrollo']=$stm->fetchAll(PDO::FETCH_ASSOC)[0]['id'];
				}

			}
			$file=fopen($_FILES['archivo']['tmp_name'],'r');
			//trow away the first one
			$row=fgetcsv($file);
			//then the loop 
			while($row=fgetcsv($file)){
				//show($row);
				$data['manzana']=$row[0];
				$data['lote']=$row[1];
				$data['superficie']=$row[2];
				$data['precio']=$row[2]*$_POST['precio'];
				$data['meses_12']=$row[2]*$_POST['meses_12'];
				$data['meses_24']=$row[2]*$_POST['meses_24'];
				$data['tipo']=$row[6];
				if($row[3]!=''){
					$stm=$con->prepare("select id from clientes where nombre=:nombre");
					$stm->execute(['nombre'=>$row[3]]);
					$res=$stm->fetchAll(PDO::FETCH_ASSOC);
					if($res){
						$data['apartado']=$res[0]['id'];
					}else{
						show("no cliente");
						$cons="insert into clientes values (null,:nombre,'{\"tel\":\"(+52)\",\"email\":\"correo@dominio.com\"}')";
						$stm=$con->prepare($cons);
						if($stm->execute(['nombre'=>$row[3]])){
							$stm=$con->prepare("select last_insert_id() as id");
							$stm->execute();
							$data['apartado']=$stm->fetchAll(PDO::FETCH_ASSOC)[0]['id'];
						}
					}
				}else{$data['apartado']=0;}
				$data['friendsnfamily']= ($row[4]!='') ? $row[2]*$_POST['friendsnfamily'] : 0;
				$data['archivo']= ($row[5]!='') ?  $row[5] : 'Croquis.png';
				$sql="insert into lotes values (null,
					:desarrollo,:manzana,:lote,:superficie,:precio,:meses_12,:meses_24,:friendsnfamily,
					:apartado,:vendido,:archivo,:tipo)";
				$data['vendido']=0;
				$stm=$con->prepare($sql);
				$stm->execute($data);
			}
			redirect('desarrollos');
		}
		$data['titulo']="Nuevo desarrollo";
		$data['action']=ROOT."/desarrollos/registrar";
		$data['ingresar_lotes']="      <div id='ingresar_lotes' class='row'>
        <label for='file'><h4>Ingresar lotes</h4></label>
        <input type='file' id='archivo' name='archivo' class='btn btn-success' required>
      </div>";
		$data['boton']="<button type='submit' class='mt-2 btn btn-primary'>Registrar</button>";

		$this->view('registrar_desarrollo',$data);
	}

	public function editar(){
		if($_SERVER['REQUEST_METHOD']=='POST'){
			if(isset($_POST['editar'])){
				$data=json_decode($_POST['editar'],TRUE);
				$data['titulo']="Editar desarrollo";
				$data['action']=ROOT."/desarrollos/editar";
				$data['boton']="<button type='submit' class='mt-2 btn btn-secondary'>Editar</button>";
				$data['borrar']="<form method='post' class='mt-5'><input type='hidden' name='borrar' value='".$data['id']."'><input type='submit' value='Borrar proyecto' class='btn btn-danger'></form>";
				$this->view('registrar_desarrollo',$data);
			}else if(isset($_POST['borrar'])){
				$this->query("delete from desarrollos where id=:id",['id'=>$_POST['borrar']]);
				$this->query("delete from lotes where desarrollo=:id",['id'=>$_POST['id']]);
				redirect('desarrollos');
			}else{
				$data['id']=$_POST['id'];
				$data['nombre']=$_POST['nombre'];
				$data['precio']=$_POST['precio'];
				$data['meses_12']=$_POST['meses_12'];
				$data['meses_24']=$_POST['meses_24'];
				$data['friendsnfamily']=$_POST['friendsnfamily'];
				$query="update desarrollos set nombre=:nombre,precio=:precio,meses_12=:meses_12,meses_24=:meses_24,friendsnfamily=:friendsnfamily where id=:id";
				$this->query($query,$data);
				redirect('desarrollos');
			}
		}
	}


	function tabla_desarrollos($condicion,$orden,$last,$pag,$buscar,$compag){
		$campos= array("id","nombre","precio","meses_12","meses_24","friendsnfamily");
		$titulos= array("Nombre","Precio por m2","12 meses","24 meses","Friends and family","Lotes","Editar");
        $tabla="<table class='mb-0 table table-striped table-bordered'><thead class='table-primary'><tr>";
		$sql="select ";
		foreach ($campos as $c){ $sql.=$c.",";}
		$sql=trim($sql,",");
		foreach ($titulos as $t){
			if($t=="Nombre"){
				if($last==0){
					$tabla.="<th scope='col'><a href='?orden=$t&last=1&buscar=$buscar'>".$t."</a></th>";
					}
				else{
					$tabla.="<th scope='col'><a href='?orden=$t&last=0&buscar=$buscar'>".$t."</a></th>";
					}
				}
			}
		$tabla.="<th scope='col'>Precio ($/m2)</th>";
		$tabla.="<th scope='col'>12 meses</th>";
		$tabla.="<th scope='col'>24 meses</th>";
		$tabla.="<th scope='col'>Friends & Family</th>";
		$tabla.="<th scope='col'>Lotes</th>";
		$tabla.="<th scope='col'>Editar</th></tr></thead> <tbody>";
		$sql.=" from desarrollos ".$condicion;
		$result=$this->query($sql);
		if(!$result){
			$tabla.="<tr>No se encontraron resultados para la búsqueda...</tr>";
		}else{
			while($row=array_shift($result)){
    	    	$tabla.="<tr>";
        		$tabla.="<td>".$row['nombre']."</td>";
        		$tabla.="<td>".money_fmt($row['precio'])."</td>";
        		$tabla.="<td>".money_fmt($row['meses_12'])."</td>";
        		$tabla.="<td>".money_fmt($row['meses_24'])."</td>";
        		$tabla.="<td>".money_fmt($row['friendsnfamily'])."</td>";
        		$tabla.="<td><form action='".ROOT."/lotes' method='post'>
        		<input type='hidden' name='nombre' value='".$row['nombre']."'> <input name='desarrollo' type='hidden' value='".$row['id']."' ><input type='submit' class='btn btn-primary' value='Cotizar/Vender'></form></td>";
        		$tabla.="<td><form action='".ROOT."/desarrollos/editar' method='post'> <input name='editar' type='hidden' value='".json_encode($row)."' ><input type='submit' class='btn btn-secondary' value='Editar'></form></td></tr>";
    		}
    	}
		$tabla.="</tbody></table>";
		return $tabla;
	}

    function empaginamiento_desarrollos($sql,$compag,$cantidadmostrar,$extras){
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

	function registrar_desarrollo($archivos){
		$datos=$this->subir_lotes($archivos);
		show($datos);
		if($datos[0]=="1"){
			$sql="";
		}
		return $datos[0];
	 }

	function subir_lotes($files){
		$destino="1";
		$mensaje="1";
		$file=$files['archivo'];
		$fileext=explode('.',$file['name']);
		$fileactualext=strtolower(end($fileext));
		$allowed=array('txt','csv','xlsx');
		if(in_array($fileactualext,$allowed)){
			if($file['error']==0){
				if($file['size']<2000000){
					$filenamenew=uniqid('',true).".".$fileactualext;
					$destino=ROOT."/assets/files/".$filenamenew;
					move_uploaded_file($file['tmp_name'],$destino);
					}
				else {$mensaje="archivo muy grande, máximo 2MB<br>";}
			}else{ 
				$mensaje="hubo un error<br>";
			}
		}else{ 
			$mensaje="extensión no permitida (permite: ";
			foreach($allowed as $a){
				$mensaje.=$a.", ";
			}
			$mensaje=trim($mensaje,", ");
			$mensaje.=")";
		}
		return array($mensaje,$destino);
	}


}
