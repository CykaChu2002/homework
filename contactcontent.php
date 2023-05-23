<!DOCTYPE html>
<html>
 <head>
 <title>MySql</title>
 <meta charset="utf-8">
 </head>

<?php
 
 try {
 // Connection
 $dbh = new PDO('mysql:host=localhost;dbname=aprofoto', 'root', '', 
array(PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION));
 $dbh->query('SET NAMES utf8 COLLATE utf8_general_ci');

 
 // Querying the rows of the table
 $rows = $dbh->query("SELECT name, email, subject, message FROM messages order by id DESC",PDO::FETCH_ASSOC);
}
 catch (PDOException $e) {

    echo "Error: ".$e->getMessage();
 }
?>
 <body>
 <h1>Messages</h1>
 <?php
 echo "<h3>&nbsp &nbsp &nbspName &nbsp  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspEmail  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspSubject  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspMessage</h3>";
 echo "<TABLE>";
 foreach($rows as $row) {
 echo "<TR>";
 foreach($row as $column) {
 echo "<TD>";
 echo $column." ";
 echo "</TD>";
 }
 echo "</TR>";
 }
 echo "</TABLE>";

 ?>

 <script>

if(window.location.href.substr(-2) !== "?r") {
  window.location = window.location.href + "?r";
}

</script>
 <br>
 </form>
 </body>
 </html>