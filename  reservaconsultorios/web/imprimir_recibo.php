<?php

require('libs/fpdf/fpdf.php');
require "defaultincludes.inc";
require_once "mrbs_sql.inc";


$pago = $_GET['pago_id']; 
$cobrador_id = $_GET['cobrador_id'];

$sql = "SELECT u.real_name, u.real_lastname
        FROM mrbs_users u
        WHERE u.id = $cobrador_id";
$res = sql_query($sql);
$row = sql_row_keyed($res,0);
$cobrador = $row['real_lastname'].", ".$row['real_name'];

$sql = "SELECT * 
        FROM mrbs_pago
        WHERE id = $pago";
$res = sql_query($sql);
$fila_pago = sql_row_keyed($res,0);

$fecha = date_create($fila_pago['fecha']);
$fecha_esp = date_format($fecha, 'd/m/Y');

$sql = "SELECT *
        FROM mrbs_entry 
        WHERE pago_id = $pago
        ORDER BY start_time asc";
$res = sql_query($sql);
$row = sql_row_keyed($res,0); 
$psicologo_id = $row['psychologist_id'];

$sql2 = "SELECT * FROM mrbs_users
         WHERE id =  $psicologo_id";
$resul = sql_query($sql2);
$fila = sql_row_keyed($resul,0);
$profesional = $fila['real_lastname'].", ".$fila['real_name'];

//$sql = "SELECT u.real_name, u.real_lastname
//            FROM mrbs_users u
//			where u.id = $psico";
//  $res = sql_query($sql);
//  for ($i = 0; ($row = sql_row_keyed($res, $i)); $i++)
//  {
//      $nom = $row['real_name'];
//      $ap = $row['real_lastname'];
//              
//  }
     

$pdf=new FPDF();
$pdf->AddPage();
$pdf->SetFont('Arial','B',12);
$pdf->Cell(40,10,utf8_decode("Colegio de Psicólogos Distrito VII")); 
$pdf->Ln(10);
$pdf->Cell(0,6,'Recibo Nro.: 0000'.$pago,0,1);
$pdf->Cell(0,6,'Fecha de pago: '.$fecha_esp,0,1);
$pdf->Cell(0,6,'Cobrador: '.utf8_decode($cobrador),0,1);
$pdf->Cell(0,6,'Profesional: '.utf8_decode($profesional),0,1);
$pdf->Cell(0,6,'---------------------------------- ',0,1);
$pdf->Cell(0,6,'Detalle de las reservas: ',0,1);
for ($i = 0; ($row = sql_row_keyed($res, $i)); $i++)
  {
      $inicio = $row['start_time'];
      $fin = $row['end_time'];
      $pdf->Cell(0,6,'Comienzo: '.time_date_string($inicio).' - Fin: '.time_date_string($fin),0,1);
             
  }
$pdf->Cell(0,6,'---------------------------------- ',0,1);
$pdf->Cell(0,6,'Subtotal: $'.$fila_pago['monto_reservas'],0,1);
$pdf->Cell(0,6,'Descuento: $'.$fila_pago['descuento'],0,1);
$pdf->Cell(0,6,'Total a pagar: $'.$fila_pago['total'],0,1);
$pdf->Ln(20);
$pdf->Cell(0,6,'Firma: ',0,1);
$pdf->Output('recibo0000'.$pago.'.pdf','D');


    
?>