<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include("header.inc.php");
include("classes/source.class.php");
include("classes/subject.class.php");
        
HTMLBegin();      
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
if(isset($_REQUEST["add_source"])){

  $lessonId =(int) $_REQUEST["source_lesson"];
  $attachmentId = Subject::GetLastID("attachment") + 1;

  if(Subject::getLessonSubject($lessonId)==""){
    echo "<h3 style='color:red;'>ابتدا برای این درس حداقل یک موضوع ایجاد کنید</h3>";
  }else{
    
  echo "<form class=' col-md-10 bg-color bg-info text-white center' style='margin:5%; padding:15px;'>
        <div class='form-group'>
        <label>موضوعی که میخواهید یک منبع جدید به آن اضافه کنید را انتخاب کنید</label>
        <select name='subject' class='form-control'>";
  echo  Subject::getLessonSubject($lessonId); 
  echo  "</select>
        </div>
        <div class='form-group'>
        <label>نوع منبع را انتخاب کنید</label>
        <select name='subject' class='form-control'>
          <option>برچسب</option>
          <option>صفحه</option>
          <option>فایل</option>
          <option>پوشه</option>
          <option>پیوند</option>
       </select>
        </div>
         <button name='add_source' type='submit' class='btn btn-primary'>ادامه</button>
        </form>";

  }
}

  // if(isset($_REQUEST['subject'])){
  //   echo "<form class='col-md-10 bg-color bg-info text-white center' style='margin:5%; padding:15px;'>
  //   <div class='form-group'>
  //   <label>نوع منبع را انتخاب کنید</label>
  //   <select name='subject' class='form-control'>
  //     <option>برچسب</option>
  //     <option>صفحه</option>
  //     <option>فایل</option>
  //     <option>پوشه</option>
  //     <option>پیوند</option>
  //  </select>
  //   </div>
  //    <button name='add_source' type='submit' class='btn btn-primary'>ادامه</button>
  //   </form>";
  // }
?>


</body>
</html>