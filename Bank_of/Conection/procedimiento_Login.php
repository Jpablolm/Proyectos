<?php
header('Access-Control-Allow-Origin: *');
class ProcedimientoLogin
{
	private $resultado;
	private $cnmysql;
	
	public function conectardb(){
		$this->cnmysql = new conectar(DB_HOST,DB_NAME,DB_USER,DB_PASS,DB_CHAR);
	}
	
	
	public function llamarProcedimiento_Login($nombre_usuario,$usuario_contrasenia)
	{
		$sql="CALL autenticar_usuario(:nombre_usuario,:usuario_contrasenia)";
		$sth = $this->cnmysql->prepare($sql);
		$sth->bindValue('nombre_usuario',$nombre_usuario,PDO::PARAM_STR);
		$sth->bindValue('usuario_contrasenia',$usuario_contrasenia,PDO::PARAM_STR);
		$sth->execute();
		$error = $sth->errorInfo();
		$rows = $sth->rowCount();
		$id = $this->cnmysql->lastInsertId();
		
		$resultado = $sth->fetch(PDO::FETCH_ASSOC);

        // Preparar la respuesta JSON
            if (isset($resultado['MensajeValidar'])) {
                $mensaje = $resultado['MensajeValidar'];
            } elseif (isset($resultado['MensajeNoValidar'])) {
                $mensaje = $resultado['MensajeNoValidar'];
            } else {
                $mensaje = 'Error: No se pudo autorizar el Login';
            }
            
        $datos = array('mensaje' => $mensaje);
		
		// Enviar la respuesta JSON
        echo json_encode($datos);
	}
	
	
}
?>