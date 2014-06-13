<?php

// $Id: header.inc 2561 2012-11-06 19:06:15Z cimorrison $


// Print the page header
function print_theme_header($day, $month, $year, $area, $room)
{
  global $mrbs_company, $mrbs_company_logo, $mrbs_company_url, $mrbs_company_more_info,
         $search_str, $locale_warning;
  global $tbl_entry, $tbl_room, $tbl_area;
  global $PHP_SELF, $HTTP_HOST, $QUERY_STRING;
  global $view_week_number, $weekstarts, $times_along_top, $periods, $enable_periods;
  global $auth, $max_level;
  global $default_language_tokens, $disable_automatic_language_changing, $override_locale;
  global $select_options;
  global $ajax_refresh_rate;
  global $main_table_cell_border_width, $main_cell_height;
  global $timetohighlight;
  
  $page = basename($PHP_SELF, ".php");
  $user = getUserName();
  $is_admin = (authGetUserLevel($user) >= $max_level);
  
  // Need to set the timezone before we can use date()
  get_area_settings($area);

  // If we dont know the right date then make it up 
  if (!$day)
  {
    $day   = date("d");
  }
  if (!$month)
  {
    $month = date("m");
  }
  if (!$year)
  {
    $year  = date("Y");
  }
  if (!isset($search_str))
  {
    $search_str = "";
  }
  
  //http_headers();
  //echo DOCTYPE;
?>

<html>
  <head>
  
  <meta charset="<?php echo get_charset(); ?>">
  <title><?php echo get_vocab("mrbs") ?></title>
  <link rel="stylesheet" href="jquery/jquery.mobile-1.4.2.min.css">
  <script src="jquery/jquery-1.10.2.min.js"></script>
<script>
    $(document).bind("mobileinit", function() {
        $.mobile.defaultPageTransition = 'none';
    });
</script>
  <script src="jquery/jquery.mobile-1.4.2.min.js"></script>
  



  <?php
  require_once "style.inc";
  require_once "js.inc";
  ?>

  </head>
  
  <?php
  // Put the filename in as a class to aid styling.   
  // (Use a class rather than id to avoid specificity problems)
  echo "<body class=\"non_js ".htmlspecialchars($page)."\">\n";
   
    // Add a class of "js" so that we know if we're using JavaScript or not
    // and remove the non_js class (it's sometimes useful to know that we're
    // not running JavaScript)
  ?>
  
    <script type="text/javascript">
      //<![CDATA[
      $('body').addClass('js').removeClass('non_js');
      //]]>
    </script> 
 
 <script>
	 $(function(){
	  $("body a").attr("data-ajax","false");
	  $("body form").attr("data-ajax","false");
	});
 </script>


<?php // show a warning if this is using a low version of php
  if (substr(phpversion(), 0, 1) == 3)
  {
    echo "<h1>" . get_vocab("not_php3") . "</h1>\n";
  }
  if (!empty($locale_warning))
  {
    echo "[Warning: ".$locale_warning."]";
  }
?>

<div data-role="page" id="pageone">
  <div data-role="header">
    <h1>Psic&oacute;logos Distrito VII</h1>
    <div data-role="navbar">
      
        
       <?php
		if(isset($user) == TRUE && (authGetUserLevel($user) == 2)){ 
	   ?>
	   <ul>
		  <li><a href="index.php">Inicio</a></li>
          <li>
		  <?php
				echo "<a href=\"admin.php\">" . get_vocab("rooms") . "</a>";
		  ?>
		  </li>
          <li>
		  <?php
				echo "<a href=\"report.php\">" . get_vocab("report") . "</a>";
		  ?>
		  </li>
		  <li>
		  <?php
				echo "<a href=\"prueba_pdf.php\">" . Pagos . "</a>";
		  ?>
		  </li>
		  <li>
		  <?php
				echo "<a href=\"edit_users.php\">" . Usuarios . "</a>";
		  ?>
		  </li>		  
	  <?php
	  }
	  ?>
    </div>
	<?php
	   if (function_exists('PrintLogonBox') && (authGetUserLevel($user) != 0))
      {
        PrintLogonBox(); 
      }
	  ?>
  </div>

  <div data-role="main" class="ui-content">
    <?php 
	  
	  
      
			if (authGetUserLevel($user) >= 1){
			?>
			
			<form action="day.php" method="get" id="Form1">
			  <div>
				<?php
				// Give the form id as the optional fifth parameter because we want
				// the form to be automatically submitted when the datepicker is closed
				genDateSelector("", $day, $month, $year, "Form1");
				if (!empty($area))
				{
				  echo "<input type=\"hidden\" name=\"area\" value=\"$area\">\n";
				}
				if (!empty($room))
				{
				  echo "<input type=\"hidden\" name=\"room\" value=\"$room\">\n";
				}
				// Although the datepicker will automatically go to the new date when
				// the date is changed, we still need a submit button because there
				// are occasions when you want to go to the date without changing it -
				// for example when you've been on a Search or Report page
				?>
			   </div>
			</form>
            <?php
			}
			?>

    


<?php 
}
?>

