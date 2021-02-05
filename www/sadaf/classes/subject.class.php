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
		$query .= ");";
		$ValueListArray = array();


		$id = Subject::GetLastID("subject");
		if($id==-1){$id=1;}
		else{$id = $id+1;}


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
			$lesson .="<option name='lesson'  value='".$rec['lessonid']."'>". $rec['title'] ."</option>";
		}
		return $lesson;
	}

	public static function setLessonSubject($lessonID , $subjectID){
		$userId = $_SESSION["UserID"];
		$ValueListArray = array();

		$mysql = pdodb::getInstance();
		$query = "insert into subject_lesson (subjectId , lessonId) values(?,?);";
		$mysql->Prepare($query);

		$res = $mysql->ExecuteStatement(array($subjectID , $lessonID));

		
		if($rec = $res->fetch())
		{
			return true;
		}
		return -1;
	}

	public static function getLessonSubject($lessonID){

		$ValueListArray = array();
		
		$mysql = pdodb::getInstance();
		$query = "select subject.title , subjectId from sadaf.subject
		join sadaf.subject_lesson on subject.id = subject_lesson.subjectId
		join sadaf.lesson on lesson.id = subject_lesson.lessonId
		where lessonId = ?; ";
		$mysql->Prepare($query);

		$res = $mysql->ExecuteStatement(array($lessonID));

		$lesson="";
		while($rec = $res->fetch())
		{
			$lesson .="<option name='lesson'  value='".$rec['subjectId']."'>". $rec['title'] ."</option>";
		}
		return $lesson;
	}


}

?>