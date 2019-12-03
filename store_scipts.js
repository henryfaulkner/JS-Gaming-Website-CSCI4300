window.onload = function() {
    var green = document.getElementById("storeItem1");
    var skyblue = document.getElementById("storeItem2");
    var khaki = document.getElementById("storeItem3");

    //loads background color from local storage
    bgcolor = localStorage.bgcolor;
    document.body.style.background = bgcolor;

    green.addEventListener("click", this.changeToGreen);
    skyblue.addEventListener("click", changeToSkyBlue);
    khaki.addEventListener("click", changeToKhaki);
}

function changeToGreen() {
    window.location = "buyGreen.jsp";
/*if(getCookie("Tokens") == null)
{
document.getElementById("storeMessage").textContent = "Please create an account or login to purchase items."
}
else if(getCookie("Tokens") < 5)
{
document.getElementById("storeMessage").textContent = "Not enough tokens to buy this item."
}
else
{
document.body.style.background = 'forestgreen';
localStorage.bgcolor = 'forestgreen';
var newTokens = getCookie("Tokens") - 5;
setCookie("Tokens", newTokens);
}*/
}

function changeToSkyBlue() {
    window.location = "buyBlue.jsp";
/*if(getCookie("Tokens") == null)
{
document.getElementById("storeMessage").textContent = "Please create an account or login to purchase items."
}
else if(getCookie("Tokens") < 10)
{
document.getElementById("storeMessage").textContent = "Not enough tokens to buy this item."
}
else
{
   document.body.style.background = 'lightskyblue';
   localStorage.bgcolor = 'lightskyblue';
   var newTokens = getCookie("Tokens") - 10;
setCookie("Tokens", newTokens);
}*/
}

function changeToKhaki() {
    window.location = "buyKhaki.jsp";
/*if(getCookie("Tokens") == null)
{
document.getElementById("storeMessage").textContent = "Please create an account or login to purchase items."
}
else
{
document.body.style.background = 'khaki';
localStorage.bgcolor = 'khaki';
}*/
}
