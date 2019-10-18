window.onload = function() {
    var green = document.getElementById("storeItem1");
    var skyblue = document.getElementById("storeItem2");
    var khaki = document.getElementById("storeItem3");

    green.addEventListener("click", this.changeToGreen);
    skyblue.addEventListener("click", changeToSkyBlue);
    khaki.addEventListener("click", changeToKhaki);
}

function changeToGreen() {
    document.body.style.background = 'forestgreen';
}

function changeToSkyBlue() {
    document.body.style.background = 'lightskyblue';
}

function changeToKhaki() {
    document.body.style.background = 'khaki';
}