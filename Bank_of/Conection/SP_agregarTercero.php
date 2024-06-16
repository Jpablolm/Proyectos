<?php

header('Access-Control-Allow-Origin: *');



class SP_agregarTercero

{

    private $resultado;

    private $cnmysql;



    public function conectardb(){

        $this->cnmysql = new conectar(DB_HOST,DB_NAME,DB_USER,DB_PASS,DB_CHAR);

    }



    public function llamarProcedimiento_AgregarTercero($titular_cuenta,$numero_tercero,$titular_tercero)

    {

        $sql="CALL Verificar_agregar_tercero(:titular_cuenta,:numero_tercero,:titular_tercero)";

        $sth = $this->cnmysql->prepare($sql);

        $sth->bindValue('titular_cuenta',$titular_cuenta,PDO::PARAM_STR);

        $sth->bindValue('numero_tercero',$numero_tercero,PDO::PARAM_INT);

        $sth->bindValue('titular_tercero',$titular_tercero,PDO::PARAM_STR);

        $sth->execute();

        $error = $sth->errorInfo();

        $rows = $sth->rowCount();

        $id = $this->cnmysql->lastInsertId();

        

        $resultado = $sth->fetch(PDO::FETCH_ASSOC);



        $response = array();



        if (isset($resultado['MensajeVerificarTercero'])) {

            $response['mensaje'] = $resultado['MensajeVerificarTercero']; 

        } elseif (isset($resultado['MensajeError'])) {

            $response['mensaje'] = $resultado['MensajeError'];

        } elseif (isset($resultado['MensajeNoValidarTercero'])) {

            $response['mensaje'] = $resultado['MensajeNoValidarTercero'];

        } elseif (isset($resultado['MensajeNoValidar'])) {

            $response['mensaje'] = $resultado['MensajeNoValidar']; 

        } else {

            $response['mensaje'] = 'Error: No se pudo agregar al Tercero'; 

        }



        echo json_encode($response);

    }

}

?>