<?php
header('Access-Control-Allow-Origin: *');
class cuenta_monetaria

{

	private $resultado;

	private $cnmysql;

	

	public function conectardb(){

		$this->cnmysql = new conectar(DB_HOST,DB_NAME,DB_USER,DB_PASS,DB_CHAR);

	}

	

	public function obtenerCuenta(){

		$sql="select * from banco_cliente_cuenta_banca";

		$sth = $this->cnmysql->prepare($sql);

		$sth->execute();

		$error = $sth->errorInfo();

		$datos = $sth->fetchAll();

		echo json_encode($datos);

	}

	

	

	public function insertarCuenta($numero_cuenta,$fecha_apertura,$titular_cuenta,$saldo_disponible)

	{

		$sql="insert into banco_cliente_cuenta_banca (numero_cuenta,fecha_apertura,titular_cuenta,saldo_disponible) values(:numero_cuenta,:fecha_apertura,:titular_cuenta,:saldo_disponible) ";

		$sth = $this->cnmysql->prepare($sql);

		$sth->bindValue('numero_cuenta',$numero_cuenta,PDO::PARAM_STR);

		$sth->bindValue('fecha_apertura',$fecha_apertura,PDO::PARAM_STR);

		$sth->bindValue('titular_cuenta',$titular_cuenta,PDO::PARAM_STR);

		$sth->bindValue('saldo_disponible',$saldo_disponible,PDO::PARAM_STR);

		$sth->execute();

		$error = $sth->errorInfo();

		$rows = $sth->rowCount();

		$id = $this->cnmysql->lastInsertId();

		$datos=array('status'=>'ok');

		echo json_encode($datos);

	}

	

	public function eliminarCuenta($id)

	{

		$sql="delete from banco_cliente_cuenta_banca where id_cuenta=:id ";

		$sth = $this->cnmysql->prepare($sql);

		$sth->bindValue('id',$id,PDO::PARAM_INT);

		$sth->execute();

		$error = $sth->errorInfo();

		$rows = $sth->rowCount();

	

		$datos=array('status'=>'ok','filas_afectadas'=>$rows);

	   

	    

		echo json_encode($datos);

	}

	

	public function actualizarCuenta($id,$saldo_disponible)

	{

		$sql="update banco_cliente_cuenta_banca set saldo_disponible=:saldo_disponible where id_cuenta=:id ";

		$sth = $this->cnmysql->prepare($sql);

		

		$sth->bindValue('id',$id,PDO::PARAM_INT);

		$sth->bindValue('saldo_disponible',$saldo_disponible,PDO::PARAM_STR);

	

		$sth->execute();

		$error = $sth->errorInfo();

		$rows = $sth->rowCount();

	

		$datos=array('status'=>'ok','filas_afectadas'=>$rows);

	   

	    

		echo json_encode($datos);

	}

	

}

?>