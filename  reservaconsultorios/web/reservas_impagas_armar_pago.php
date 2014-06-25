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




function generar_tabla_reservas($psicologo_id)
{
    $sql = "SELECT e.id, e.pago_id, u.real_lastname, u.real_name, e.psychologist_id, e.create_by, e.start_time, e.end_time
            FROM  mrbs_entry e, mrbs_users u
            where (e.psychologist_id = $psicologo_id) AND (e.psychologist_id = u.id)AND (e.pago_id is null)
		
        ORDER BY e.timestamp";
    $res = sql_query($sql);
    
    
   //echo "<div id=\"user_list\" class=\"datatable_container\">/n";
   echo "<table class=\"admin_table display\" id=\"users_table\">";
   echo "<thead>";
   echo "<tr><th>ID</th>";
   echo "<th>Reserva para</th>";
   echo "<th>Creada por</th>";
   echo "<th>Fecha Inicio</th>";
   echo "<th>Fecha Fin</th>";
   echo "<th>Pagar <input type=\"checkbox\" class=\"checks\" text-align=\"right\" name=\"select-all\" value=\"\" onclick=\"for(c in document.getElementsByName('pagar[]')) document.getElementsByName('pagar[]').item(c).checked = this.checked\"></th></tr>";
   echo "</thead>";
   echo "<tbody>";
   for ($i = 0; ($row = sql_row_keyed($res, $i)); $i++)
   {
     echo "<tr name=\"".$row['psychologist_id']."\"><td>".$row['psychologist_id']."</td>";
     echo "<td>".$row['real_lastname'].", ".$row['real_name']."</td>";
     echo "<td>".$row['create_by']."</td>";
     echo "<td>".time_date_string($row['start_time'])."</td>";
     echo "<td>".time_date_string($row['end_time'])."</td>";
     echo "<td><input type=\"checkbox\" class=\"checks\" id=\"pagar\" name=\"pagar[]\" value=\"".$row['id']."\"></td></tr>";
     //envío por post el nombre del psicologo que tiene que pagar
     echo "<input type=\"hidden\" id=\"psicologo\" name=\"psicologo\" value=\"".$row['real_lastname'].", ".$row['real_name']." \"> ";
   }
   echo "</tbody>";
   echo "</table>";
   
   //echo "</div>";

    
}


echo "<table class=\"dwm_main\" id=\"week_main\" data-resolution=\"$resolution\">";
//echo $inner_html;
$psicologo = $_POST['f_psychologist_input_id'];
echo "<h3>Pagos de: $psicologo </h3>"; ?>
<form class="form_general" id="main" action="generar_pago.php" method="post">
   
      
      <?php
        
      $psicologo_id = $_POST['psicologo'];
      generar_tabla_reservas($psicologo_id);
        // The Submit button
        
        echo "<div id=\"edit_entry_submit_save\">\n";
		echo "<br/>";
        echo "<input class=\"button default_action\" type=\"submit\" name=\"save_button\" id=\"save_button\" value=\"" .
          "Generar Pago" . "\">\n";
        echo "</div>\n";
        
        
    ?>
   
  </form>
<?php 
echo "</table>\n";

?>


<?php output_trailer() ?>
