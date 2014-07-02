<?php 

require "defaultincludes.inc";
require_once "mrbs_sql.inc";
require "functions_mail.inc";

function generateRandomString($length = 6) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, strlen($characters) - 1)];
    }
    return $randomString;
}

$email = $_POST['userEmail'];
$newPassword = generateRandomString();
$encryptedPassword = md5($newPassword);

$sql = "SELECT *
        FROM mrbs_users u
        WHERE u.email = '$email'";
$res = sql_query($sql);
$user = sql_row_keyed($res,0);
$username = $user['name'];

if ($username != null){
	$sql = "UPDATE mrbs_users u 
			SET password = '$encryptedPassword'
			WHERE u.email = '$email'";
	$res = sql_query($sql);
	
	notificarAusuarioCambioDePassword($username,$newPassword);
}


print_header($day, $month, $year, $area, isset($room) ? $room : "");
?>

<div id="contents">

<?php
if ($username != null){
?>
	<h1>Contrase&ntilde;a recuperada correctamente</h1>
	<p>Se le ha enviado un e-mail con su nueva contrase&ntilde;a. Por seguridad por favor modif&iacute;quela al momento de ingresar al sistema.</p>
	<p>Para ingresar al sistema haga click <a href="index.php">aqu&iacute;</a>.</p>
<?php
}else{
?>
	<h1>No existe un usuario con el e-mail ingresado</h1>
	<p>Para intentar recuperar nuevamente su contrase&ntilde;a haga click <a href="recuperar_password.php">aqu&iacute;</a>.</p>
<?php
}
?>


</div> 

<script src="foundation-5.2.3/js/foundation.min.js"></script>
<script> $(document).foundation();</script>
</body>
</html>