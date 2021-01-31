<?php
include("header.inc.php");
include("classes/subject.class.php");

if(isset($_REQUEST["add_subject"])){
    $title = $_REQUEST["title"];
    Subject::add($title);
}

        
HTMLBegin();      
?>
<body>
  <!-- <form action="" method="post">
      <span>ثبت موضوع جدید</span>
      موضوع:<input type="text">
      درس :  <select name="cars" id="cars">
                <option value="volvo">Volvo</option>
                <option value="saab">Saab</option>
                <option value="opel">Opel</option>
                <option value="audi">Audi</option>
            </select>
      <input name="add_subject" type="submit" value="">
  </form>   -->


  <form class="col-md-5 bg-color bg-info text-white center">
  <div class="form-group">
    <label for="subject">موضوع</label>
    <input name="title" type="text" class="form-control" id="subject"  placeholder="عنوان موضوع">
    
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">درس</label>
    <select name="cars" id="cars" class="form-control">
                <option value="volvo">Volvo</option>
                <option value="saab">Saab</option>
                <option value="opel">Opel</option>
                <option value="audi">Audi</option>
            </select>
  </div>
  <button name="add_subject" type="submit" class="btn btn-primary">افزودن</button>
</form>
</body>
</html>