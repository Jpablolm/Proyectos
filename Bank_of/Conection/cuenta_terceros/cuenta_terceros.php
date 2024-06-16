<?php

class cuenta_terceros

{

	private $resultado;

	private $cnmysql;

	

	public function conectardb(){

		$this->cnmysql = new conectar(DB_HOST,DB_NAME,DB_USER,DB_PASS,DB_CHAR);

	}

	

	public function obtenerTercero(){

		$sql="select * from banco_transferencia";

		$sth = $this->cnmysql->prepare($sql);

		$sth->execute();

		$error = $sth->errorInfo();

		$datos = $sth->fetchAll();

		echo json_encode($datos);

	}

}

?>