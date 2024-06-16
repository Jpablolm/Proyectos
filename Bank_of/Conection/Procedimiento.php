<?php
header('Access-Control-Allow-Origin: *');
class Procedimiento

{

	private $resultado;

	private $cnmysql;

	

	public function conectardb(){

		$this->cnmysql = new conectar(DB_HOST,DB_NAME,DB_USER,DB_PASS,DB_CHAR);

	}

	

	

	public function llamarProcedimiento_Tarjeta($numero_tarjeta,$fecha_vencimiento,$codigo_seguridad,$titular,$deposito_transaccion,$descripcion)

	{

		$sql="CALL ValidatePagoTarjeta(:numero_tarjeta,:fecha_vencimiento,:codigo_seguridad,:titular,:deposito_transaccion,:descripcion)";

		$sth = $this->cnmysql->prepare($sql);

		$sth->bindValue('numero_tarjeta',$numero_tarjeta,PDO::PARAM_INT);

		$sth->bindValue('fecha_vencimiento',$fecha_vencimiento,PDO::PARAM_STR);

		$sth->bindValue('codigo_seguridad',$codigo_seguridad,PDO::PARAM_INT);

		$sth->bindValue('titular',$titular,PDO::PARAM_STR);

		$sth->bindValue('deposito_transaccion',$deposito_transaccion,PDO::PARAM_STR);

		$sth->bindValue('descripcion',$descripcion,PDO::PARAM_STR);

		$sth->execute();

		$error = $sth->errorInfo();

		$rows = $sth->rowCount();

		$id = $this->cnmysql->lastInsertId();

		

		$resultado = $sth->fetch(PDO::FETCH_ASSOC);



        // Preparar la respuesta JSON

        $datos = array(

            'mensaje' => $resultado['Mensaje']

        );

		

		// Enviar la respuesta JSON

        echo json_encode($datos);

	}

	

	

}

?>



