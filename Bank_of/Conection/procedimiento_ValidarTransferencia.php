<?php
header('Access-Control-Allow-Origin: *');

class ProcedimientoValidarTransferencia
{
    private $resultado;
    private $cnmysql;

    public function conectardb(){
        $this->cnmysql = new conectar(DB_HOST,DB_NAME,DB_USER,DB_PASS,DB_CHAR);
    }

    public function llamarProcedimiento_ValidarTransferencia($titular_cuenta,$numero_banca_cuenta,$numero_cuenta,$deposito_pago,$descripcion)
    {   
        $sql="CALL ValidarTransferencia(:titular_cuenta,:numero_banca_cuenta,:numero_cuenta,:deposito_pago,:descripcion)";
        $sth = $this->cnmysql->prepare($sql);
        $sth->bindValue('titular_cuenta',$titular_cuenta,PDO::PARAM_STR);
        $sth->bindValue('numero_banca_cuenta',$numero_banca_cuenta,PDO::PARAM_INT);
        $sth->bindValue('numero_cuenta',$numero_cuenta,PDO::PARAM_INT);
        $sth->bindValue('deposito_pago',$deposito_pago,PDO::PARAM_STR);
        $sth->bindValue('descripcion',$descripcion,PDO::PARAM_STR);
        $sth->execute();
        $error = $sth->errorInfo();
        $rows = $sth->rowCount();
        $id = $this->cnmysql->lastInsertId();
        
        $resultado = $sth->fetch(PDO::FETCH_ASSOC);

        $response = array();
        
        if (isset($resultado['MensajeNumeroAutorizacion'])) {
            $response['mensaje'] = $resultado['MensajeNumeroAutorizacion']; 
        } elseif (isset($resultado['Mensaje_saldo_insuficiente'])) {
            $response['mensaje'] = $resultado['Mensaje_saldo_insuficiente']; 
        } elseif (isset($resultado['Mensaje_numero_cuenta_terceros_no_coincide'])) {
            $response['mensaje'] = $resultado['Mensaje_numero_cuenta_terceros_no_coincide']; 
        } elseif (isset($resultado['Mensaje_no_coinciden_los_datos'])) {
            $response['mensaje'] = $resultado['Mensaje_no_coinciden_los_datos']; 
        } else {
            $response['mensaje'] = 'Error: No se pudo realizar la trasferencia'; 
        }
        
        echo json_encode($response);
    }
}
?>