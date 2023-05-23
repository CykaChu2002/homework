var httpReq;
function countries() {
httpReq=new XMLHttpRequest();
if (httpReq==null) {
alert ("Your browser does not support AJAX!"); 
return;
} 
httpReq.open("POST","universities.php",true);
httpReq.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
httpReq.send("op=country");
httpReq.onreadystatechange=responseCountries;
}
function responseCountries() {
if (httpReq.readyState==4){
dropdown = document.getElementById("countryselect");
dropdown.add(new Option("Select ...", "0"));
var jsonList = JSON.parse(httpReq.responseText).list;
for(i=0; i<jsonList.length; i++)
dropdown.add(new Option(jsonList[i].name, jsonList[i].id));
}
}
function cities() {
document.getElementById("cityselect").innerHTML = "";
document.getElementById("universityselect").innerHTML = "";
unidata = document.getElementsByClassName("unidata");
for(i=0; i<unidata.length; i++)
unidata[i].textContent = "";
var countryid = document.getElementById("countryselect").value;
if (countryid != 0) {
httpReq=new XMLHttpRequest();
if (httpReq==null) {
alert ("Your browser does not support AJAX!"); 
return;
} 
httpReq.open("POST","universities.php",true);
httpReq.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
httpReq.send("op=city&id="+countryid);
httpReq.onreadystatechange=responseCities;
}
}
function responseCities() { 
if (httpReq.readyState==4){
dropdown = document.getElementById("cityselect");
dropdown.add(new Option("Select ...", "0"));
var jsonList = JSON.parse(httpReq.responseText).list;
for(i=0; i<jsonList.length; i++)
dropdown.add(new Option(jsonList[i].name, jsonList[i].id));
}
}
function universities() {
document.getElementById("universityselect").innerHTML = "";
unidata = document.getElementsByClassName("unidata");
for(i=0; i<unidata.length; i++)
unidata[i].textContent = "";
var cityid = document.getElementById("cityselect").value;
if (cityid != 0) {
httpReq=new XMLHttpRequest();
if (httpReq==null) {
alert ("Your browser does not support AJAX!"); 
return;
} 
httpReq.open("POST","universities.php",true);
httpReq.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
httpReq.send("op=university&id="+cityid);
httpReq.onreadystatechange=responseUniversities;
}
}
function responseUniversities() { 
if (httpReq.readyState==4){
dropdown = document.getElementById("universityselect");
dropdown.add(new Option("Select ...", "0"));
var jsonList = JSON.parse(httpReq.responseText).list;
for(i=0; i<jsonList.length; i++)
dropdown.add(new Option(jsonList[i].name, jsonList[i].id));
}
}
function university() {
unidata = document.getElementsByClassName("unidata");
for(i=0; i<unidata.length; i++)
unidata[i].textContent = "";
var universityid = document.getElementById("universityselect").value;
if (universityid != 0) {
httpReq=new XMLHttpRequest();
if (httpReq==null) {
alert ("Your browser does not support AJAX!"); 
return;
} 
httpReq.open("POST","universities.php",true);
httpReq.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
httpReq.send("op=info&id="+universityid);
httpReq.onreadystatechange=responseUniversity;
}
}
function responseUniversity() { 
if (httpReq.readyState==4){
var jsonList = JSON.parse(httpReq.responseText);
document.getElementById("name").textContent = jsonList.name;
document.getElementById("address").textContent = jsonList.address;
document.getElementById("tel").textContent = jsonList.tel;
document.getElementById("email").textContent = jsonList.email;
}
}
window.onload = function(){
countries();
document.getElementById("countryselect").onchange = function(){cities();}
document.getElementById("cityselect").onchange = function(){universities();}
document.getElementById("universityselect").onchange = function(){university();}
unidata = document.getElementsByClassName("unidata");
for(i=0; i<unidata.length; i++){
unidata[i].onmouseover = function(){ this.style.color = "red";}
unidata[i].onmouseout = function(){ this.style.color = "black";}
}
}
