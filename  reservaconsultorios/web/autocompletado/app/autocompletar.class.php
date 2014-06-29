<?php

header("Content-Type: text/html; charset=iso-8859-1");
 
class Autocompletar
{

	private $dbh;

	public function __construct($host,$databasename,$username,$password){
               
	
		$this->dbh = new PDO("mysql:host=localhost;dbname=$databasename",$username,$password);
		//$this->dbh = new PDO("mysql:host=localhost;dbname=mrbs", "martin", "martin");
	}

	public function findData($search)
	{
        
	$query = $this->dbh->prepare("SELECT concat(real_lastname, ', ', real_name) as nombre, id FROM mrbs_users WHERE (real_lastname LIKE :search)  AND level < 2");
        $query->execute(array(':search' => '%'.$search.'%'));
        $this->dbh = null;
        if($query->rowCount() > 0)
        {
        	echo json_encode(array('res' => 'full','data' => $query->fetchAll()));
        }
        else
        {
        	echo json_encode(array('res' => 'empty'));
        }
	}
}