<?php
 
class Lotes{
	use Controller;
	use Database;
	public function index($URL=[]){
		//show($_POST);
		$data['titulo']="Lotes ".$_POST['nombre'];
		$data['desarrollo']=$_POST['nombre'];
		$data['d_id']=$_POST['desarrollo'];
		$data['lotes_json']=$this->get_lotes($_POST['desarrollo']);
		$data['clientes']=$this->clientes();
		$this->view('lotes',$data);
	}

	function get_lotes($desarrollo){
		$res=$this->query("select id,manzana,num,superficie,precio,meses_12,meses_24,friendsnfamily,(select nombre from clientes where lotes.apartado=clientes.id) as apartado,archivo from lotes where desarrollo=".$desarrollo." and !vendido");
		$lotes=[];
		$res2=$this->query("select * from esquemas");
		$esquemas=[];
		foreach($res2 as $e){
			$esquemas[]=$e;
		} 
		if(!$res){
			$manzanas="No hay registros";
		}else{
			foreach($res as $row){
				$inf['archivo']=$row['archivo'];
				$inf['id']=$row['id'];
				$inf['superficie']=$row['superficie'];
				$inf['contado']=money_fmt($row['precio']);
				$inf['meses_12']=money_fmt($row['meses_12']);
				$inf['meses_24']=money_fmt($row['meses_24']);
				if($row['friendsnfamily']!=0){
					$inf['friendsnfamily']=money_fmt($row['friendsnfamily']);
				}else{ $inf['friendsnfamily']='No Disponible';}
				/*foreach($esquemas as $e){
					$inf[$e['nombre']]=money_fmt(round($row['precio']*(1-$e['descuento']/100)*(1+$e['interes']/100)));
				}*/
				$inf['apartado']=$row['apartado'] ?? "";
				$lotes[$row['manzana']][$row['num']]=$inf;
			}
		}
		$lotes=json_encode($lotes);
		return $lotes;
	}

	public function clientes(){
		$res=$this->query("select id,nombre from clientes order by nombre asc");
		$form="<form method='post' action='".ROOT."/lotes/apartar'><select name='cliente' required><option value='' class='form-control' selected>--cliente</option>";
		foreach($res as $client){
			$form.="<option value='".$client['id']."'>".$client['nombre']."</option>";
		}
		$form.="</select><br><button type='submit' class='btn btn-danger'>Apartar</button>";
		return $form;
	}

	public function liberar(){
		$query="update lotes set apartado=0 where id=:id";
		$this->query($query,['id'=>$_POST['liberar']]);
		$data['titulo']='Lotes';
		$data['desarrollo']=$_POST['nombre'];
		$data['d_id']=$_POST['d_id'];
		$data['lotes_json']=$this->get_lotes($_POST['d_id']);
		$data['clientes']=$this->clientes();
		$this->view('lotes',$data);
	}

	public function apartar(){
		if($_POST['cliente']!=''){
			$query="update lotes set apartado=:cliente where id=:id";
			$this->query($query,['cliente'=>$_POST['cliente'],'id'=>$_POST['apartar']]);
		}
		$data['titulo']='Lotes';
		$data['desarrollo']=$_POST['nombre'];
		$data['d_id']=$_POST['d_id'];
		$data['lotes_json']=$this->get_lotes($_POST['d_id']);
		$data['clientes']=$this->clientes();
		$this->view('lotes',$data);
	}

	public function editar(){
	}

	public function registrar(){
	}

	public function tabla_lotes(){
	}
}

