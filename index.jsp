<!DOCTYPE html>
<html lang='en'>
    <head>
        <title>Home Page</title>
        <link rel="stylesheet" href="stylesheet.css">
        <script src ="index_scripts.js"></script>
        <meta charset="UTF-8">
    </head>
    <body>
        <div class = "navBar">
            <h3 id="screenname"style="text-align: right; margin-bottom:0px; margin-right:10px;"></h3>
            <h3 id="tokens" style="text-align: right; margin-bottom:0px; margin-right:10px; margin-top:0px;"></h3>
            <h1>JavaScript Gaming Library</h1>
            <nav>
                <ul class="mainMenu">
                    <li class="subnav"><a href="index.jsp">Home Page</a></li>
                    <li class="subnav"><a href="snake_page.jsp">Snake Game</a></li>
                    <li class="subnav"><a href="birdy_page.jsp">Flappy Bird</a></li>
                    <li class="subnav"><a href="high_scores.jsp">High Scores</a></li>
                    <li class="subnav"><a href="account_page.jsp">Account Info</a></li>
                    <li class="subnav" style="margin-left:1%"><a href="store.jsp">Store</a></li>
                </ul>
            </nav>
        </div>
        <%@ page import="java.util.*" %>
        <%@ page import="java.sql.*" %>
        <%Cookie [] cookies = request.getCookies();%>
        <%
        Cookie cSScore = new Cookie("snakeScore", "0");
        //cSScore.setPath("/WebDev_Final_TomCat/Snake_Game");
        Cookie cBScore = new Cookie("birdScore", "0");
        //cBScore.setPath("/WebDev_Final_TomCat/Birdy_Flap");
        cSScore.setMaxAge(60*60);
        cBScore.setMaxAge(60*60);
        response.addCookie(cBScore);
        response.addCookie(cSScore);

        %>
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
            console.log(getCookie("Name"));
            if(document.getElementById("screenname") && getCookie("Name") != null && getCookie("Tokens") != null){
                document.getElementById("screenname").textContent = "Welcome, " + getCookie("Name");
                document.getElementById("tokens").textContent = "Tokens: " + getCookie("Tokens");
            }
        </script>

        <div class = "mainPage">
            <div id = "cell1">
                <p class = "subheading"> Play Games </p>
                <img src = "snakeScreenshot.PNG" alt="Snake" class = "menuImage">
                <p> Play timeless classics like Snake and Flappy Bird for free!</p>
            </div>
            <div id = "cell2">
                <p class = "subheading"> Save Your Scores </p>
                <img src = "highScoreScreenshot.png" alt="High Score" class = "menuImage">
                <p> Make an account to save your high scores and view them whenever you want! </p>
            </div>
            <div id = "cell3">
                <p class = "subheading"> Win Prizes </p>
                <img src = "prizesScreenshot.PNG" alt="Prizes" class = "menuImage">
                <p> Get points for scoring well on games and spend them in our store!</p>
            </div>
        </div>
    </body>
</html>