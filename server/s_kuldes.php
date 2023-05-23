<?php
require_once "db.php";
require_once "folders.php";

extract($_POST);
$kepString;
$kat="";
$jsKepString="";
//$hirdetes_infok_id=NULL;

    $stmt = $db->prepare("INSERT INTO hirdetes_infok (cim, ar, elerheto, leiras, kiemelt, mobil, email, telepulesek_id)                        
                        VALUES (?, ?, ?, ?, ?, ?, ?,  (SELECT IF( (SELECT id FROM telepulesek WHERE nev = ?) IS NOT NULL, (SELECT id FROM telepulesek WHERE nev = ?), (SELECT id FROM telepulesek WHERE id = 1) )))");
    $stmt->execute(Array($cim, $ar, 1, $leiras, 0, $mobil, $email, $telepules, $telepules));
    $hirdetes_infok_id = $db->lastInsertId();

    switch($kategoriak){
        case "1";
            $kat="objektivek";
            break;
        case "2";
            $kat="fenykepezogep";
            break;
    }
        mkdir("../hirdetesek/".$kat);
        mkdir("../hirdetesek/".$kat."/".$hirdetes_infok_id);
        mkdir("../hirdetesek/".$kat."/".$hirdetes_infok_id."/img");
    
    $target_dir ="../hirdetesek/".$kat."/".$hirdetes_infok_id."/"."img/";    
    
    $target_file = $target_dir.basename($_FILES["fokep"]["name"]);
    
    $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
    $uploadOk = 1;
   
    if($uploadOk == 0){
       
        header("Location: http://localhost/ERROR.html");
    }else {
        $temp = explode(".", $_FILES["fokep"]["name"]);
        $newfilename ="fokep".'.'.end($temp);
        $fokepnev=$newfilename;
        move_uploaded_file($_FILES["fokep"]["tmp_name"],$target_dir.basename($newfilename));
        $jsKepString="\"$fokepnev\"";


        $fileCount = count($_FILES["kepek"]["name"]);
    
        for($i=0; $i<$fileCount; $i++){
            $fileName = $_FILES["kepek"]["name"][$i];
            $temp = explode(".", $_FILES["kepek"]["name"][$i]);
            $newfilename=$i.'.'.end($temp);
            $jsKepString.=','.'"'.$newfilename.'"';
            $kepString .= $newfilename.";";
            move_uploaded_file($_FILES["kepek"]["tmp_name"][$i], $target_dir.basename($newfilename));
        }

        try{
            $stmt = $db->prepare("INSERT INTO kepek (kep_string, count_kepek) VALUES (:kep_string, :count_kepek)");
            $stmt->bindParam(':kep_string', $kepString);
            $stmt->bindParam(':count_kepek', $fileCount);
            $stmt->execute();

            $kepek_id = $db->lastInsertId();
            $stmt = $db->prepare("UPDATE hirdetes_infok SET kepek_id = $kepek_id WHERE id = $hirdetes_infok_id;");
            $stmt->execute();
        }catch (PDOException $e){
            echo "Error: " . $e->getMessage();
        }
        
      
    }

    try{
        $stmt = $db->prepare("UPDATE hirdetes_infok SET fokepURL = :fokepURL WHERE id = $hirdetes_infok_id");
        $stmt->bindParam(':fokepURL', $fokepnev);
        $stmt->execute();
    }catch(PDOException $e){
        echo "Error: " . $e->getMessage();
    }

    try{
        $stmt = $db->prepare("SELECT feladas_datum FROM hirdetes_infok WHERE id = :hirdetes_infok_id");
        $stmt->bindParam(':hirdetes_infok_id', $hirdetes_infok_id);
        $stmt->execute();
    }catch(PDOException $e){
        echo "Error: " . $e->getMessage();
    }

   $fajl = fopen('../hirdetesek/'.$kat.'/'.$hirdetes_infok_id.'/index.php', "w");
   $indexTartalom="<!DOCTYPE html>
   <html lang=\"hu\">
   <head>
       <meta charset=\"UTF-8\">
       <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">
       <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
       <link rel=\"stylesheet\" href=\"../../../style/style.css\">
       <title> Ad | ".$cim."</title>
   </head>
   <body>
        <?php 
            require \"../../../menu.php\";
        ?>
        <script>
            let kepTomb=[".$jsKepString."]
            let kepindex = 0
                function mutatKep(ki){
                    if(kepindex+ki>=kepTomb.length){
                        kepindex=0;
                    } else if(kepindex+ki<0){
                        kepindex=kepTomb.length
                    }
                    kepindex+=ki
                    document.getElementById(\"kepecske\").src=\"img/\"+kepTomb[kepindex]
                }
            document.body.onkeydown = (e) =>{
                switch(e.key){
                    case 'ArrowLeft':
                        mutatKep(-1)
                    break;
                    case 'ArrowRight':
                        mutatKep(1)
                    break;

                }
            }
        </script>
        <div class=\"main\">
            <div class=\"flex flex-col mb-2\">
                <div style=\"background-color: var(--gray-light); border-radius: 10px; margin-bottom: 20px;\">
                    <h1 style=\"margin-left: 2vw; margin-right: 2vw; color: var(--indigo); font-size: 2em;\">".$cim."</h1>
                </div>
                <div class=\"text-center\">
                    <img id=\"kepecske\" src=\"img/".$fokepnev."\">
                </div>
                <div class=\"text-center\">
                    <button class=\"img-arrow\" onclick=\"mutatKep(-1)\">Next image</button>
                </div>       
            </div>
            <div style=\"padding: 12px 2vw; background-color: var(--gray-light); border-radius: 10px; margin-bottom: 2rem;\">
                <h2 style=\"color: var(--black);\">".$cim."</h2> 
                <h2 style=\"color: var(--indigo);\">".$ar." HUF</h2>
                <h4 style=\"color: var(--black);\">".$leiras."</h4>    
                <div class=\"flex flex-row\">
                    <img src=\"../../../img/waypoint.png\" alt=\"\" class=\"sml-icon m-r-1vw\"> <span style=\"color: var(--black); font-size: 16pt;\">".$telepules."</span>
                </div>
            </div>
            <div style=\"padding: 30px 2vw; background-color: var(--gray-light); border-radius: 10px; margin-bottom: 2rem;\">
            <div class=\"flex flex-row\">
                    <img src=\"../../../img/phone.png\" alt=\"\" class=\"sml-icon m-r-1vw\"> <a style=\"color: var(--black); font-size: 16pt;\" href=\"tel:$mobil\">".$mobil."</a>
                </div>
                <div class=\"flex flex-row\">
                    <img src=\"../../../img/email.png\" alt=\"\" class=\"sml-icon m-r-1vw\"> <a style=\"color: var(--black); font-size: 16pt;\" href=\"mailto:$email\">".$email."</a>
                </div>
            </div>
        </div>
   </body>
   </html>";
   fwrite($fajl, $indexTartalom);

   fclose($fajl);

   header('Location: http://localhost/hirdetesek/'.$kat.'/'.$hirdetes_infok_id.'/');

 if($kategoriak=="1"){
        /* OBJEKTÍV */
        if(!isset($_POST['fix_fokusz'])){   $fix_fokusz=0;  }
        if(!isset($_POST['fix_rekesz'])){   $fix_rekesz=0;  }
        if(!isset($_POST['stablizator'])){  $stablizator=0; }
        if(!isset($_POST['autofokusz'])){   $autofokusz=0;  }
    
        if($fix_rekesz=="on"){ $fix_rekesz=1; } else { $fix_rekesz=0; }
        if($fix_fokusz=="on"){ $fix_fokusz=1; } else { $fix_fokusz=0; }
        if($autofokusz=="on"){ $autofokusz=1; } else { $autofokusz=0; }
        if($stablizator=="on"){ $stablizator=1; } else { $stablizator=0; }
     
 }
    
?>
