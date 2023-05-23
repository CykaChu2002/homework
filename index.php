<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style/style.css">
    <title>Camera advertising page</title>
</head>
<body>
    <?php 
        require "menu.php";
    ?>
   


    <?php
    
      if (isset($_GET['s'])) {
          include $_GET['s'];
      } else include("fooldal.php");
      ?>
      
    
</body>
</html>