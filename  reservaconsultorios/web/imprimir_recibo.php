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
     
$company = utf8_decode("Colegio de Psicólogos Distrito VII");
$address = "domicilio";
$email = "psicologosdistrito7@hotmail.com";
$telephone = "44444444";
$number = "lalala";
$item = 'aca va un detalle sobre todas las reservas, es decir el concepto del recibo laslaldalasf sdf sdfsd fsdf puto puto puto';
$price = 'total';
$vat = 'desc';
$vat = str_replace(",",".",$vat);
$p = explode(" ",$price);
$v = explode(" ",$vat);
$re = $p[0] + $v[0];
function r($r)
{
$r = str_replace("$","",$r);
$r = str_replace(" ","",$r);
$r = "$ ".$r;
return $r;
}
$price = r($price);
$vat = r($vat);

class PDF extends FPDF
{
function Header()
{
if(!empty($_FILES["file"]))
  {
$uploaddir = "logo/";
$nm = $_FILES["file"]["name"];
$random = rand(1,99);
move_uploaded_file($_FILES["file"]["tmp_name"], $uploaddir.$random.$nm);
$this->Image($uploaddir.$random.$nm,10,10,20);
unlink($uploaddir.$random.$nm);
}
$this->SetFont('Arial','B',12);
$this->Ln(1);
}
function Footer()
{
$this->SetY(-15);
$this->SetFont('Arial','I',8);

}
function ChapterTitle($num, $label)
{
$this->SetFont('Arial','',12);
$this->SetFillColor(200,220,255);
$this->Cell(0,6,"$num $label",0,1,'L',true);
$this->Ln(0);
}
function ChapterTitle2($num, $label)
{
$this->SetFont('Arial','',12);
$this->SetFillColor(249,249,249);
$this->Cell(0,6,"$num $label",0,1,'L',true);
$this->Ln(0);
}
}

$pdf = new PDF();
$pdf->AliasNbPages();
$pdf->AddPage();
$pdf->SetFont('Times','',12);
$pdf->SetTextColor(32);
$pdf->Cell(0,5,$company,0,1,'R');
$pdf->Cell(0,5,$address,0,1,'R');
$pdf->Cell(0,5,$email,0,1,'R');
$pdf->Cell(0,5,'Tel: '.$telephone,0,1,'R');
$pdf->Cell(0,5,'',0,1,'R');
$pdf->SetFillColor(200,220,255);
$pdf->ChapterTitle(utf8_decode('Recibo Nº: '),$number . '            Original: Cliente');
$pdf->ChapterTitle('Profesional:','nombre de cliente');
$pdf->ChapterTitle('Fecha: ',date('d-m-Y'));
$pdf->Cell(0,20,'',0,1,'R');
$pdf->SetFillColor(224,235,255);
$pdf->SetDrawColor(192,192,192);
$pdf->Cell(170,7,utf8_decode('Recibí en concepto de'),1,0,'L');
$pdf->Cell(20,7,'Price',1,1,'C');
$pdf->Cell(170,7,$item,1,0,'L',0);
$pdf->Cell(20,7,$price,1,1,'C',0);
$pdf->Cell(0,0,'',0,1,'R');
$pdf->Cell(170,7,'Descuento',1,0,'R',0);
$pdf->Cell(20,7,$vat,1,1,'C',0);
$pdf->Cell(170,7,'Total',1,0,'R',0);
$pdf->Cell(20,7,"$ ".$re,1,0,'C',0);
$pdf->Cell(0,20,'',0,1,'R');
$pdf->Cell(170,7,'Cobrador:' .'nombre cobrador',0,1,'L');
$pdf->Cell(170,7,'Firma cobrador:..........................................................................',0,1,'L');


//espacio entre recibos
$pdf->Cell(0,25,'',0,1,'R');


$pdf->Cell(0,5,$company,0,1,'R');
$pdf->Cell(0,5,$address,0,1,'R');
$pdf->Cell(0,5,$email,0,1,'R');
$pdf->Cell(0,5,'Tel: '.$telephone,0,1,'R');
$pdf->Cell(0,5,'',0,1,'R');
$pdf->SetFillColor(200,220,255);
$pdf->ChapterTitle(utf8_decode('Recibo Nº: '),$number . utf8_decode('            Duplicado: Colegio de Psicólogos'));
$pdf->ChapterTitle('Profesional:','nombre de cliente');
$pdf->ChapterTitle('Fecha: ',date('d-m-Y'));
$pdf->Cell(0,20,'',0,1,'R');
$pdf->SetFillColor(224,235,255);
$pdf->SetDrawColor(192,192,192);
$pdf->Cell(170,7,utf8_decode('Recibí en concepto de'),1,0,'L');
$pdf->Cell(20,7,'Price',1,1,'C');
$pdf->Cell(170,7,$item,1,0,'L',0);
$pdf->Cell(20,7,$price,1,1,'C',0);
$pdf->Cell(0,0,'',0,1,'R');
$pdf->Cell(170,7,'Descuento',1,0,'R',0);
$pdf->Cell(20,7,$vat,1,1,'C',0);
$pdf->Cell(170,7,'Total',1,0,'R',0);
$pdf->Cell(20,7,"$ ".$re,1,0,'C',0);
$pdf->Cell(0,20,'',0,1,'R');
$pdf->Cell(170,7,'Cobrador:' .'nombre cobrador',0,1,'L');
$pdf->Cell(170,7,'Firma cobrador:..........................................................................',0,1,'L');
$pdf->Output('recibo0000'.$pago.'.pdf','D');

/*
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
      $pdf->Cell(0,6,'Comienzo: '.utf8_decode(time_date_string($inicio)).' - Fin: '.utf8_decode(time_date_string($fin)),0,1);
             
  }
$pdf->Cell(0,6,'---------------------------------- ',0,1);
$pdf->Cell(0,6,'Subtotal: $'.$fila_pago['monto_reservas'],0,1);
$pdf->Cell(0,6,'Descuento: $'.$fila_pago['descuento'],0,1);
$pdf->Cell(0,6,'Total a pagar: $'.$fila_pago['total'],0,1);
$pdf->Ln(20);
$pdf->Cell(0,6,'Firma: ',0,1);
$pdf->Output('recibo0000'.$pago.'.pdf','D');

*/
    
?>