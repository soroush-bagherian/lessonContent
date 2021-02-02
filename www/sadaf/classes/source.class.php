<?php


class source{


    public static function addAttachment(){
        if(!isset($title)){return -1;}
        $k=0;
		$mysql = pdodb::getInstance();
		$query = "insert into sadaf.attachment (";
		$query .= " id";
		$query .= ", name";
		$query .= ", description";
		$query .= ", attachment";
		$query .= ") values (";
		$query .= "? , ? , ? ,?";
		$query .= ")";
		$ValueListArray = array();


		$id = Subject::GetLastID("attachment");
		if($id==-1){$id=1;}
		else{$id = $id+1;}

		array_push($ValueListArray, $id); 
		array_push($ValueListArray, $name); 
		array_push($ValueListArray, $description); 
		array_push($ValueListArray, $attachment); 
		$mysql->Prepare($query);
		$res = $mysql->ExecuteStatement($ValueListArray);
		if($rec = $res->fetch())
		{
			return true;
		}
		return -1;
    } 
}

?>