<!DOCTYPE html>
<html lang = 'en'>
    <head>
        <title>High Scores</title>
        <link rel="stylesheet" href="stylesheet.css">
        <script src ="high_score_scripts.js"></script>
        <meta charset="UTF-8">
    </head>
    <body>
        <script>document.body.style.background = localStorage.bgcolor;</script>
        <div class = "navBar">
            <h3 id="screenname"style="text-align: right; margin-bottom:0px; margin-right:10px;"></h3>
            <h3 id="tokens" style="text-align: right; margin-bottom:0px; margin-right:10px; margin-top:0px;"></h3>
            <h1>High Scores</h1>
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
        <%Cookie [] cookies = request.getCookies();
        //GETS RID OF LINGERING SCORES
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
            if(document.getElementById("screenname") && getCookie("Name") != null && getCookie("Tokens") != null){
                document.getElementById("screenname").textContent = "Welcome, " + getCookie("Name");
                document.getElementById("tokens").textContent = "Tokens: " + getCookie("Tokens");
            }
        </script>
        <div class = "tableButtons">
                <a href = "snake_table.jsp" id = "snakeButton"> Snake High Scores </a>
                <a href = "flappy_bird_table.jsp" id = "flappyBirdButton"> Flappy Bird High Scores </a>
            <br>
            <br>
        </div>
    </body>
</html>