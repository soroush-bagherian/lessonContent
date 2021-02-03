<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include("header.inc.php");
include("classes/Lesson.class.php");

  
        
    
   


        
HTMLBegin();      
?>
<body>
<div class="col-md-11 mx-auto">

  <form class="col-md-10 bg-color bg-info text-white center" style="margin:5%; padding:10px;">
  <div class="form-group">
  درس های خودم<input type="radio" name="others" value="others" style=" margin-right:5%;">
    درس های دیگران <input type="radio" name="mine" value="mine1" style="margin-top:2% margin-bottom:2%">   
  </div>
  <button name="show_lesson" type="submit" class="btn btn-primary">نمایش</button>
</form>

<table class="table table-sm table-bordered table-striped">
    <thead>
        <tr>
            <th>دروس</th>
        </tr>

        <?php 
        if(isset($_REQUEST["show_lesson"])){


            if(isset( $_REQUEST['mine'])){  
             
            Lesson::getUserLesson();        
            }else if(isset( $_REQUEST['others'])){

                Lesson::getAllLessons(); 
            }
        }    
             ?>
    </thead>


</table>
</div>
</body>
</html>