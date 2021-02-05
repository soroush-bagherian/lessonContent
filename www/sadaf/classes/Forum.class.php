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


    static function add($forum_subject,$forum_lesson,$forum_by){
        if(!isset($forum_subject) || !isset($forum_lesson) || !isset($forum_by)){return -1;}
		$mysql = pdodb::getInstance();
		$query = "insert into sadaf.forums (";
		$query .= " forum_subject";
        $query .= ", forum_date";
        $query .= ", forum_lesson";
        $query .= ", forum_by";
        $query .= ", forum_status";
		$query .= ") values (";
		$query .= "? , NOW() , ? , ? , 1 ";
		$query .= ")";
        $ValueListArray = array();
        
        $id = Forum::GetLastID("subject");
		if($id==-1){$id=1;}
		else{$id = $id+1;}


		array_push($ValueListArray, $forum_subject); 
        array_push($ValueListArray, $forum_lesson); 
        array_push($ValueListArray, $forum_by); 
		$mysql->Prepare($query);
		$res = $mysql->ExecuteStatement($ValueListArray);
		if($res)
		{
            echo "forum added successfully";
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
            echo "<tr>";
            echo "<td>";
            $CName = "le_".$rec["id"];
            echo "<input type=checkbox name='".$CName."'  id='".$CName."'>";
            echo "</td>";
            echo "<td>".htmlentities($rec["id"], ENT_QUOTES,"UTF-8")."</td>";
            echo "<td>".htmlentities($rec["code"], ENT_QUOTES,"UTF-8")."</td>";
            echo "<td>".htmlentities($rec["title"], ENT_QUOTES,"UTF-8")."</td>";
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
            echo "<td>".htmlentities($rec["id"], ENT_QUOTES,"UTF-8") ."</td>";
            echo "<td>".htmlentities($rec["code"], ENT_QUOTES,"UTF-8")."</td>";
            echo "<td>".htmlentities($rec["title"], ENT_QUOTES,"UTF-8")."</td>";
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