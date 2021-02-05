<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include("header.inc.php");
include("classes/source.class.php");
include("classes/subject.class.php");
        
HTMLBegin();
echo "  <script src='https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js' referrerpolicy='origin'></script>
<script>tinymce.init({ selector:'textarea' });</script> ";      
?>
<body>

  <form class="col-md-10 bg-color bg-info text-white center" style="margin:5%; padding:15px;">
    <div class="form-group">
      <label for="exampleInputPassword1">درسی که میخواهید یک منبع جدید به آن اضافه کنید را انتخاب کنید</label>
          <select name="source_lesson" id="source" class="form-control">
              <?= Subject::getUserLesson(); ?>
          </select>
    </div>
    <button name="add_source" type="submit" class="btn btn-primary">ادامه</button>
 </form>

<?php


 if(isset($_REQUEST["choose_type"])){

  if(isset($_REQUEST["source_type"])){
      $kind = $_REQUEST["source_type"];
      $subjectId = $_REQUEST["subject"];
      if ($kind == "برچسب")
          source::tag_form($subjectId);
      else if($kind == "صفحه")
          source::page_form($subjectId);
      else if($kind == "فایل")
          source::file_form($subjectId);
      else if($kind == "پوشه")
          source::folder_form($subjectId); 
      else if($kind == "پیوند")
          source::attachment_form($subjectId);
      else if($kind == "تالار گفت و گو")
          source::hall_form($subjectId);    
  }
}

else if(isset($_REQUEST["add_tag"])){
  if(empty($_REQUEST["tag_name"])){
    echo "<h3 style='color:red;'>تمام فیلد ها را پر کنید</h3>";
    die();
  }
    $tag_name = $_REQUEST["tag_name"];
    $sId = $_REQUEST["subjectId"];
       if(source::add_tag($tag_name ,$sId)){
        echo "<div class='col-md-10 alert alert-success' role='alert' style='margin:5%;'>
        با موفقیت اضافه شد!
        </div>";
       }else{
        echo "<div class='col-md-10 alert alert-danger' role='alert' style='margin:5%;'>
        This is a success alert—check it out!
        </div>";
       }
 }

 else if(isset($_REQUEST["add_page"])){
  if(empty($_REQUEST["title"]) || empty($_REQUEST["description"]) || empty($_REQUEST["content"])){
    echo "<h3 style='color:red;'>تمام فیلد ها را پر کنید</h3>";
    die();
  }
  $sId = $_REQUEST["subjectId"];
  if(isset($_REQUEST["title"]))
    if(isset($_REQUEST["description"]))
      if(isset($_REQUEST["content"]))
        if(source::add_page($_REQUEST["title"] ,$_REQUEST["description"] ,$_REQUEST["content"] ,$sId)){
          echo "<div class='col-md-10 alert alert-success' role='alert' style='margin:5%;'>
          با موفقیت اضافه شد!
          </div>";
         }else{
          echo "<div class='col-md-10 alert alert-danger' role='alert' style='margin:5%;'>
          This is a success alert—check it out!
          </div>";
         }      
}



else if(isset($_REQUEST["add_file"])){
  if(empty($_REQUEST["title"]) || empty($_REQUEST["description"]) || empty($_FILES["fileToUpload"])){
    echo "<h3 style='color:red;'>تمام فیلد ها را پر کنید</h3>";
    die();
  }
  $sId = $_REQUEST["subjectId"];
  if(isset($_REQUEST["title"]))
    if(isset($_REQUEST["description"]))
      if(source::add_file($_REQUEST["title"] ,$_REQUEST["description"] ,$_FILES["fileToUpload"] ,$sId)){
        echo "<div class='col-md-10 alert alert-success' role='alert' style='margin:5%;'>
        با موفقیت اضافه شد!
        </div>";
       }else{
        echo "<div class='col-md-10 alert alert-danger' role='alert' style='margin:5%;'>
        This is a success alert—check it out!
        </div>";
       }   
}

else if(isset($_REQUEST["add_folder"])){
  if(empty($_REQUEST["title"]) || empty($_REQUEST["description"])){
    echo "<h3 style='color:red;'>تمام فیلد ها را پر کنید</h3>";
    die();
  }
  $sId = $_REQUEST["subjectId"];
  if(isset($_REQUEST["title"]))
    if(isset($_REQUEST["description"]))
    if(source::add_folder($_REQUEST["title"] ,$_REQUEST["description"] ,$sId)){
      echo "<div class='col-md-10 alert alert-success' role='alert' style='margin:5%;'>
      با موفقیت اضافه شد!
      </div>";
     }else{
      echo "<div class='col-md-10 alert alert-danger' role='alert' style='margin:5%;'>
      This is a success alert—check it out!
      </div>";
     }  
}
?>

</body>
</html>