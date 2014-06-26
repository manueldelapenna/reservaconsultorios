<?php
// $Id: week.php 2374 2012-08-12 19:11:43Z cimorrison $

// mrbs/week.php - Week-at-a-time view

require "defaultincludes.inc";
require_once "mincals.inc";
require_once "functions_table.inc";
require_once "mrbs_sql.inc";
require('database.php');

checkAuthorised();

$fecha = time();
$cobradorId = authGetUserId(getUsername());
$monto_reservas = $_POST['subtotal'];
$descuento = $_POST['descuento'];
$total = $_POST['total'];
$reservasIds = unserialize($_POST['reservasIds']);

$conn=mysqli_connect($host,$username,$password,$databasename);
// Check connection
if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

$error=0;

//chequea si las reservas están pagas (por si se recarga la página)
$chequeaReservaPaga = $reservasIds[0];

$sql= "select * from mrbs_entry
	   where id = $chequeaReservaPaga and pago_id is null";
$result=mysqli_query($conn,$sql);

$noEstanPagas = mysqli_num_rows($result);

if(!$noEstanPagas){
	$error = 1;
}


	/* disable autocommit */
	mysqli_autocommit($conn, FALSE);

	$sql= "INSERT INTO mrbs_pago (fecha, cobrador_id, monto_reservas, descuento, total)
			values ($fecha, $cobradorId, $monto_reservas, $descuento, $total)";
	$result=mysqli_query($conn,$sql);
	$pago_id = mysqli_insert_id($conn);

	if(!$result){
		$error=1;
	}

	foreach($reservasIds as $reservaId){

		$sql= "UPDATE mrbs_entry SET pago_id=$pago_id where id = $reservaId";
		$result=mysqli_query($conn,$sql);
		if(!$result){
			$error=1;
		}
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
	header("Location: pago_finalizado.php?error=$error&pago_id=$pago_id");
?>