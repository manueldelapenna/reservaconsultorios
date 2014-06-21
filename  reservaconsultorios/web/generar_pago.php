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

echo "<table class=\"dwm_main\" id=\"week_main\" data-resolution=\"$resolution\">";
//echo $inner_html;
echo "<h3>Confirmar Pago</h3>"; 

function get_reserva($id,&$comienzo,&$fin){
    
    $sql = "SELECT *
            FROM mrbs_entry e
            where e.id = $id";
    
    $result = sql_query($sql);
    $row = sql_row_keyed($result, 0); //me quedo con la unica fila de la consulta
    $comienzo = time_date_string($row['start_time']);
    $fin = time_date_string($row['end_time']);
    
       
}

function get_precio_reserva(){
    
    $sql= "SELECT v.precio
           FROM mrbs_valor_consultorio v";
    $res = sql_query($sql);
    $row = sql_row_keyed($res, 0);
    return ($row['precio']);
    
}

$pagos = $_POST['pagar'];
if ($pagos){
    
    echo "<div>";
     echo "Hora y Fecha: ".time_date_string(time())."<br>";
     echo "Reservas a pagar: ".count($pagos);
     echo "<br>";
      echo "Profesional: ".$_POST['psicologo']."<br>";
      echo "Cobrador/a: ".getUserName()."<br>";
      echo "Detalle de las reservas: <br>";
      foreach ($pagos as $pago){
        get_reserva($pago,$comienzo, $fin);
        echo "Comienzo: ".$comienzo." - Fin: ".$fin." Precio: $".  get_precio_reserva()."<br>";
        
      }
      $subtotal = get_precio_reserva()*count($pagos);
      echo "Subtotal: $".$subtotal."<br>";
      $descuento = 0;
      echo "Descuento: $".$descuento."<br>";
      $total = $subtotal - $descuento;
      echo "Total a Pagar: $".$total."<br>";
     echo "</div>"; 
     
     echo "<div id=\"edit_entry_submit_save\">\n";
		echo "<br/>";
        echo "<input class=\"button default_action\" type=\"button\" name=\"save_button\" id=\"save_button\" value=\"" .
          "Garpar" . "\">\n";
        echo "</div>\n";
}
else {echo "No se seleccionaron reservas para pagar";}

//var_dump($_POST['3']); 
//die;

?>

<?php 
echo "</table>\n";

?>


<?php output_trailer() ?>