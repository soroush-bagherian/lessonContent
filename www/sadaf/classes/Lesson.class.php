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
            echo "<tr>";
            echo "<td>";
            $CName = "le_".$rec["id"];
            echo "<input type=checkbox name='".$CName."'  id='".$CName."'>";
            echo "</td>";
            echo "<td>".htmlentities($rec["code"], ENT_QUOTES,"UTF-8")."</td>";
            echo "<td>".htmlentities($rec["title"], ENT_QUOTES,"UTF-8")."</td>";
            echo "<td><a class='btn btn-primary' href='LessonContent.php?lessonid=".$rec["id"]."'>i</a></td>";
            echo "</tr>";
		}
    }
    
    public static function getAllLessons(){
		
		$mysql = pdodb::getInstance();
		$query = "select * from lesson";
		$mysql->Prepare($query);

		$res = $mysql->Execute($query);

		$lesson="";
		while($rec = $res->fetch())
		{
            echo "<tr>";
           
            echo "<td>".htmlentities($rec["code"], ENT_QUOTES,"UTF-8")."</td>";
            echo "<td>".htmlentities($rec["title"], ENT_QUOTES,"UTF-8")."</td>";
            echo "<td><a class='btn btn-primary' href='LessonContent.php?lessonid=".$rec["id"]."'>i</a></td>";
            echo "</tr>";
		}
		return $lesson;
    }
    
    public static function DeleteLessons(){
		
		$userId = $_SESSION["PersonID"];
		
		$mysql = pdodb::getInstance();
		$query = "select * from persons
		join person_lesson on persons.PersonID=person_lesson.personid
		join lesson on lesson.id = person_lesson.lessonid
		where persons.PersonID=?";
		$mysql->Prepare($query);

        $res = $mysql->ExecuteStatement(array($userId));
        
		while($rec = $res->fetch())
		{
            $CName="le_".$rec["id"];
            if(isset($_REQUEST[$CName])){
                $query="delete from lesson where id=".$rec["id"];
                $query.="delete from person_lesson where lessonid=".$rec["id"];
                $mysql->Execute($query);

            }
            echo $rec["title"];
		}
	}

	


}

?>