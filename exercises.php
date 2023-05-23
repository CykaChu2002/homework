<style>
select{
  border:none;
  padding: 10px 20px;
  border-radius:5px;
}

select:focus{
  outline:none;
}
</style>

<script>
       
       function kivalaszt(){

        if(document.getElementById("exercises").value=="Cookies"){
        
            document.getElementById("page").innerHTML=`<object type="text/php" data="exercises/cookies.php" style="width:500px; height:500px;"></object>`;
        
       } else if(document.getElementById("exercises").value=="Sending_emails"){

            document.getElementById("page").innerHTML=`<object type="text/php" data="exercises/sendingemails.php" style="width:500px; height:500px;"></object>`;

       } else if(document.getElementById("exercises").value=="Web_Storage"){

            document.getElementById("page").innerHTML=`<object type="text/html" data="exercises/webstorage.html" style="width:200px; height:300px;"></object>`;

       } else if(document.getElementById("exercises").value=="Session_Storage"){

            document.getElementById("page").innerHTML=`<object type="text/php" data="exercises/sessionstorage.php" style="width:500px; height:500px;"></object>`;
            
       } else if(document.getElementById("exercises").value=="Local_Storage"){

            document.getElementById("page").innerHTML=`<object type="text/php" data="exercises/localstorage.php" style="width:200px; height:300px;"></object>`;

       } else if(document.getElementById("exercises").value=="Web_Workers"){

            document.getElementById("page").innerHTML=`<object type="text/php" data="exercises/webworkers.php" style="width:800px; height:800px;"></object>`;

        } else if(document.getElementById("exercises").value=="Server_Sent_Events"){

            document.getElementById("page").innerHTML=`<object type="text/php" data="exercises/serversentevents.php" style="width:800px; height:800px;"></object>`;

        } else if(document.getElementById("exercises").value=="Geolocation"){

            document.getElementById("page").innerHTML=`<object type="text/html" data="exercises/geolocation.html" style="width:800px; height:800px;"></object>`;

        }else if(document.getElementById("exercises").value=="Drag_And_Drop_API"){

            window.open("exercises/draganddrop.html", "_blank");

        } else if(document.getElementById("exercises").value=="Canvas"){

            document.getElementById("page").innerHTML=`<object type="text/html" data="exercises/canvas.html" style="width:800px; height:800px;"></object>`;

        } else if(document.getElementById("exercises").value=="SVG"){

            window.open("exercises/svg.html", "_blank");

        } else if(document.getElementById("exercises").value=="Responsive"){

            window.open("exercises/responsive.html", "_blank");

        } else if(document.getElementById("exercises").value=="Sass"){

            window.open("exercises/sass.html", "_blank");

        } else if(document.getElementById("exercises").value=="Ajax1"){

            window.open("exercises/ajax.html", "_blank");

        } else if(document.getElementById("exercises").value=="Ajax2"){

            window.open("exercises/universities.html", "_blank");
        }

    }
    </script>

<html>
<body>

<div style="text-align:center">
<h2>Exercises:</h2>

</div>
<div style="text-align:center">
<select id="exercises" onchange="kivalaszt()">
  <option value="Select" selected hidden>Select one exercise</option>
  <option value="Cookies">Cookies</option>
  <option value="Sending_emails">Sending Emails</option>
  <option value="Web_Storage">Web Storage</option>
  <option value="Session_Storage">Session Storage</option>
  <option value="Local_Storage">Local Storage</option>
  <option value="Web_Workers">Web Workers</option>
  <option value="Server_Sent_Events">Server Sent Events</option>
  <option value="Geolocation">Geolocation</option>
  <option value="Drag_And_Drop_API">Drag and Drop API</option>
  <option value="Canvas">Canvas</option>
  <option value="SVG">SVG</option>
  <option value="Responsive">Responsive Web Design</option>
  <option value="Sass">Sass</option>
  <option value="Ajax1">Ajax1</option>
  <option value="Ajax2">Ajax2</option>
</select>
</div>


<div id="page">

</div>



</body>
</html>