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
            <h1>High Scores</h1>
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
            if(document.getElementById("screenname") && "<%=cookies[0].getValue()%>" != "" && "<%=cookies[0].getName()%>" != "JSESSIONID")
                document.getElementById("screenname").textContent = "Welcome, " + "<%=cookies[0].getValue()%>";
        </script>
        <div class = "tableButtons">
                <a href = "snake_table.jsp" id = "snakeButton"> Snake High Scores </a>
                <a href = "flappy_bird_table.jsp" id = "flappyBirdButton"> Flappy Bird High Scores </a>
            <br>
            <br>
        </div>
    </body>
</html>