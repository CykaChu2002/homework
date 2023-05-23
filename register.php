<?php
  try {
  
    // Connection
    $dbh = new PDO('mysql:host=localhost;dbname=aprofoto', 'root', '', array(PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION));
    $dbh->query('SET NAMES utf8 COLLATE utf8_general_ci');
    
    // Did we get the data?
    if(isset($_POST["register"]))
    {
	  // If there is no id and all data has been entered (firstname, lastname, username, password), then insert a new row
      if($_POST['firstname'] != "" && $_POST['lastname'] != "" && $_POST['username'] != "" && $_POST['password'] != "")
      {
        $sql = "insert into users values (0, '".$_POST['firstname']."', '".$_POST['lastname']."', '".$_POST['username']."', '".sha1($_POST['password'])."')";
        $count = $dbh->exec($sql);
        $newid = $dbh->lastInsertId();
      }
      
	  // If there is no id and not all data is provided, then error message: Missing data!
      elseif($_POST['id'] == "")
      {
        echo "Error: Missing data!";
      }
      
    }
    
  }
  catch (PDOException $e) {

    echo "Error: ".$e->getMessage();
    
  }

  if(isset($_POST["register"])){

    header("Location:http://localhost/index.php?s=login.php");
  }

?>
<!DOCTYPE html>
<html>
  <head>
    <title>MySql</title>
    <meta charset="utf-8">
  </head>
  <body>
    <div style="text-align:center;">
    <h2>Registration</h2>
    <form method="post">
    First name: <input type="text" name="firstname" maxlength="45"> Last name: <input type="text" name="lastname" maxlength="45"> <br><br>
    User name: <input type="text" name="username" maxlength="12"> Password: <input type="password" name="password"><br><br>
    <input type="submit" name="register" value = "Register">
    </form>
  </body>
</div>
</html>
