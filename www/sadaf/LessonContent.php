<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include("header.inc.php");
include("classes/Lesson.class.php");




HTMLBegin();
?>

<body>
   
<form method="post">
        <input type="hidden" name="DeleteLesson" value="1">
            <table class="table  table-bordered table-striped table-sm " ">
                <thead>
                    <tr>
                         <th width=1%;>&nbsp;</th>
                         <th> موضوعات درس </th>
<?php
if ($_GET['lessonid'])
{
echo "Link".$_GET['lessonid'] ."Clicked";
$mysql = pdodb::getInstance();
		$query = "select subject.title , subjectId from sadaf.subject
		join sadaf.subject_lesson on subject.id = subject_lesson.subjectId
		join sadaf.lesson on lesson.id = subject_lesson.lessonId
		where lessonId = ?; ";
		$mysql->Prepare($query);

		$res = $mysql->ExecuteStatement(array($_GET['lessonid']));

		while($rec = $res->fetch())
		{
			echo "<tr>";
            $i = 0; 
            echo "<td>";
            echo ++$i;
            echo"</td>";
            echo $rec["title"];
            //echo "<td><a class='btn btn-danger' href='forum.php?subjectid=".$rec["id"]."'>".$rec["title"]."</a></td>";
            echo "</tr>";
		}

}
                        ?>

                    </tr>
                    
                </thead>


            </table>
        </form>

</body>

</html>