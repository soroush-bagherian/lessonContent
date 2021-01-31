<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include("header.inc.php");
include("classes/subject.class.php");

if(isset($_REQUEST["add_subject"])){
    $title = $_REQUEST["title"];
    Subject::add($title);
}


// $lessons = Subject::getUserLesson();
// for($i=0 ; $i<count($lessons);$i++){
//     echo $lessons[$i]->title;
// }
    

        
HTMLBegin();      
?>
<body>
<?= Subject::getUserLesson(); ?>

  <form class="col-md-5 bg-color bg-info text-white center">
  <div class="form-group">
    <label for="subject">موضوع</label>
    <input name="title" type="text" class="form-control" id="subject"  placeholder="عنوان موضوع">
    
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">درس</label>
        <select name="cars" id="cars" class="form-control">

<!-- 
                <option value="volvo">aaa</option>            
                <option value="saab">Saab</option>
                <option value="opel">Opel</option>
                <option value="audi">Audi</option> -->
                <?= Subject::getUserLesson(); ?>

                
        </select>
  </div>
  <button name="add_subject" type="submit" class="btn btn-primary">افزودن</button>
</form>
</body>
</html>