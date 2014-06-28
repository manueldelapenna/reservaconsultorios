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




function generar_tabla_pagos($psicologo_id)
{
    $sql = "SELECT p.id, p.fecha, u.real_name, u.real_lastname, p.cobrador_id, p.monto_reservas, p.descuento, p.total
            FROM mrbs_pago p join (mrbs_entry e join mrbs_users u)
            WHERE (p.id = e.pago_id) AND (p.cobrador_id = u.id) AND (e.psychologist_id = $psicologo_id)
            GROUP BY  p.id
            ORDER BY p.fecha desc";
    $res = sql_query($sql);
    
    
   //echo "<div id=\"user_list\" class=\"datatable_container\">/n";
   echo "<table class=\"admin_table display\" id=\"users_table\">";
   echo "<thead>";
   echo "<tr><th>ID de pago</th>";
   echo "<th>Fecha</th>";
   echo "<th>Cobrador</th>";
   echo "<th>Monto de las reservas</th>";
   echo "<th>Descuento</th>";
   echo "<th>Total</th>";
   echo "<th>Acción</th>";
   //echo "<th>Pagar <input type=\"checkbox\" class=\"checks\" text-align=\"right\" name=\"select-all\" value=\"\" onclick=\"for(c in document.getElementsByName('pagar[]')) document.getElementsByName('pagar[]').item(c).checked = this.checked\"></th></tr>";
   echo "</thead>";
   echo "<tbody>";
   for ($i = 0; ($row = sql_row_keyed($res, $i)); $i++)
  {
     $nom = $row['real_name'];
     $ap =  $row['real_lastname'];
     $fecha = date_create($row['fecha']);
     $fecha_esp = date_format($fecha, 'd/m/Y');
     echo "<tr name=\"".$row['id']."\"><td>".$row['id']."</td>";
     echo "<td>".$fecha_esp."</td>";
     //echo "<td>".$row['cobrador_id']."</td>";
     echo "<td>".$ap.", ".$nom."</td>";
     echo "<td>$".$row['monto_reservas']."</td>";
     echo "<td>$".$row['descuento']."</td>";
     echo "<td>$".$row['total']."</td>";
     echo "<td><a href=\"imprimir_recibo.php?pago_id=".$row['id']."&cobrador_id=".$row['cobrador_id']."\">Imprimir</a></td></tr>";

   }
   echo "</tbody>";
   echo "</table>";
   
   //echo "</div>";

    
}


echo "<table class=\"dwm_main\" id=\"week_main\" data-resolution=\"$resolution\">";
//echo $inner_html;
$psicologo = $_POST['f_psychologist_input_id'];
echo "<h3>Pagos realizados de: $psicologo </h3>"; ?>
<form class="form_general" id="main" action="generar_pago.php" method="post">
   
      
      <?php
        
      $psicologo_id = $_POST['psicologo'];
      
      generar_tabla_pagos($psicologo_id);
        // The Submit button
        
//        echo "<div id=\"edit_entry_submit_save\">\n";
//		echo "<br/>";
//        echo "<input class=\"button default_action\" type=\"submit\" name=\"save_button\" id=\"save_button\" value=\"" .
//          "Generar Pago" . "\">\n";
//        echo "</div>\n";
        
        
    ?>
   
  </form>
<?php 
echo "</table>\n";

?>


<?php output_trailer() ?>

