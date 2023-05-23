
<script>
        fetch('server/s_list_hirdetes.php')
            .then(response => response.json())
            .then(data => renderHirdetesList(data))
            
        function renderHirdetesList(data){
            let returnStr = ``
            for(let obj of data){
                returnStr +=`
                        <a href="hirdetesek/objektivek/${obj.id}">
                                <div class="flex flex-row hirdetes-list-item" style="border: 2px solid var(--gray); ">
                                        <div class="m-r-1vw" style="width: 30%; text-align: center;">
                                                <img src="hirdetesek/objektivek/${obj.id}/img/${obj.fokepURL}" alt="No image">
                                        </div>
                                        <div class="flex flex-col mx-10vw justify-between" style="width: 70%;">
                                                <span class="flex flex-row justify-between" style="color: var(--gray);">
                                                        <span>
                                                                <img class="sml-icon" style="max-height: 200px;" src="/img/waypoint.png" alt="">
                                                                ${obj.nev}
                                                        </span>
                                                        <span>
                                                                <img class="sml-icon" style="max-height: 200px;" src="/img/calendar.png" alt="">
                                                                ${obj.feladas_datum}
                                                        </span>  
                                                </span>
                                                <span class="hirdetes-list-cim flex flex-row">
                                                ${obj.cim}
                                                </span>
                                                <span class="hirdetes-list-ar">${obj.ar} HUF</span>
                                        </div>
                                </div>
                        </a>
                `
            }
            document.getElementById('hirdetes-list').innerHTML += returnStr
        }  
</script>

<div class="main hirdetes-list flex-row" id="hirdetes-list"></div>

<div style="text-align:center;">
<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2726.3375296155727!2d19.66695091525771!3d46.89607994478184!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4743da7a6c479e1d%3A0xc8292b3f6dc69e7f!2sPallasz+Ath%C3%A9n%C3%A9+Egyetem+GAMF+Kar!5e0!3m2!1shu!2shu!4v1475753185783" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
</div>