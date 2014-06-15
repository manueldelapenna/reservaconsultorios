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

function create_field_entry_psychologist_id($disabled=FALSE)
{
  echo "<div id=\"div_psychogist_id\">\n";
  //desactiva el select si no es usuario administrador
  $deactivate_select = authGetUserLevel(getUserName()) == 1;
  
  $sql = "SELECT u.id, u.name, u.real_name, u.real_lastname
            FROM mrbs_users u
			where u.level = 1
        ORDER BY u.real_lastname, u.real_name";
  $res = sql_query($sql);
  
  echo "<label>Psicólogo:</label>";
  echo"<select name='f_psychologist_id'>";
  
//  if(!$deactivate_select){
//	echo "<option selected value='-1'></option>";
//  }
  
  for ($i = 0; ($row = sql_row_keyed($res, $i)); $i++)
  {
   $id=$row['id'];
   $name=$row['real_lastname'].', '.$row['real_name'];
   if (authGetUserId(getUserName()) == $id){
		echo "<option selected value=$id>$name</option>";
	}else{
		if ($deactivate_select){
			echo "<option hidden='hidden'value=$id>$name</option>";
		}else{
			echo "<option value=$id>$name</option>";
		}
	}
   
   }
   echo "</select>";
  

  echo "</div>\n";
}

//genera el input para buscar con ajax
function create_input_field_entry_psychologist_id($disabled=FALSE)
{
  echo "<div id=\"div_psychogist_id\">\n";
  //desactiva el select si no es usuario administrador
  $deactivate_select = authGetUserLevel(getUserName()) == 1;
  
  $sql = "SELECT u.id, u.name, u.real_name, u.real_lastname
            FROM mrbs_users u
			where u.level = 1
        ORDER BY u.real_lastname, u.real_name";
  $res = sql_query($sql);
  
  echo "<label>Psicólogo:</label>";
  echo"<input id=\"inupt_ajax\" name=\"f_psychologist_input_id\">";
  
//  if(!$deactivate_select){
//	echo "<option selected value='-1'></option>";
//  }
  
//  for ($i = 0; ($row = sql_row_keyed($res, $i)); $i++)
//  {
//   $id=$row['id'];
//   $name=$row['real_lastname'].', '.$row['real_name'];
//   if (authGetUserId(getUserName()) == $id){
//		echo "<option selected value=$id>$name</option>";
//	}else{
//		if ($deactivate_select){
//			echo "<option hidden='hidden'value=$id>$name</option>";
//		}else{
//			echo "<option value=$id>$name</option>";
//		}
//	}
//   
//   }
//   echo "</select>";
  echo "<br>";
  echo "<div id=\"busqueda\">";
  echo "</div>";

  echo "</div>\n";
}

function generar_tabla_reservas($disable=FALSE)
{
    
    $sql = "SELECT u.real_lastname, u.real_name, e.psychologist_id, e.create_by, e.start_time, e.end_time
            FROM mrbs_entry e, mrbs_users u
            where e.psychologist_id = u.id
		
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
   echo "<th>Pagar</th></tr>";
   echo "</thead>";
   echo "<tbody>";
   for ($i = 0; ($row = sql_row_keyed($res, $i)); $i++)
   {
     echo "<tr><td>".$row['psychologist_id']."</td>";
     echo "<td>".$row['real_lastname'].", ".$row['real_name']."</td>";
     echo "<td>".$row['create_by']."</td>";
     echo "<td>".time_date_string($row['start_time'])."</td>";
     echo "<td>".time_date_string($row['end_time'])."</td>";
     echo "<td><input type=\"checkbox\" name=\"pagar\" value=\"\"></td></tr>";
   }
   echo "</tbody>";
   echo "</table>";
   //echo "</div>";

    
}


echo "<table class=\"dwm_main\" id=\"week_main\" data-resolution=\"$resolution\">";
//echo $inner_html;
echo "<h3>Aca va a ir el sistema de pagos pdf...</h3>"; ?>
<form class="form_general" id="main" action="prueba_procesa_pagopdf.php" method="post">
    <fieldset>
    <legend><?php echo get_vocab($token); ?></legend>
      <?php create_field_entry_psychologist_id(); ?> 
      <?php create_input_field_entry_psychologist_id(); ?>
      <?php
        // The Submit button
        echo "<br>";
        echo "<div id=\"edit_entry_submit_save\">\n";
        echo "<input class=\"button default_action\" type=\"submit\" name=\"save_button\" value=\"" .
          "Generar Pago" . "\">\n";
        echo "</div>\n";
    ?>
    </fieldset>
  </form>
<?php 
echo "</table>\n";

?>
<?php generar_tabla_reservas(); ?>

<?php output_trailer() ?>