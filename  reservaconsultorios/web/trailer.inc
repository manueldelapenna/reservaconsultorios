<?php

// $Id: trailer.inc 2291 2012-04-10 17:42:56Z cimorrison $

function generate_trailer()
{
  global $year, $month, $day, $area, $room;
  global $strftime_format, $weekstarts, $simple_trailer, $view_week_number;

  $output = "";
    
  return $output;
}


// Output the trailer for the bottom of the page, including the footer
function output_trailer()
{
  echo generate_trailer();

  // Print footer
  print_footer(FALSE);
}

?>
