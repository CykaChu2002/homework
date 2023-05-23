function showSelected(){
    
    let hirdetesStr = ''
    
    if(document.getElementById("kategoriak").value==1){ 
        hirdetesStr =``
        hirdetesStr += `<div class="flex justify-between mb-1" id="objektiv_marka_select"><span class="form-text">Brand of the lens</span></div>`

        fetch('../server/s_objektiv_marka.php')
            .then(response => response.json())
            .then(data => renderObjektivMarka(data))
            
        function renderObjektivMarka(data){
            let returnStr = '' 
            returnStr += '<select class="form-input" name="objektiv_marka" id="objektiv_marka" required> <option selected hidden>Choose brand</option>'
            for(let obj of data){
                returnStr += `<option id="${obj.id}" value="${obj.id}"> ${obj.nev}</option>`
            }
            returnStr += '</select>'
            document.getElementById('objektiv_marka_select').innerHTML += returnStr
        }

        hirdetesStr += `<div class="flex justify-between mb-1" style="height: 100px; border: none;"><span class="form-text">Fixed Focal Length<input type="checkbox" name="fix_fokusz" id="fix_fokusz" onchange="showFokusztav();"></span>`
        hirdetesStr += `<div class="form-input" style="border: none;" id="fokusz_div"></div></div>`

        hirdetesStr += `<div class="flex justify-between mb-1" style="height: 100px; border: none;"><span class="form-text">Fixed aperture<input type="checkbox" name="fix_rekesz" id="fix_rekesz" onchange="showRekesz();"></span>`
        hirdetesStr += `<div class="form-input" style="border: none;" id="rekesz_div"></div></div>`

        hirdetesStr += `<div class="flex justify-between mb-1"><span class="form-text">Stabilizer<input type="checkbox" name="stabilizator" id="stabilizator"></span></div>`
        hirdetesStr += `<div class="flex justify-between mb-1"><span class="form-text">Auto focus<input type="checkbox" name="autofokusz" id="autofokusz"></span></div>`

        hirdetesStr += `<div class="flex justify-between mb-1" id="bajonett_select"><span class="form-text">Bayonet</span></div>`

        fetch('../server/s_objektiv_bajonett.php')
            .then(response => response.json())
            .then(data => renderObjektivBajonett(data))
            
        function renderObjektivBajonett(data){
            let returnStr = '' 
            returnStr += '<select class="form-input" name="bajonett" id="bajonett" required> <option selected hidden>Choose a bayonet</option>'
            for(let obj of data){
                returnStr += `<option id="${obj.id}" value="${obj.id}"> ${obj.nev}</option>`
            }
            returnStr += '</select>'
            document.getElementById('bajonett_select').innerHTML += returnStr
        }


        
    }else if(document.getElementById("kategoriak").value==2){ 
        console.log("Kamera");
    }

    document.getElementById("hirdetes_adatok").innerHTML = hirdetesStr;
    if(document.getElementById("kategoriak").value==1){
        showFokusztav();
        showRekesz();
    }




}