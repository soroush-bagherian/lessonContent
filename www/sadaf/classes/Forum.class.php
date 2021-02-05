<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);


class Forum{
    public $forum_id;
    public $forum_subject;
    public $forum_date;
    public $forum_lesson;
    public $forum_by;
    public $forum_status;


    public static function add($forum_subject,$forum_title,$forum_by,$forum_status){
        if(!isset($forum_subject) || !isset($forum_by)||!isset($forum_title)){return -1;}
		$mysql = pdodb::getInstance();
		$query='insert into sadaf.forums (forum_id,forum_subject,forum_date,forum_by,forum_status,forum_title)
        values(1,1,NOW(),1,1,"yoo");';
        $ValueListArray = array();
        
        $id = Forum::GetLastID("forums");
		if($id==-1){$id=1;}
		else{$id = $id+1;}
        array_push($ValueListArray, $forum_subject); 
        array_push($ValueListArray, $id); 
		array_push($ValueListArray, $forum_title); 
        array_push($ValueListArray, $forum_by); 
        array_push($ValueListArray, $forum_status); 
		$mysql->Prepare($query);
		$res = $mysql->ExecuteStatement($ValueListArray);
		if($res)
		{
            echo "forum added successfully";
			return true;
        }
        echo "nope";
		return -1;
    }

    public static function GetLastID($table){
		$mysql = pdodb::getInstance();
        $query = "select max(id) from sadaf.".$table;
		$res = $mysql->Execute($query);
		if($rec=$res->fetch())
		{
			return $rec['max(id)'];
		}
		return -1;
		
	}


	


}

?>