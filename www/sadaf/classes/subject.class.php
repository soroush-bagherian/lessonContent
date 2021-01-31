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
			$lesson .="<option  value='a'>". $rec['title'] ."</option>";
		}
		return $lesson;
	}

	public static function setLessonSubject($lessonID , $subjectID){
		// $userId = $_SESSION["UserID"];
		// $ValueListArray = array();

		// $mysql = pdodb::getInstance();
		// $query = "select * from persons
		// join person_lesson on persons.PersonID=person_lesson.personid
		// join lesson on lesson.id = person_lesson.lessonid
		// where persons.PersonID=1";
		// $mysql->Prepare($query);

		// $res = $mysql->ExecuteStatement(array($userId));

		// $lesson="";
		// while($rec = $res->fetch())
		// {
		// 	$lesson .="<option  value='a'>". $rec['title'] ."</option>";
		// }
		// return $lesson;
	}


}

?>