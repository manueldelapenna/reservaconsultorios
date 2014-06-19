<?php
// $Id: week.php 2374 2012-08-12 19:11:43Z cimorrison $

// mrbs/week.php - Week-at-a-time view

require "defaultincludes.inc";
require_once "mincals.inc";
require_once "functions_table.inc";
require_once "mrbs_sql.inc";

// Get non-standard form variables
$timetohighlight = get_form_var('timetohighlight', 'int');
$ajax = get_form_var('ajax', 'int');

// Check the user is authorised for this page
checkAuthorised();

$precio = $_POST['valorConsultorio'];
$cantidad = $_POST['cantidadMaxReservas'];

$sql = "UPDATE mrbs_valor_consultorio
		SET precio=$precio
		WHERE id=1";
$res = sql_query($sql);

$sql = "UPDATE mrbs_cantidad_max_reservas
		SET cantidad=$cantidad
		WHERE id=1";
$res = sql_query($sql);

// print the page header
print_header($day, $month, $year, $area, isset($room) ? $room : "");

// Section with areas, rooms, minicals.

echo "<div id=\"dwm_header\" class=\"screenonly\">\n";


echo "</div>\n";

echo "<h3>Los cambios se realizaron correctamente</h3>";
echo "<input class=\"button default_action\" onclick=\"window.location.href='index.php'\" type=\"button\" value=\"" .
          "Volver a inicio" . "\">\n";

output_trailer() ?>