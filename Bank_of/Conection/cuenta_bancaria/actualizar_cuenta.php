<?php
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
	require_once ROOT . 'cuenta_monetaria.php';
	
	$web_bank = new cuenta_monetaria();
	$web_bank->conectardb();
	
	//var_dump($_REQUEST);
	

	$id_cuenta=$_REQUEST['id_cuenta'];
	$saldo_disponible=$_REQUEST['saldo_disponible'];

	
	$web_bank->actualizarCuenta($id_cuenta,$saldo_disponible);



} catch (\Throwable $e) {
	var_dump($e);
} catch (\Exception $e) {
	var_dump($e);
} catch (\Error $e) {
	var_dump($e);
}



?>