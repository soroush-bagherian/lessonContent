<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);


class Lesson{
    public $id;
    public $code;
    public $title;


    static function add($title,$code){
        if(!isset($title) || !isset($code)){return -1;}
        $k=0;
		$mysql = pdodb::getInstance();
		$query = "insert into sadaf.lesson (";
		$query .= " title";
		$query .= ", code";
		$query .= ") values (";
		$query .= "? , ? ";
		$query .= ")";
		$ValueListArray = array();


		array_push($ValueListArray, $id); 
		array_push($ValueListArray, $title); 
		$mysql->Prepare($query);
		$res = $mysql->ExecuteStatement($ValueListArray);
		if($rec = $res->fetch())
		{
			return true;
		}
		return -1;
    }


	public static function getUserLesson(){
		
		$userId = $_SESSION["PersonID"];
		$ValueListArray = array();
		
		$mysql = pdodb::getInstance();
		$query = "select * from persons
		join person_lesson on persons.PersonID=person_lesson.personid
		join lesson on lesson.id = person_lesson.lessonid
		where persons.PersonID=?";
		$mysql->Prepare($query);

		$res = $mysql->ExecuteStatement(array($userId));

		$lesson="";
		while($rec = $res->fetch())
		{
            echo "<tr><td>".$rec["title"]."</td></tr>";
		}
		return $lesson;
    }
    
    public static function getAllLessons(){
		
		$mysql = pdodb::getInstance();
		$query = "select * from lesson";
		$mysql->Prepare($query);

		$res = $mysql->Execute($query);

		$lesson="";
		while($rec = $res->fetch())
		{
            echo "<tr><td>".$rec["title"]."</td></tr>";
		}
		return $lesson;
	}

	


}

?>