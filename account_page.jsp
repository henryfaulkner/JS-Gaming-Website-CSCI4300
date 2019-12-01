<!DOCTYPE html>
<html lang='en'>
    <head>
        <title>Account Page</title>
        <link rel="stylesheet" href="stylesheet.css">
        <script src="account.js"></script>
        <meta charset="UTF-8">
    </head>
    <body>
        <script>document.body.style.background = localStorage.bgcolor;</script>
        <div class = "navBar">
            <h3 id="screenname"style="text-align: right; margin-bottom:0px; margin-right:10px;"></h3>
            <h3 id="tokens" style="text-align: right; margin-bottom:0px; margin-right:10px; margin-top:0px;"></h3>
            <h1>Sign up for your gaming account now!</h1>
            <h2>Be the highest scorer!!</h2>
            <nav>
                <ul class="mainMenu">
                    <li class="subnav"><a href="index.jsp">Home Page</a></li>
                    <li class="subnav"><a href="Snake_Game/snake_page.jsp">Snake Game</a></li>
                    <li class="subnav"><a href="Birdy_Flap/birdy_page.jsp">Flappy Bird</a></li>
                    <li class="subnav"><a href="high_scores.jsp">High Scores</a></li>
                    <li class="subnav"><a href="account_page.jsp">Account Info</a></li>
                    <li class="subnav" style="margin-left:1%"><a href="store.jsp">Store</a></li>
                </ul>
            </nav>
        </div>
        <%@ page import="java.util.*" %>
        <%@ page import="java.sql.*" %>
        <%Cookie [] cookies = request.getCookies();%>
        
        <script>
            function getCookie(name) {
                var cookieArr = document.cookie.split(";");
                for(var i = 0; i < cookieArr.length; i++) {
                    var cookiePair = cookieArr[i].split("=");
                    if(name == cookiePair[0].trim()) {
                        return decodeURIComponent(cookiePair[1]);
                    }
                }
                return null;
            }//getCookie()
            if(document.getElementById("screenname") && getCookie("Name") != null && getCookie("Tokens") != null){
                document.getElementById("screenname").textContent = "Welcome, " + getCookie("Name");
                document.getElementById("tokens").textContent = "Tokens: " + getCookie("Tokens");
            }
        </script>

        <br>
        
        <div class = "accountPage">
        
            <div class="firstInfo">
                <form id="firstForm" action="registered.jsp" method="post"> 
                    <fieldset class="firstFieldset">
                        <legend style="text-align: center;"><h2>Register</h2></legend>
                        <span title = "Name displayed on your profile and high score tables.">
                            <label>Screen Name: </label>
                        </span>
                        <input type="text" name="name" maxlength="20" size="45" pattern="[a-zA-Z0-9]+"> <br>
                        <span title = "Used to login, not displayed to other users.">
                            <label> Email: </label>
                        </span>
                        <input type="text" name ="email" maxlength="25" size="45" pattern="[a-zA-Z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" style="margin-left:48px"> <br>
                        <span title = "Must be at least 8 characters long, contain both upper and lower-case letters, and have at least one digit.">
                            <label>Password: </label>
                        </span> 
                        <input type="text" name="password" maxlength="20" size="45" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$" style="margin-left:25px"> <br>
                        <button type="submit" id = "registerButton">Register</button>
                    </fieldset>
                </form>
                <p style="margin-left:120px; text-align: left;">Passwords must be at least 8 characters long and contain<br> at least one uppercase letter, one lowercase letter, and one number.</p>
            </div>

            <div class="secondInfo">
                <form id="secondForm" method="post"> 
                    <fieldset class="secondFieldset">
                        <legend style="text-align: center;"><h2>Log In</h2></legend>
                        <label> Email: </label>
                        <input type="text" name="email" maxlength="25" size="45" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" style="margin-left:48px"> <br>
                        <label>Password: </label>
                        <input type="text" name="password" maxlength="20" size="45" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$" style="margin-left:25px"> <br>
                        <div id="loginButtons">
                            <button type="submit" formaction="login.jsp" id="loginButton">Login</button>
                            <button type="submit" formaction="delete.jsp" id="deleteButton">Delete your account</button> 
                            <input type="button" id="signoutButton" value="Signout">
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>

    </body>
</html>