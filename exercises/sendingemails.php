<html>
<body>
<?php
if (isset($_POST['email'])) {
$email = $_POST['email'] ;
$subject = $_POST['subject'] ;
$message = $_POST['message'] ;
mail( "somebody@mail.com", "Subject: $subject", $message, "From: $email" );
echo "Thank you for your message.";
} else {
echo "<form method='post' action='mailform.php'>
Email: <input name='email' type='text'><br>
Tárgy: <input name='subject' type='text'><br>
Message:<br>
<textarea name='message' rows='15' cols='40'>
</textarea><br>
<input type='submit'>
</form>";
}
?>
</body>
</html>