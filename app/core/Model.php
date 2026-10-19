<?php  
Trait Model{
	use Database;
	protected $limit =10;
	protected $offset =0;
	public $errors=[];


	public function where($data=[],$data_not=[]){
		//show($data);
		//show($data_not);
		$keys=array_keys($data);
		$keys_not=array_keys($data_not);
		$query="select * from $this->table ";
		$query.= !empty($datos) ? "where " : "";
		foreach($keys as $key){
			$query.=$key."= :".$key." && ";
		}
		foreach($keys_not as $key_not){
			$query.=$key_not."!= :".$key_not." && ";
		}
		$query=trim($query," && ");
		$query.=" limit $this->limit offset $this->offset";
		$data=array_merge($data,$data_not);
		//echo $query;
		return $this->query($query,$data);
	}
	public function insertar($data){
		$keys=array_keys($data);
		$query="insert into $this->table (".implode(",",$keys).") values (:".implode(",:",$keys).")";
		return $this->query($query,$data);
	}
	
	public function editar($data,$id){
		$keys=array_keys($data);
		$query="update $this->table set ";
		foreach($keys as $key){
			$query.= $key."= :".$key.",";
		}
		$query=trim($query,',');
		$query.=" where id= :id";
		$data['id']=$id;
		return $this->query($query,$data);

	}
	public function borrar($id){
		$query="delete from $this->table where id= :id";
		$this->query($query,['id'=>$id]);

	}
	public function inputDiv($values){
		//show($values);
		$div="<div clas='form-group'><label for='input".$values['name']."'> ".$values['name']."</label><input name='".$values['name']."' type='".$values['type']."' class='form-control' id='".$values['name']."Id' aria-describedby=".$values['name']."Help value=".$valores['default']."><small id='".$values['name']."Help' class='form-text text-muted'>".$values['ayuda']."</small></div>";
		return $div;
	}
}