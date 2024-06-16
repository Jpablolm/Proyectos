<?php
header('Access-Control-Allow-Origin: *');
error_reporting(E_ALL);
define('DS', DIRECTORY_SEPARATOR);
define('ROOT', realpath(dirname(__FILE__)) . DS);

try {
	define('BASE_URL', 'http://webuspg.online/');
	define('DB_HOST', 'localhost');
	define('DB_USER', 'pbhhwfte_bank_official');
	define('DB_PASS', 'Everise$2023.');
	define('DB_NAME', 'pbhhwfte_Bank_official');
	define('DB_CHAR', 'utf8');
	
	
	require_once ROOT . 'conectar.php';
	require_once ROOT . 'SP_agregarTercero.php';
	
	$web_bank = new SP_agregarTercero();
	$web_bank->conectardb();
	
    	//var_dump($_REQUEST);

    	$titular_cuenta = $_REQUEST['titular_cuenta'];
    	$numero_tercero = $_REQUEST['numero_tercero'];
    	$titular_tercero = $_REQUEST['titular_tercero'];
	
	
	$respuesta = $web_bank->llamarProcedimiento_AgregarTercero($titular_cuenta,$numero_tercero,$titular_tercero);
	


} catch (\Throwable $e) {
	var_dump($e);
} catch (\Exception $e) {
	var_dump($e);
} catch (\Error $e) {
	var_dump($e);
}



?>