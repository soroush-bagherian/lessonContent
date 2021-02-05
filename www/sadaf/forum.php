<?php


ini_set('display_startup_errors',1); 
ini_set('display_errors',1);
error_reporting(-1);

include("header.inc.php");
include("classes/Forum.class.php");

$subjectid;
if ($_GET['subjectid'])
{
    $subjectid=$_GET['subjectid'];

}

if(isset($_POST['saveforum']))
{
    // echo $_SESSION["PersonID"];
    // echo $subjectid;
    // echo $_REQUEST['forum_title'];
    $isAddForum =Forum::add($subjectid,$_REQUEST['forum_title'],$_SESSION["PersonID"],1);

    if($isAddForum){
        echo "<div class='alert alert-success' role='alert'>
        This is a success alert—check it out!
        </div>";
      }
}

HTMLBegin();
?>

<body>

<header class="col-md-13 bg-color bg-info text-white center" style="background-color: #f1f1f1;
  padding: 30px;
  text-align: center;">

<?php
if ($_GET['subjectid'])
{
$mysql = pdodb::getInstance();
		$query = "select subject.title from sadaf.subject
		where subject.id = ?; ";
		$mysql->Prepare($query);

		$res = $mysql->ExecuteStatement(array($_GET['subjectid']));
        
		while($rec = $res->fetch())
		{
            echo '<h1>'.$rec["title"].'</h1>'; 
		}

}
                        ?>
</header>
   
<form method="post" action="">
    <p>:موضوع گفتگو</p>  
    <input type="text" name="forum_title" />
    <p>:توضیحات گفتگو</p> 
    <textarea name="cat_description" /></textarea>
    <br>
    <input type="submit" value="ایجاد" name="saveforum" id="saveforum" class="btn btn-primary" />
 </form>

</body>

</html>

