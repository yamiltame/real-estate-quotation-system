<?php
 
class Home{
	use Controller;
	use Database;
	public function index($URL=[]){
		if(isset($_SESSION['user'])){
			$user=new Vendedor;
			$data=$user->get_info($_SESSION['user']);
			$data['titulo']='Remax';
			if($_SERVER['REQUEST_METHOD']=='POST'){
				if(isset($_POST['borrar'])){
					$sql="delete from comentarios where id= :id";
					$this->query($sql,['id'=>$_POST['borrar']]);
				}else if(isset($_POST['comentario'])){
					$sql="insert into comentarios (autor,comentario) values (:autor,:comentario)";
					$this->query($sql,['autor'=>$_SESSION['user']['id'],'comentario'=>$_POST['comentario']]);
					redirect('home');
				}
			}
			$data['tabla_comentarios']=$this->tabla_comentarios();
			$this->view('home',$data);
		}else{
			redirect('login');
		}
	}
	public function info(){
		if(isset($_SESSION['user'])){
			$user=new User;
			$data=$user->get_info($_SESSION['user']);
			$data['contacto']=json_decode($data['contacto'],TRUE);
			$data['titulo']="Perfil";
			$this->view('homeinfo',$data);
		}else{
			redirec('login');
		}
	}

	public function editar_password(){
		$info['titulo']='Cambiar Contraseña';
		if($_SERVER['REQUEST_METHOD']=='POST'){
			$new_info=$_POST;
			$user=new User;
			$new_info['id']=$_SESSION['user']['id'];
			//show($new_info);
			if($user->chpsswd($new_info)){
				$info['mensaje']="<script> alert('Contraseña cambiada, inicia sesión'); window.location.href='".ROOT."/login';</script>";
				unset($_SESSION['user']);
				$this->view('editar_password',$info);
			}else{
				$info['errors']=$user->errors;
				$this->view('editar_password',$info);
			}
		}else{
			$this->view('editar_password',$info);
		}
	}

	public function editarinfo(){
		check_sesion();
		if($_SERVER['REQUEST_METHOD']=='POST'){
			show($_POST);
			$contacto['tel']=$_POST['tel'];
			$contacto['email']=$_POST['email'];
			$info['contacto']=json_encode($contacto);
			$info['nombre']=$_POST['nombre'];
			$info['id']=$_SESSION['user']['id'];
			show($info);
			$sql="update vendedores set nombre=:nombre,contacto=:contacto where id=:id";
			$this->query($sql,$info);
			$_SESSION['user']['nombre']=$info['nombre'];
			$_SESSION['user']['contacto']=$info['contacto'];
			redirect('home');
		}
		$user=new User;
		$data=$user->get_info($_SESSION['user']);
		$data['contacto']=json_decode($data['contacto'],TRUE);
		$data['titulo']="Editar info";
		$this->view('editarinfo',$data);
	}

	public function tabla_comentarios(){
		$tabla="<table class='table table-bordered'><thead><tr>
			<th> Autor</th><th>Comentario</th><th>Eliminar</th></tr></thead><tbody>
		";
		$sql="select comentarios.id as cmt_id,comentarios.autor as id_user,vendedores.nombre as autor,comentario from comentarios,vendedores where comentarios.autor=vendedores.id";
		$result=$this->query($sql);
		if(!$result){
			$tabla.="<tr>No hay comentarios</tr>";
		}else{
			while($row=array_shift($result)){
				$tabla.="<tr><td>".$row['autor']."</td><td>".$row['comentario']."</td>";
				$tabla.= ($row['id_user']==$_SESSION['user']['id']) ? "<td><form method='post'> <input name='borrar' type='hidden' value='".$row['cmt_id']."' ><input type='submit' class='btn btn-danger' value='Borrar'></form></td></tr>" : "<td></td></tr>";
			}
		}
		$tabla.="</tbody></table>";
		return $tabla;
	}
}

