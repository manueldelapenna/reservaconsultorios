<?php

require("../../../database.php");


if (isset($_SERVER['HTTP_X_REQUESTED_WITH']) AND strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) === 'xmlhttprequest') 
{
	
	require_once("../autocompletar.class.php");
	$search = $_POST["f_psychologist_id"];

	$autocompletar = new Autocompletar($host,$databasename,$username,$password);
	$autocompletar->findData($search);
}