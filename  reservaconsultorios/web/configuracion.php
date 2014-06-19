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


// print the page header
print_header($day, $month, $year, $area, isset($room) ? $room : "");

// Section with areas, rooms, minicals.

echo "<div id=\"dwm_header\" class=\"screenonly\">\n";


echo "</div>\n";

function getValorConsultorio()
{
    $sql = "SELECT precio
            FROM mrbs_valor_consultorio";
    $res = sql_query($sql);
	
    $precio = sql_row_keyed($res, 0);
   
	return $precio['precio'];
}

function getCantidadMaxReservas()
{
    $sql = "SELECT cantidad
            FROM mrbs_cantidad_max_reservas";
    $res = sql_query($sql);
	
    $cantidad = sql_row_keyed($res, 0);
   
	return $cantidad['cantidad'];
}


echo "<table class=\"dwm_main\" id=\"week_main\" data-resolution=\"$resolution\">";
//echo $inner_html;
echo "<h3>Configuración del Sistema</h3>"; ?>
<form class="form_general" id="main" action="actualizar_configuracion.php" method="post">
    <table>
		<tr>
			<td>Valor consultorio:</td>
			<td>
				<input name="valorConsultorio" size=6 value=<?php echo getValorConsultorio();?>>
			</td>
		</tr>
		<tr>
			<td>Cantidad máxima de reservas por Psicólogo:</td>
			<td>
				<input name="cantidadMaxReservas" size=6 value=<?php echo getCantidadMaxReservas();?>>
			</td>
		</tr>
	</table>
		<?
        // The Submit button
        echo "<div id=\"edit_entry_submit_save\">\n";
        echo "<input class=\"button default_action\" type=\"submit\" name=\"save_button\" value=\"" .
          "Actualizar configuración" . "\">\n";
		echo "<input class=\"button default_action\" onclick=\"window.location.href='index.php'\" type=\"button\" value=\"" .
          "Cancelar" . "\">\n";
        echo "</div>\n";
    ?>
	
  </form>
<?php 
echo "</table>\n";

?>


<?php output_trailer() ?>