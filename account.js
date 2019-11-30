window.onload = function(){
    var signout = document.getElementById("signout");
    signout.addEventListener("click", signOut); 
}

function signOut() {
    document.cookie = "Name= ; expires = Thu, 01 Jan 1970 00:00:00 GMT";
    document.cookie = "Email= ; expires = Thu, 01 Jan 1970 00:00:00 GMT";
    document.cookie = "Password= ; expires = Thu, 01 Jan 1970 00:00:00 GMT";
    document.cookie = "Email= ; expires = Thu, 01 Jan 1970 00:00:00 GMT";
    location.reload();
}