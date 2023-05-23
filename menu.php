<nav>
        <a href="http://localhost/index.php?s=fooldal.php">Main page</a>
        <?php 
            session_start();
            include("ad.php");
        ?>
        <a href="http://localhost/index.php?s=kapcsolat.php">Contact</a>
        <a href="http://localhost/index.php?s=exercises.php">Exercises</a>
<?php        
       
        include("top.php");
        if(!isset($_SESSION['user'])){

            echo '<h3>Logged in as guest</h3>';
            echo '<a href="http://localhost/index.php?s=login.php">Login</a>'; 

        }else{

        echo ' <a href="http://localhost/index.php?s=logout.php">Logout</a>'; 
    } 
?>
    </nav>