<?php 
    
    if(isset($_POST['username']) && isset($_POST['password'])) {
        try {
            // Connection
            $dbh = new PDO('mysql:host=localhost;dbname=aprofoto', 'root', '',
                            array(PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION));
            $dbh->query('SET NAMES utf8 COLLATE utf8_general_ci');
            
            // Search for a user
            $sqlSelect = "select id, first_name, last_name from users where user_name = :usern and password = sha1(:pwd)";
            $sth = $dbh->prepare($sqlSelect);
            $sth->execute(array(':usern' => $_POST['username'], ':pwd' => $_POST['password']));
            $row = $sth->fetch(PDO::FETCH_ASSOC);

            if($row) {
              $_SESSION['fn'] = $row['first_name']; 
              $_SESSION['ln'] = $row['last_name']; 
              $_SESSION['user'] = $_POST['username'];
            }    
            if(isset($row) && !$row){
              echo "<h2>Login failed!</h2>"; 
              session_unset();
            } 
                       
        }
        catch (PDOException $e) {
            echo "Error: ".$e->getMessage();
        }      
    }

    if(isset($_SESSION['user'])) 
    header("Location:http://localhost/index.php");
    
    if(isset($_POST["register"]))
    header("Location:http://localhost/index.php?s=register.php");

?>

<!DOCTYPE html>
<html>
  <head>
    <title>Webshop</title>
    <meta charset="utf-8">
  </head>
  <body>
    <?php include("top.php"); ?>
    <div style="text-align:center; ">
    <form method = "post">
      <fieldset>
        <legend>Login</legend>
        <br>
        <input type="text" name="username" placeholder="Username" required><br><br>
        <input type="password" name="password" placeholder="Password" required><br><br>
        <input type="submit" name="login" value="Login">
        <br>&nbsp;
      </fieldset>
      
    </form>
  </div>
    <br>
    <div style="text-align:center;">
    <form method = "post">
    <input type="submit" name="register" value="Register">
    </form>
  </div>
  </body>
</html>
