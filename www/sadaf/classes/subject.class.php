<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);


class Subject{
    public $id;
    public $title;


    static function add($title){
        if(!isset($title)){return -1;}
        $k=0;
		$mysql = pdodb::getInstance();
		$query = "insert into sadaf.subject (";
		$query .= " id";
		$query .= ", title";
		$query .= ") values (";
		$query .= "? , ? ";
		$query .= ")";
		$ValueListArray = array();


		$id = Subject::GetLastID();
		if($id==-1){$id=1;}
		else{$id = $id+1;}

		array_push($ValueListArray, $id); 
		array_push($ValueListArray, $title); 
		$mysql->Prepare($query);
		$mysql->ExecuteStatement($ValueListArray);
		
    }


    public static function GetLastID()
	{
		$mysql = pdodb::getInstance();
        $query = "select max(id) from sadaf.subject";
		$res = $mysql->Execute($query);
		if($rec=$res->fetch())
		{
			return $rec['max(id)'];
		}
		return -1;
		
	}


}

?>