<?php
 
class Esquemas{
	use Controller;
	use Database;
	public function index($URL=[]){
		$data['titulo']="Esquemas";
		$data['tabla_esquemas']=$this->tabla_esquemas();
		$this->view('esquemas',$data);
	}

	public function editar(){
		if($_SERVER['REQUEST_METHOD']=='POST'){
			if(isset($_POST['editar'])){
				$data=json_decode($_POST['editar'],TRUE);
				$data['titulo']="Editar esquema";
				$data['action']=ROOT."/esquemas/editar";
				$data['boton']="<button type='submit' class='mt-2 btn btn-secondary'>Editar</button>";
				$data['borrar']="<form method='post' class='mt-5'><input type='hidden' name='borrar' value='".$data['id']."'><input type='submit' value='Borrar esquema' class='btn btn-danger'></form>";
				$this->view('registrar_esquema',$data);
			}else if(isset($_POST['borrar'])){
				$this->query("delete from esquemas where id=:id",['id'=>$_POST['borrar']]);
				redirect('esquemas');
			}else{
				$data=$_POST;
				$query="update esquemas set nombre=:nombre,
					costo_m2=:costo_m2,pagos=:pagos,
					enganche=:enganche,mensualidades=:mensualidades,finiquito=:finiquito where id=:id";
					show($data);
				$this->query($query,$data);
				redirect('esquemas');
			}
		}
	}

	public function registrar(){
		if($_SERVER['REQUEST_METHOD']=='POST'){
			unset($_POST['id']);
			$query="insert into esquemas (
				nombre,
				costo_m2,
				pagos,
				enganche,
				mensualidades,
				finiquito) 
				values (:nombre,:costo_m2,:pagos,:enganche,:mensualidades,:finiquito)";
			$this->query($query,$_POST);
			redirect('esquemas');
		}

		$data['titulo']="Registrar esquema";
		$data['action']=ROOT."/esquemas/registrar";
		$data['boton']="<button type='submit' class='mt-2 btn btn-primary'>Registrar</button>";

		$this->view('registrar_esquema',$data);
	}

	public function tabla_esquemas(){
		$tabla="<table class='table table-responsive table-bordered'><thead class='table-primary'><tr>
			<th> Nombre</th><th>Precio/m2</th><th>Pagos</th><th>Enganche</th><th>Mensualidades</th><th>Finiquito</th><th>Editar</th></tr></thead><tbody>
		";
		$sql="select * from esquemas";
		$result=$this->query($sql);
		if(!$result){
			$tabla.="<tr>No hay esquemas</tr>";
		}else{
			while($row=array_shift($result)){
				$costo=($row['costo_m2']==0)?'establecido':money_fmt($row['costo_m2']);
				$tabla.="<tr><td>".$row['nombre']."</td><td>".$costo."</td><td>".$row['pagos']."</td><td>".$row['enganche']."%</td><td>".$row['mensualidades']."%</td><td>".$row['finiquito']."%</td>";
				if(!in_array($row['nombre'],['Friends and Family','12 meses','24 meses','Contado'])){
					$tabla.="<td><form method='post' action='".ROOT."/esquemas/editar'> <input name='editar' type='hidden' value='".json_encode($row)."' ><input type='submit' class='btn btn-secondary' value='Editar'></form></td></tr>";
				}else{ $tabla.="<td></td></tr>";}
			}
		}
		$tabla.="</tbody></table>";
		return $tabla;
	}
}

