<?php
class User{
	use Model;
	protected $table = 'vendedores';
	protected $allowedColumns =['nombre','email','password'];
	
	//Diccionario con los valores de los departamentos.
	public $departamentos=['Informática','Jurídico','Administrativo','Comercial'];
	public $permisos=['Administrador','Jefe de departamento','Usuario'];
	public $info=[];

	public function get_info($sesion){
		$informacion=$sesion;
		return $informacion;
	}

	public function validar_duplicados($nombre,$email){
		$result=$this->query("select count(*) as names from usuarios where nombre= :nombre",['nombre'=>$nombre]);
		if($result && $result[0]['names']){
			$this->errors['dname']="Nombre registrado! escoge otro";
		}
		$result=$this->query("select count(*) as emails from usuarios where email= :email",['email'=>$email]);
		if($result && $result[0]['emails']){
			$this->errors['demail']="Email registrado! escoge otro";
		}
	}

//funcion para insertar nuevo usuario
	public function insertar_usuario($data){
		$insertar=$data;
		$this->errors=[];
		if($data['password']!=$data['confpasswd']){
			$this->errors['psswd']="No coinciden las contraseñas!";
		}else{
			//si coinciden, encriptar psswd
			$insertar['password']=password_hash($data['password'], PASSWORD_DEFAULT);
			unset($insertar['confpasswd']);
			//show($insertar);
			//checar si el nombre es duplicado;
			$this->validar_duplicados($insertar['nombre'],$insertar['email']);
		}
		if(empty($this->errors)){
			$this->insertar($insertar);
			return true;
		}else{
			return false;
		}

	}
 
//funcion para iniciar sesión
	public function login($data){
		$query="select * from $this->table where nombre= :email";
		$row=$this->query($query,['email'=>$data['email']]);
		//si se hace la consulta
		if($row){
			//verificar el psswd
			if(password_verify($data['password'],$row[0]['password'])){
				$_SESSION['user']=$row[0];
				unset($_SESSION['user']['password']);
				redirect('home');
			}
		}
	}

	public function chpsswd($data){
		$this->errors=[];
		$query="select password from $this->table where id= :id";
		//show($data);
		$row=$this->query($query,['id'=>$data['id']]);
		//si se hace la consulta
		if($row){
			//verificar el psswd
			if(password_verify($data['old'],$row[0]['password'])){
				if($data['conf']==$data['new']){
					$this->editar(
						['password'=>password_hash($data['new'],PASSWORD_DEFAULT)],
						$data['id']
					);
				}else{
					$this->errors['conf']="No se pudo confirmar el password!";
				}
			}else{
				$this->errors['psswd']="Contraseña incorrecta!!";
			}
		}
		return empty($this->errors) ? true : false;
	}

	public function selectDpto($default){
		$form="
    		<select class='form-select' aria-label='selecciona departamento' name='departamento'>";
    	foreach($this->departamentos as $index=>$dpto){
    		$form.="<option value=".$index;
    		if($index==$default){
    			$form.=" selected>".$dpto."</option>";
    		}else{
    			$form.=">".$dpto."</option>";    			
    		}
    		">".$dpto."</option>";
    	}
    	$form.="</select>";
    	return $form;
	}

	public function selectPermiso($default){
		$form="
    		<select class='form-select' aria-label='selecciona departamento' name='permiso'>";
    	foreach($this->permisos as $index=>$perm){
    		$form.="<option value=".$index;
    		if($index==$default){
    			$form.=" selected>".$perm."</option>";
    		}else{
    			$form.=">".$perm."</option>";    			
    		}
    	}
    	$form.="</select>";
    	return $form;
	}

//función que genera las opciones para la barra nav
	public function opciones($user){
		$dpto=$user['departamento'];
		$permiso=$user['permiso'];
		$options="";
		switch($permiso){
			case 0: //es Admin
				$options="
				<a class='nav-link fw-bold py-1 px-0' href='".ROOT."/usuarios'>Usuarios</a>
				<a class='nav-link fw-bold py-1 px-0' href='".ROOT."/procesos'>Procesos</a>
				";
				break;
			case 1: //Jefe Dpto
				$options="
				<a class='nav-link fw-bold py-1 px-0' href='".ROOT."/usuarios'>Usuarios</a>
				<a class='nav-link fw-bold py-1 px-0' href='".ROOT."/procesos'>Procesos</a>
				";
		}
		switch($dpto){
			//opciones para informática
			case 0: 
				break;
			//opciones para juridico
			case 1:
				break;
			//opciones para administrativa
			case 2:
				break;
			//opciones comercial
			case 3:
				break;
			default:
				break;
		}
		return $options;
	}
} 