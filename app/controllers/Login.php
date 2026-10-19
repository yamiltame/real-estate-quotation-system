<?php

class Login{
	use Controller;
	public function index($URL=[]){
		if(isset($_SESSION['user'])){
			redirect('home');
		}
		$data=[];
		if($_SERVER['REQUEST_METHOD']=='POST'){
			$user=new User;
			$user->login($_POST);
			//si no logra el login manda error
			$user->errors['email']="Datos incorrectos";
			$data['errors'] = $user->errors;
		}
		$this->view('login',$data);
	}


}
 