<?php
header('Access-Control-Allow-Origin: *');
class conectar extends PDO

{

	public function __construct($host, $dbname, $user, $password, $char)

	{

		parent::__construct(

			'mysql:host=' . $host .

			';dbname=' . $dbname,

			$user,

			$password,

			array(

			PDO::MYSQL_ATTR_INIT_COMMAND => "SET lc_time_names='es_ES',NAMES 'utf8' COLLATE 'utf8_unicode_ci'"

		));

	}

}



?>