<!DOCTYPE html>
<html lang='en'>
    <head>
        <title>Account Page</title>
        <link rel="stylesheet" href="stylesheet.css">
        <meta charset="UTF-8">
    </head>
    <body>
        <%@ page import="java.util.*" %>
        <%@ page import="java.sql.*" %>

        <script>document.body.style.background = localStorage.bgcolor;</script>
        <div class = "navBar">
            <h3 id="screenname" style="text-align: right;"></h3>
            <h1>Sign up for your gaming account now!</h1>
            <h2>Be the highest scorer!!</h2>
            <nav>
                <ul class="mainMenu">
                    <li class="subnav"><a href="index.html">Home Page</a></li>
                    <li class="subnav"><a href="Snake_Game/snake_page.html">Snake Game</a></li>
                    <li class="subnav"><a href="Birdy_Flap/birdy_page.html">Flappy Bird</a></li>
                    <li class="subnav"><a href="high_scores.html">High Scores</a></li>
                    <li class="subnav"><a href="account_page.jsp">Account Info</a></li>
                    <li class="subnav" style="margin-left:1%"><a href="store.html">Store</a></li>
                </ul>
            </nav>
        </div>
        <script>
            if(document.getElementById("screenname") && "<%=cName.getValue()%>" != "")
                document.getElementById("screenname").textContent = "Welcome, " + "<%=cName.getValue()%>";</script>
        <br>
        <p><% 
            Cookie [] cookies = request.getCookies(); 
            for(int i = 0; i < cookies.length; i++ )
                out.print(cookies[i].getName() + ": " + cookies[i].getValue() + " ");%>
        </p>
        <h2>You have been Registered!!</h2>
    </body>
</html>