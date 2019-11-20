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
            <h3 id="screenname"style="text-align: right;"></h3>
            <h1>JavaScript Gaming Library</h1>
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
            if(document.getElementById("screenname") && "<%=cookies[0].getValue()%>" != "")
                document.getElementById("screenname").textContent = "Welcome, " + "<%=cookies[0].getValue()%>";
        </script>

        <div class = "mainPage">
            <div id = "cell1">
                <p class = "subheading"> Play Games </p>
                <img src = "snakeScreenshot.PNG" alt="Snake" class = "menuImage">
                <p> Play timeless classics like Snake and Flappy Bird for free!</p>
            </div>
            <div id = "cell2">
                <p class = "subheading"> Save Your Scores </p>
                <img src = "highScoreScreenshot.PNG" alt="High Score" class = "menuImage">
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