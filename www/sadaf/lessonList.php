<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include("header.inc.php");
include("classes/Lesson.class.php");

if(isset($_REQUEST["DeleteLesson"])){

    Lesson::DeleteLessons();
}

HTMLBegin();
?>

<body>
    <div class="col-md-11 mx-auto">

        <form class="col-md-12 bg-color bg-info text-white center" style="margin-bottom:5%; margin-top:5%; padding:5px;" >
            <div class="form-group ">
                درس های خودم<input type="radio" name="mine" value="others" style=" margin-right:5%;">
                درس های دیگران <input type="radio" name="mine" value="mine1" style="margin-right:2%; margin-top:2%;">
            </div>
            <button name="show_lesson" type="submit" class="btn btn-primary " style="margin:1vw; margin-right:1.8vw;">نمایش</button>
        </form>

        <form method="post">
        <input type="hidden" name="DeleteLesson" value="1">
            <table class="table  table-bordered table-striped table-sm " ">
                <thead>
                    <tr>


                        <?php
                        if (isset($_REQUEST["show_lesson"])) {

                            if (isset($_REQUEST['mine'])) {

                                if ($_REQUEST['mine'] == "mine1") {

                                    echo '<th width=1%;>&nbsp;</th>';
                                    echo '<th width=1%; >شماره</th>';
                                    echo '<th width=1%; >کد</th>';
                                    echo "<th>درس</th>";
                                    Lesson::getUserLesson();
                                    echo '<td colspan="4" class="text-center">
                                    <input type="submit" value="حذف" class="btn btn-danger btn-sm"
                                </td>';
                                } else if($_REQUEST['mine'] == "others") {
                                    
                                    echo '<th width=1%;>شماره</th>
                                     <th width=1%;>کد</th>
                                     <th>درس</th>';
                                    Lesson::getAllLessons();
                                }
                            }
                        }
                        ?>

                    </tr>
                    
                </thead>


            </table>
        </form>
    </div>
</body>

</html>