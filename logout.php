<?php
    session_unset();
    include("top.php");
    if(!isset($_SESSION['user']))
    echo '<H3>You successfully logged out.</H3>';
    header("Location:http://localhost/index.php");
    exit();
?>