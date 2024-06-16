<?php

class cliente
{

	private $resultado;

	private $cnmysql;

	

	public function conectardb(){

		$this->cnmysql = new conectar(DB_HOST,DB_NAME,DB_USER,DB_PASS,DB_CHAR);

	}

	

	public function obtenerCliente(){

		$sql="select * from banco_cliente";

		$sth = $this->cnmysql->prepare($sql);

		$sth->execute();

		$error = $sth->errorInfo();

		$datos = $sth->fetchAll();

		echo json_encode($datos);

	}

	

	

	public function insertarCliente($numero_cliente,$titular_cliente)

	{

		$sql="insert into banco_cliente (numero_cliente,titular_cliente) values(:numero_cliente,:titular_cliente) ";

		$sth = $this->cnmysql->prepare($sql);

		$sth->bindValue('numero_cliente',$numero_cliente,PDO::PARAM_STR);

		$sth->bindValue('titular_cliente',$titular_cliente,PDO::PARAM_STR);

		$sth->execute();

		$error = $sth->errorInfo();

		$rows = $sth->rowCount();

		$id = $this->cnmysql->lastInsertId();

		$datos=array('status'=>'ok');

		echo json_encode($datos);

	}

	

	public function eliminarCliente($id)

	{

		$sql="delete from banco_cliente where id_cliente=:id ";

		$sth = $this->cnmysql->prepare($sql);

		$sth->bindValue('id',$id,PDO::PARAM_INT);

		$sth->execute();

		$error = $sth->errorInfo();

		$rows = $sth->rowCount();

	

		$datos=array('status'=>'ok','filas_afectadas'=>$rows);

	   

	    

		echo json_encode($datos);

	}

	

	public function actualizarCliente($id,$numero_cliente)

	{

		$sql="update banco_cliente set numero_cliente=:numero_cliente where id_cliente=:id ";

		$sth = $this->cnmysql->prepare($sql);

		

		$sth->bindValue('id',$id,PDO::PARAM_INT);

		$sth->bindValue('numero_cliente',$numero_cliente,PDO::PARAM_STR);

	

		$sth->execute();

		$error = $sth->errorInfo();

		$rows = $sth->rowCount();

	

		$datos=array('status'=>'ok','filas_afectadas'=>$rows);

	   

	    

		echo json_encode($datos);

	}

	

}

?>