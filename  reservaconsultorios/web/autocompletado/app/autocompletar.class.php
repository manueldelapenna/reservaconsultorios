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
        
	$query = $this->dbh->prepare("SELECT concat(real_lastname, ', ', real_name,' - ',name) as nombre, id FROM mrbs_users WHERE (real_lastname LIKE _utf8 :search COLLATE utf8_general_ci)  AND level < 2");
        $query->execute(array(':search' => '%'.$search.'%'));
        $this->dbh = null;
        $cant = $query->rowCount();
        if($cant > 0)
        {
                $array = $query->fetchAll();
                
//                foreach ($array as $value)
//                {
//                    $nom1 = utf8_encode($value['nombre']);
//                    $value['nombre'] = 'martin';
//                    $nom2 = utf8_encode($value[0]);
//                    $value[0] = $nom2;
//                    
////                    $value['nombre'] = $encoded;
////                    $encoded = array_map('utf8_encode',$value[0]);
////                    $value[0] = $encoded;
//                    
//                }
                for ($i=0;$i<$cant;$i++)
                {
                   $array[$i]['nombre']=utf8_encode($array[$i]['nombre']);
                   $array[$i][0]=utf8_encode($array[$i][0]);
                }
//                var_dump($array);
//                die;
                
        	echo json_encode(array('res' => 'full','data' => $array));
        }
        else
        {
        	echo json_encode(array('res' => 'empty'));
        }
	}
        
}