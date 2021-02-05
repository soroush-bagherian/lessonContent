<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include("header.inc.php");
include("classes/Lesson.class.php");

if($_SERVER['REQUEST_METHOD'] != 'POST')
{
    //the form hasn't been posted yet, display it
//     echo '<form >
//     Category name: <input type="text" name="cat_name" />
//     Category description: <textarea name="cat_description" /></textarea>
//     <input type="submit" value="Add category" />
//  </form>';
}
else
{
    //the form has been posted, so save it
    $mysql = pdodb::getInstance();
		$query = "insert into sadaf.categories (";
		$query .= " cat_name";
		$query .= ", cat_description";
		$query .= ") values (";
		$query .= "? , ? ";
		$query .= ")";
        $mysql->Prepare($query);
        
		$result = $mysql->ExecuteStatement(array($_POST["cat_name"],$_POST["cat_description"]));
		
    if(!$result)
    {
        //something went wrong, display the error
        echo 'Error' . mysql_error();
    }
    else
    {
        echo 'New category successfully added.';
    }
}

HTMLBegin();
?>

<body>
   
<form method="post" action="">
    Category name: <input type="text" name="cat_name" />
    Category description: <textarea name="cat_description" /></textarea>
    <input type="submit" value="Add category" class="btn btn-primary" />
 </form>

</body>

</html>