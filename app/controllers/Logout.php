<?php
class Logout{
	use Controller;
	public function index($URL=[]){
		if(!empty($_SESSION['user'])){
			unset($_SESSION['user']);
		}
		redirect('login');
	}

	public function chpss(){
		if(!empty($_SESSION['user'])){
			unset($_SESSION['user']);
		}
		redirect('login/index/chpass');
	}
}