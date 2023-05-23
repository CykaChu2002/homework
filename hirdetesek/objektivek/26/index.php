<!DOCTYPE html>
   <html lang="hu">
   <head>
       <meta charset="UTF-8">
       <meta http-equiv="X-UA-Compatible" content="IE=edge">
       <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <link rel="stylesheet" href="../../../style/style.css">
       <title> Ad | Test</title>
   </head>
   <body>
        <?php 
            require "../../../menu.php";
        ?>
        <script>
            let kepTomb=["fokep.jpg","0.jpg"]
            let kepindex = 0
                function mutatKep(ki){
                    if(kepindex+ki>=kepTomb.length){
                        kepindex=0;
                    } else if(kepindex+ki<0){
                        kepindex=kepTomb.length
                    }
                    kepindex+=ki
                    document.getElementById("kepecske").src="img/"+kepTomb[kepindex]
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
        <div class="main">
            <div class="flex flex-col mb-2">
                <div style="background-color: var(--gray-light); border-radius: 10px; margin-bottom: 20px;">
                    <h1 style="margin-left: 2vw; margin-right: 2vw; color: var(--indigo); font-size: 2em;">Test</h1>
                </div>
                <div class="text-center">
                    <img id="kepecske" src="img/fokep.jpg">
                </div>
                <div class="text-center">
                    <button class="img-arrow" onclick="mutatKep(-1)">Next image</button>
                </div>       
            </div>
            <div style="padding: 12px 2vw; background-color: var(--gray-light); border-radius: 10px; margin-bottom: 2rem;">
                <h2 style="color: var(--black);">Test</h2> 
                <h2 style="color: var(--indigo);">13000 HUF</h2>
                <h4 style="color: var(--black);">This is a test description</h4>    
                <div class="flex flex-row">
                    <img src="../../../img/waypoint.png" alt="" class="sml-icon m-r-1vw"> <span style="color: var(--black); font-size: 16pt;">Abony</span>
                </div>
            </div>
            <div style="padding: 30px 2vw; background-color: var(--gray-light); border-radius: 10px; margin-bottom: 2rem;">
            <div class="flex flex-row">
                    <img src="../../../img/phone.png" alt="" class="sml-icon m-r-1vw"> <a style="color: var(--black); font-size: 16pt;" href="tel:06123456789">06123456789</a>
                </div>
                <div class="flex flex-row">
                    <img src="../../../img/email.png" alt="" class="sml-icon m-r-1vw"> <a style="color: var(--black); font-size: 16pt;" href="mailto:test@gmail.com">test@gmail.com</a>
                </div>
            </div>
        </div>
   </body>
   </html>