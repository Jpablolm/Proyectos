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

	require_once ROOT . 'banca_usuario.php';

	

	$web_bank = new banca_usuario();

	$web_bank->conectardb();

	

	//var_dump($_REQUEST);

	



	$id_cuenta=$_REQUEST['id_cuenta'];

	$nombre_usuario=$_REQUEST['nombre_usuario'];

	$usuario_contrasenia=$_REQUEST['usuario_contrasenia'];



	

	

	$web_bank->insertarUsuario($id_cuenta,$nombre_usuario,$usuario_contrasenia);







} catch (\Throwable $e) {

	var_dump($e);

} catch (\Exception $e) {

	var_dump($e);

} catch (\Error $e) {

	var_dump($e);

}







?>