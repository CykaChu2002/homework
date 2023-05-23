<?php
 switch($_POST['op']) {
 case 'country':
 $result = array("list" => array());
 try {
 $dbh = new PDO('mysql:host=localhost;dbname=universities', 'root', '', 
array(PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION));
 $dbh->query('SET NAMES utf8 COLLATE utf8_general_ci');
 $stmt = $dbh->query("select idcountry, name from country");
 while($row = $stmt->fetch(PDO::FETCH_ASSOC))
 $result["list"][] = array("id" => $row['idcountry'], "name" => $row['name']);
 }
 catch(PDOException $e) {
 }
 echo json_encode($result);
 break;
 case 'city':
 $result = array("list" => array());
 try {
 $dbh = new PDO('mysql:host=localhost;dbname=universities', 'root', '', 
array(PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION));
 $dbh->query('SET NAMES utf8 COLLATE utf8_general_ci');
 $stmt = $dbh->prepare("select idcity, name from city where idcountry = :id");
 $stmt->execute(Array(":id" => $_POST["id"]));
 while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
 $result["list"][] = array("id" => $row['idcity'], "name" => $row['name']);
 }
 }
 catch(PDOException $e) {
 }
 echo json_encode($result);
 break;
 case 'university':
 $result = array("list" => array());
 try {
 $dbh = new PDO('mysql:host=localhost;dbname=universities', 'root', '',
 array(PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION));
 $dbh->query('SET NAMES utf8 COLLATE utf8_general_ci');
 $stmt = $dbh->prepare("select iduniversity, name from university where idcity = :id");
 $stmt->execute(Array(":id" => $_POST["id"]));
 while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
 $result["list"][] = array("id" => $row['iduniversity'], "name" => $row['name']);
 }
 }
 catch(PDOException $e) {
 }
 echo json_encode($result);
 break;
 case 'info':
 $result = array("name" => "", "address" => "", "tel" => "", "email" => "");
 try {
 $dbh = new PDO('mysql:host=localhost;dbname=universities', 'root', '',
 array(PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION));
 $dbh->query('SET NAMES utf8 COLLATE utf8_general_ci');
 $stmt = $dbh->prepare("select name, address, telefon, email from university where iduniversity = 
:id");
 $stmt->execute(Array(":id" => $_POST["id"]));
 if($row = $stmt->fetch(PDO::FETCH_ASSOC)) 
 $result = array("name" => $row['name'], "address" => $row['address'], "tel" => $row['telefon'], 
"email" => $row['email']);
 }
 catch(PDOException $e) {
 }
 echo json_encode($result);
 break;
 }
?>