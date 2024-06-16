<?php

class banca_usuario

{

	private $resultado;

	private $cnmysql;

	

	public function conectardb(){

		$this->cnmysql = new conectar(DB_HOST,DB_NAME,DB_USER,DB_PASS,DB_CHAR);

	}

	

	public function obtenerUsuario(){

		$sql="select * from usuario_banca";

		$sth = $this->cnmysql->prepare($sql);

		$sth->execute();

		$error = $sth->errorInfo();

		$datos = $sth->fetchAll();

		echo json_encode($datos);

	}

	

	

	public function insertarUsuario($id_cuenta,$nombre_usuario,$usuario_contrasenia)

	{

		$sql="insert into usuario_banca (id_cuenta,nombre_usuario,usuario_contrasenia) values(:id_cuenta,:nombre_usuario,:usuario_contrasenia)";

		$sth = $this->cnmysql->prepare($sql);

		$sth->bindValue('id_cuenta',$id_cuenta,PDO::PARAM_INT);

		$sth->bindValue('nombre_usuario',$nombre_usuario,PDO::PARAM_STR);

		$sth->bindValue('usuario_contrasenia',$usuario_contrasenia,PDO::PARAM_STR);

		$sth->execute();

		$error = $sth->errorInfo();

		$rows = $sth->rowCount();

		$id = $this->cnmysql->lastInsertId();

		$datos=array('status'=>'ok');

		echo json_encode($datos);

	}

	

	public function eliminarUsuario($id)

	{

		$sql="delete from usuario_banca where id_usuario=:id ";

		$sth = $this->cnmysql->prepare($sql);

		$sth->bindValue('id',$id,PDO::PARAM_INT);

		$sth->execute();

		$error = $sth->errorInfo();

		$rows = $sth->rowCount();

	

		$datos=array('status'=>'ok','filas_afectadas'=>$rows);

	   

	    

		echo json_encode($datos);

	}

	

	public function actualizarUsuario($id, $nombre_usuario, $usuario_contrasenia)

	{
		$sql = "UPDATE usuario_banca SET nombre_usuario = :nombre_usuario, usuario_contrasenia = :usuario_contrasenia WHERE id_usuario = :id";

		$sth = $this->cnmysql->prepare($sql);

		$sth->bindValue(':id', $id, PDO::PARAM_INT);

		$sth->bindValue(':nombre_usuario', $nombre_usuario, PDO::PARAM_STR);

		$sth->bindValue(':usuario_contrasenia', $usuario_contrasenia, PDO::PARAM_STR);

		$sth->execute();

		$error = $sth->errorInfo();

		$rows = $sth->rowCount();

		$datos = array('status' => 'ok', 'filas_afectadas' => $rows);

		echo json_encode($datos);
	}
		

}

?>