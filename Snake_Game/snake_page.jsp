<!DOCTYPE html>
<html lang='en'>
  <head>
    <title>Snake</title>
    <script src="p5.min.js"></script>
    <script src="p5.dom.min.js"></script>
    <script src="p5.sound.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../stylesheet.css">
    <meta charset="utf-8">
    <script src="Driver.js"></script>
    <script src="Snake.js"></script>
  </head>
  <body>
    <script>document.body.style.background = localStorage.bgcolor;</script>
    <div class = "navBar">
        <h3 id="screenname"style="text-align: right;"></h3>
        <h1>Snake</h1>
        <nav>
          <ul class="mainMenu">
            <li class="subnav"><a href="../index.jsp">Home Page</a></li>
            <li class="subnav"><a href="snake_page.jsp">Snake Game</a></li>
            <li class="subnav"><a href="../Birdy_Flap/birdy_page.jsp">Flappy Bird</a></li>
            <li class="subnav"><a href="../high_scores.jsp">High Scores</a></li>
            <li class="subnav"><a href="../account_page.jsp">Account Info</a></li>
            <li class="subnav" style="margin-left:1%"><a href="../store.jsp">Store</a></li>
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
    <p style="text-align: center; font-size: 30px;"><strong>Use arrow keys to move</strong></p>
  </body>
</html>