<?php

// $Id: version.inc 2737 2013-07-08 20:26:43Z jberanek $

// This should probably be a class, but you can only have protected
// class members in PHP 5, so we won't bother

function get_mrbs_version()
{
  // MRBS developers, make sure to update this string before each release
  $mrbs_version = "MRBS 1.4.10";

  return $mrbs_version;
}

?>
