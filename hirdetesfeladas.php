<form id="hirdetesfeladas_form" class="flex m-a flex-col main hirdetes-form" method="POST" enctype="multipart/form-data" onsubmit="kuldes();">
        <div>
            <h1 class="text-center">Place an ad</h1>
        </div>
        <div class="flex justify-between mb-1 input-control">
            <span class="form-text">Title of the ad</span>
            <input class="form-input" type="text" name="cim" id="cim" class="" placeholder="Title of the ad" title="Special characters are not allowed.">
        </div>
        <div class="flex justify-between mb-1 input-control" id="kategoriak_select">
            <span class="form-text">Select category</span>
        </div>
        <div class="flex justify-between mb-1 input-control">
            <span class="form-text">Description</span>
            <textarea class="form-input" name="leiras" id="leiras" cols="30" rows="1" placeholder="Description of the product"  title="Special characters are not allowed."></textarea>
        </div>
        <div class="flex justify-between mb-1 input-control">
            <span class="form-text">Email address</span>
            <input class="form-input" type="text" name="email" id="email" class="" placeholder="Email address" title="Special characters are not allowed.">
        </div>
        <div class="flex justify-between mb-1 input-control">
            <span class="form-text">Phone number</span>
            <input class="form-input" type="text" name="mobil" id="mobil" class="" placeholder="Phone number" title="Special characters are not allowed.">
        </div>
        <div class="flex justify-between mb-1 input-control">
            <span class="form-text">Price</span>
            <input class="form-input" type="number" name="ar" id="ar" placeholder="Price" class="" >
        </div>
        <div class="flex justify-between mb-1 input-control">
            <span class="form-text">City</span>
            <input class="form-input" list="telepulesek" name="telepules" placeholder="Choose a city" >
            <datalist id="telepulesek">

            </datalist>
        </div>
        <div class="flex justify-between mb-1 input-control">
            <label class="form-text" for="fokep">Main image</label>
            <span class="form-input" style="height: 220px; border: none;">
                <label for="fokep" class="kep-button">Choose an image</label>
                <input type="file" name="fokep" id="fokep" onchange="PreviewImage();" accept=".jpg, .jpeg, .png" >
                <div>
                    <img id="uploadPreview" style="max-height: 180px; margin-top: 12px;">
                </div>
                
            </span>
            
        </div>
        <div class="flex justify-between mb-1 input-control">
            <label class="form-text" for="kepek">More images</label>
            <span class="form-input" style="height: 440px; border: none;">
                <label for="kepek" class="kep-button">Choose an image</label>
                <input type="file" name="kepek[]" id="kepek" onchange="PreviewImages(event);" accept=".jpg, .jpeg, .png" multiple required>
                <div id="uploadPreviews">

                </div>  
            </span>
        </div>
        <div id="hirdetes_adatok">
        </div>
        <input type="submit" class="form-submit" value="Place the ad">
    </form>

<script>
    function PreviewImage(){
        document.getElementById("uploadPreview").src = "";
        var oFRreader = new FileReader();        
        oFRreader.readAsDataURL(document.getElementById("fokep").files[0]);

        oFRreader.onload = function (oFREvent){
            document.getElementById("uploadPreview").src = oFREvent.target.result;
        }
        
    }
    function PreviewImages(event){
        var saida = document.getElementById("kepek");
        var quantos = saida.files.length;
        if(quantos > 10){
            alert("Only 10 files can be selected.")
        }else{
            for(i=0; i<quantos; i++){
                var urls = URL.createObjectURL(event.target.files[i]);
                document.getElementById("uploadPreviews").innerHTML += 
                '<img src="'+urls+'" style="max-height: 120px; margin-right: 10px; margin-top:12px;">';
            }
        }
       
    }    
</script>
<script defer>

function kuldes(){  
    const formData = new FormData(document.getElementById("hirdetesfeladas_form"))
    const kat = ["objektiv","fenykepezogep"]
    if(document.getElementById("kategoriak").value==1){
        if(document.getElementById("fix_rekesz").checked){
            formData.append('min_rekesz',rekesz.value)
            formData.append('max_rekesz',rekesz.value)
        }
        if(document.getElementById("fix_fokusz").checked){
            formData.append('min_fokusztav',fokusztav.value)
            formData.append('max_fokusztav',fokusztav.value)
        }
    }
    
    
    
    console.log("obj of formData: \n");
    for(let obj of formData){
        console.log(obj);
    }
    
    
    fetch(`../server/s_kuldes.php`,{method:"POST",body:formData})
        .then(response => response.text())

    }

</script>


<script defer src="js/fromvalidation.js"></script>
<script src="js/kategoriak.js"></script>
<script src="js/hirdetesfeladas.js"></script>
<script src="js/objektiv.js"></script>
<script src="js/telepules.js"></script>
<?php
        
?>