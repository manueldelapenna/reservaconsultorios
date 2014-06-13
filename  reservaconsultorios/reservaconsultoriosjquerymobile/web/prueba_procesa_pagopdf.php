<?php

require('libs/fpdf/fpdf.php');
require "defaultincludes.inc";
require_once "mrbs_sql.inc";

$psico = $_POST['f_psychologist_id'];
$sql = "SELECT u.real_name, u.real_lastname
            FROM mrbs_users u
			where u.id = $psico";
  $res = sql_query($sql);
  for ($i = 0; ($row = sql_row_keyed($res, $i)); $i++)
  {
      $nom = $row['real_name'];
      $ap = $row['real_lastname'];
              
  }
     

$pdf=new FPDF();
$pdf->AddPage();
$pdf->SetFont('Arial','B',16);
$pdf->Cell(40,10,'Colegio de Psicologos Distrito VII'); 
$pdf->Ln(10);
$pdf->Cell(0,6,'Recibo de pago para: '.$ap.' '.$nom,0,1);
$pdf->Cell(0,6,'Mas datos...: ',0,1);
$pdf->Ln(10);
$pdf->Output();
    
?> 

