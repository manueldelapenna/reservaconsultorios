<?php
// $Id: week.php 2374 2012-08-12 19:11:43Z cimorrison $

// mrbs/week.php - Week-at-a-time view

require "defaultincludes.inc";
require_once "mincals.inc";
require_once "functions_table.inc";
require_once "mrbs_sql.inc";

checkAuthorised();


// print the page header
print_header($day, $month, $year, $area, isset($room) ? $room : "");

// Section with areas, rooms, minicals.

echo "<div id=\"dwm_header\" class=\"screenonly\">\n";
echo "</div>\n";



$fecha = time();
$cobradorId = authGetUserId(getUsername());
$monto_reservas = $_POST['subtotal'];
$descuento = $_POST['descuento'];
$total = $_POST['total'];
$reservasIds = unserialize($_POST['reservasIds']);

$sql= "INSERT INTO mrbs_pago (fecha, cobrador_id, monto_reservas, descuento, total)
		values ($fecha, $cobradorId, $monto_reservas, $descuento, $total)";
sql_command($sql);
$pago_id = sql_insert_id('mrbs_pago', 'id');


foreach($reservasIds as $reservaId){

$sql= "UPDATE mrbs_entry SET pago_id=$pago_id where id = $reservaId";
sql_command($sql);

}
    
output_trailer() ?>