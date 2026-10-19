 <?php
class Clientes{
	use Controller;
	use Database;
	public function index(){
		//verificar que el usuario tenga permiso<=1
		$cantidadmostrar=10;
		$compag=(!isset($_GET['pag'])) ? 1: $_GET['pag'];
		$orden=(isset($_GET['orden'])) ? $_GET['orden']: "";
		$last=(isset($_GET['last'])) ? $_GET['last']: 0;
		$cond="";
		$buscar= (isset($_POST['buscar'])) ? $_POST['buscar']: ((isset($_GET['buscar'])) ? $_GET['buscar']: "");
		$cond= ($buscar!="") ? "where (nombre like '%".$buscar."%')" : "where 1";
		$cond.= ($orden!="") ? (($last==0) ? " order by ".$orden." asc " : " order by ".$orden." desc ") : " order by id desc ";
		$inf=($compag-1)*$cantidadmostrar;
		$tabla=$this->tabla_clientes($cond."limit ".$inf.",".$cantidadmostrar,$orden,$last,$compag,$buscar,$compag,$inf,$cantidadmostrar);
		$empaginamiento=$this->empaginamiento_clientes("select id from clientes ".$cond,$compag,$cantidadmostrar,array("orden"=>$orden,"last"=>$last,"buscar"=>$buscar));
		$busqueda= ($buscar!="") ? "<div><i>Resultados para '".$buscar."'</i></div>" : "";
 
		$info['tablaclientes']=$tabla;
		$info['busqueda']=$busqueda;
		$info['empaginamiento']=$empaginamiento;
		$info['titulo']="Clientes";
		$this->view('clientes',$info);
	}
 

	public function registrar(){
		if($_SERVER['REQUEST_METHOD']=='POST'){
			unset($_POST['id']);
			$contact['tel']=$_POST['tel'];
			$contact['email']=$_POST['email'];
			$info['nombre']=$_POST['nombre'];
			$info['contacto']=json_encode($contact);
			//show($info);
			$query="insert into clientes (nombre,contacto) values (:nombre,:contacto)";
			$this->query($query,$info);
			redirect('clientes');
		}
		$data['titulo']="Registrar cliente";
		$data['action']=ROOT."/clientes/registrar";
		$data['boton']="<button type='submit' class='mt-2 btn btn-primary'>Registrar</button>";

		$this->view('registrar_cliente',$data);
	}

	public function editar(){
		if($_SERVER['REQUEST_METHOD']=='POST'){
			if(isset($_POST['editar'])){
				$data=json_decode($_POST['editar'],TRUE);
				$contact=json_decode($data['contacto']);
				$data['tel']=$contact->tel;
				$data['email']=$contact->email ?? '';
				$data['titulo']="Editar cliente";
				$data['action']=ROOT."/clientes/editar";
				$data['boton']="<button type='submit' class='mt-2 btn btn-secondary'>Editar</button>";
				$data['borrar']="<form method='post' class='mt-5'><input type='hidden' name='borrar' value='".$data['id']."'><input type='submit' value='Borrar cliente' class='btn btn-danger'></form>";
				$this->view('registrar_cliente',$data);
			}else if(isset($_POST['borrar'])){
				$this->query("delete from clientes where id=:id",['id'=>$_POST['borrar']]);
				redirect('clientes');
			}else{
				$data['contacto']=json_encode(['tel'=>$_POST['tel'],'email'=>$_POST['email']]);
				$data['id']=$_POST['id'];
				$data['nombre']=$_POST['nombre'];
				$query="update clientes set nombre=:nombre,contacto=:contacto where id=:id";
				$this->query($query,$data);
				redirect('clientes');
			}
		}
	}


	function tabla_clientes($condicion,$orden,$last,$pag,$buscar,$compag){
		$campos= array("id","nombre","contacto");
		$titulos= array("Nombre","Contacto","Editar");
        $tabla="<table class='mb-0 table table-striped table-bordered'><thead class='table-primary'><tr>";
		$sql="select ";
		foreach ($campos as $c){ $sql.=$c.",";}
		$sql=trim($sql,",");
		foreach ($titulos as $t){
			if($t!="Editar"){
				if($last==0){
					$tabla.="<th scope='col'><a href='?orden=$t&last=1&buscar=$buscar'>".$t."</a></th>";
					}
				else{
					$tabla.="<th scope='col'><a href='?orden=$t&last=0&buscar=$buscar'>".$t."</a></th>";
					}
				}
			}
		$tabla.="<th scope='col'>Editar</th></tr></thead> <tbody>";
		$sql.=" from clientes ".$condicion;
		$user=new User;
		$result=$user->query($sql);
		if(!$result){
			$tabla.="<tr>No se encontraron resultados para la búsqueda...</tr>";
		}else{
			while($row=array_shift($result)){
    	    	$tabla.="<tr>";
        		$tabla.="<td>".$row['nombre']."</td><td>";
        		foreach(json_decode($row['contacto'],TRUE) as $contact){
        			$tabla.=$contact.", ";
        		}
        		$tabla=trim($tabla,", ");
        		$tabla.="</td><td><form action='".ROOT."/clientes/editar' method='post'> <input name='editar' type='hidden' value='".json_encode($row)."' ><input type='submit' class='btn btn-secondary' value='Editar'></form></td></tr>";
    		}
    	}
		$tabla.="</tbody></table>";
		return $tabla;
	}

    function empaginamiento_clientes($sql,$compag,$cantidadmostrar,$extras){
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