<?php 
 
    if(isset($_SESSION['user']))
        echo "Welcome: ".$_SESSION['fn']." ".$_SESSION['ln']." ! &nbsp &nbsp &nbsp &nbsp Username: ".$_SESSION['user'] ;
?>