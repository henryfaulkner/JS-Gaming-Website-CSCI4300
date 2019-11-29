<!DOCTYPE html>
<html lang='en'>
  <head>
    <title>Birdy Flap</title>
    <script src="p5.js"></script>
    <script src="p5.dom.min.js"></script>
    <script src="p5.sound.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../stylesheet.css">
    <meta charset="utf-8">
    <script src="sketch.js"></script>
    <script src="Bird.js"></script>
    <script src="Pipe.js"></script>
  </head>
  <body>
    <script>document.body.style.background = localStorage.bgcolor;</script>
    <div class = "navBar">
      <h3 id="screenname" style="text-align: right; margin-bottom:0px; margin-right:10px;"></h3>
      <h1>Flappy Bird</h1>
      <nav>
        <ul class="mainMenu">
          <li class="subnav"><a href="../index.jsp">Home Page</a></li>
          <li class="subnav"><a href="../Snake_Game/snake_page.jsp">Snake Game</a></li>
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
        if(document.getElementById("screenname") && "<%=cookies[0].getValue()%>" != "" && "<%=cookies[0].getName()%>" != "JSESSIONID")
            document.getElementById("screenname").textContent = "Welcome, " + "<%=cookies[0].getValue()%>";
    </script>
    <%//Takes score after each death
    //pulls highscore from database tied to logged-in screenname
    //compares recent score to highscore 
    //if recent score is greater than highscore, 
    //delete highscore & insert new row contain recent highscore
    try {
      String dbURL = "jdbc:mysql://127.0.0.1:3306/jsgamedb";
      Connection connection = DriverManager.getConnection(dbURL, "root", "baseball9");
        
      connection.close();
    } catch(SQLException e) {
      out.println("<h2>Something went wrong :*(</h2>");
    }
    %>

    <p style="text-align: center; font-size: 30px;"><strong>Press spacebar to flap</strong></p>

</body></html>