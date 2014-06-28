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

$error=$_GET['error'];
$pago_id = $_GET['pago_id'];
$cobrador_id = $_GET['cobrador_id'];

if ($error){?>
	<h1>Error al registrar el pago</h1>
	<p>Se ha producido un error inesperado al registrar el pago.</p>
	<a href="reservas_impagas.php">Volver a reservas impagas</a>
<?php
}else{
?>
	<h1>Pago registrado</h1>
	<p>El pago se registr&oacute; correctamente, puede imprimir el recibo si as&iacute; lo desea.</p>
	<a href="imprimir_recibo.php?pago_id=<?php echo $pago_id?>&cobrador_id=<?php echo $cobrador_id?>">Imprimir Recibo</a>
<?php
}

output_trailer() 
?>