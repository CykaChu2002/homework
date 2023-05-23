<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Contact page</title>

    <script type="text/javascript">

function redirect(){

    window.open("contactcontent.php");
    

}
function formCheck() {
    document.getElementById('send').disabled = (document.getElementById('email').value.length == 0) || (document.getElementById('subject').value.length == 0) || (document.getElementById('message').value.length == 0);

        var message = document.getElementById("message");

        if (message.value.length == 0) {
            message.style.background = '#f99';
           
        } else
            message.style.background = '#9f9';
            

        var subject = document.getElementById("subject");

        if (subject.value.length == 0) {
            subject.style.background = '#f99';
        } else
            subject.style.background = '#9f9';


        var email = document.getElementById("email");

        var checkPattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{3,4})+$/;

        if (!checkPattern.test(email.value)) {
            email.style.background = '#f99';
  
        } else
            email.style.background = '#9f9';
 

         
    } 

function init() {
    document.getElementById('send').disabled = true;
    document.getElementById('email').addEventListener('keyup', formCheck);
    document.getElementById('subject').addEventListener('keyup', formCheck);
    document.getElementById('message').addEventListener('keyup', formCheck);
}
</script>

<?php 
  try {
  

    $dbh = new PDO('mysql:host=localhost;dbname=aprofoto', 'root', '', array(PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION));
    $dbh->query('SET NAMES utf8 COLLATE utf8_general_ci');
    
    
    if(isset($_POST["send"]))
    {
      
        $sql = "insert into messages values (0, '".$_POST['name']."', '".$_POST['email']."', '".$_POST['subject']."', '".$_POST['message']."')";
      
        $count = $dbh->exec($sql);
        $newid = $dbh->lastInsertId();
       echo "Your message has been sent!";
        header("location: index.php");
    }
    
    
  }
  catch (PDOException $e) {

    echo "Error: ".$e->getMessage();
    

    if (empty($name)) { 
		echo "Username is required"; 
	}
	if (empty($email)) { 
		echo "Email is required"; 
	}
	if (empty($subject)) { 
		echo "Subject is required"; 
	}
    if (empty($message)) { 
		echo "Message is required"; 
	}
  }

?>
</head>
<body onload="init()">

    <div style="float:left;">
        <h2>Contact</h2>
        <p>Managers: <strong>Peter Karoly and David Hilbert</strong></p>
        <p>E-mail: <strong>peterkaroly@gmail.com and davidhilbert@gmail.com</strong></p>
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2726.3375296155727!2d19.66695091525771!3d46.89607994478184!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4743da7a6c479e1d%3A0xc8292b3f6dc69e7f!2sPallasz+Ath%C3%A9n%C3%A9+Egyetem+GAMF+Kar!5e0!3m2!1shu!2shu!4v1475753185783" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
    </div>
        
    <form id="contact" method="post">
    <div style="float:right; padding-right:25%; padding-top:5%;">
        <table>
            <tr>
                <td>
                Send us a message! <br> <br>

                </td>
             </tr>

            <tr>
                <td>
                Name: 

                </td>
                <td>
                <input type="text" name="name" id="name" value="<?php
                
                if(isset($_SESSION['user']))
                echo $_SESSION['user'] ;

                else{

                    echo "Guest";

                }
                ?>" readonly="readonly"><br>
                </td>
             </tr>
             
                
             <tr>
                <td>
                E-mail: 

                </td>
                <td>
                <input type="text" name="email" id="email"><br>
                </td>
             </tr>

             <tr>
                <td>
                Subject:

                </td>
                <td>
                <input type="text" name="subject" id="subject"><br>
                </td>
             </tr>

             <tr>
                <td>
                Message: 

                </td>
                <td>
                <textarea name="message" id="message" rows="5" cols="40" style="resize: none;"></textarea><br>
                </td>

             </tr>
             <tr>
                <td>

                </td>
                <td>
                <input value="Send" name="send" id="send" type="submit" onclick=redirect()>
                </td>

             </tr>
        </table>
    </div>
    </form>


</body>
</html>
