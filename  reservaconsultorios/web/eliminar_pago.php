<?php


require "defaultincludes.inc";
require_once "mincals.inc";
require_once "functions_table.inc";
require_once "mrbs_sql.inc";
require('database.php');

checkAuthorised();

$pago_id = $_GET['pago_id'];
$psicologo = $_GET['psicologo_id'];
$f_psychologist_id = $_GET['psicologo'];


$conn=mysqli_connect($host,$username,$password,$databasename);
// Check connection
if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

$error=0;

//chequea que el pago exista (por si se recarga la p�gina)

$sql= "select * from mrbs_pago
	   where id = $pago_id";
$result=mysqli_query($conn,$sql);

$existe = mysqli_num_rows($result);

if(!$existe){
	$error = 1;
}


	/* disable autocommit */
	mysqli_autocommit($conn, FALSE);

	$sql= "UPDATE mrbs_entry set pago_id = null where pago_id = $pago_id";
	$result=mysqli_query($conn,$sql);

	if(!$result){
		$error=1;
	}


	$sql= "DELETE FROM mrbs_pago where id = $pago_id";
	$result=mysqli_query($conn,$sql);
	if(!$result){
			$error=1;
	}
	

	if($error) {
		mysqli_rollback($conn);
		
		//$mensaje = 'Se produjo un error al registrar el pago.';
		header('location:pago_error.php');
	} else {
		mysqli_commit($conn);	
		
		//$mensaje = 'El pago se ha registrado correctamente, puede generar el recibo si lo desea.';
		
	}
	mysqli_close($conn);
	header("Location:pagos_realizados_ver_pagos.php?psicologo=".$psicologo."&f_psychologist_id=".$f_psychologist_id);
?>

