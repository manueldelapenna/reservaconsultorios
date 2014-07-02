<?php
// $Id: week.php 2374 2012-08-12 19:11:43Z cimorrison $

// mrbs/week.php - Week-at-a-time view

require "defaultincludes.inc";
require_once "mincals.inc";
require_once "functions_table.inc";

// print the page header
print_header($day, $month, $year, $area, isset($room) ? $room : "");
?>

<div id="contents">

<form class="form_general" id="logon" method="post" action="generar_y_enviar_password.php">
  <fieldset>
  <legend>Recuperar contrase&ntilde;a</legend>
  <p>Ingrese su direcci&oacute;n de correo electr&oacute;nico</p>
    <div>
      <label for="NewUserName">e-mail:</label>
      <input type="text" id="userEmail" name="userEmail">
    </div>
    <div id="logon_submit">
      <input class="button" type="submit" value="Enviar">
    </div>
  </fieldset>
</form>
</div> 

<script src="foundation-5.2.3/js/foundation.min.js"></script>
<script> $(document).foundation();</script>
</body>
</html>

