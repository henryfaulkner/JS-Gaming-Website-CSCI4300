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
        <h3 id="screenname"style="text-align: right; margin-bottom:0px; margin-right:10px;"></h3>
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
    <%
    Timer t = new Timer();
      t.schedule(new TimerTask() {
        @Override
        public void run() {
        Cookie [] cookies = request.getCookies();

        if(cookies[3] != null) {
          //first, find user's current score for snake_page
          //then, compare that to just achieved score 
          //if achieved score is > current, delete current and insert achieved
          //else, leave unchanged.
          try {
            String dbURL = "jdbc:mysql://127.0.0.1:3306/jsgamedb";
            Connection connection = DriverManager.getConnection(dbURL, "root", "baseball9");
            String query1 = "SELECT score FROM scores WHERE game='snake' and screenname=?"; 
            PreparedStatement pstmt1 = connection.prepareStatement( query1 );
            pstmt1.setString(1, cookies[0].getValue());
            ResultSet rs = pstmt1.executeQuery();
            rs.first();
            int score = rs.getInt(1); //assumes the user has a score 
            if(Integer.parseInt(cookies[3].getValue()) > score){
              String query2 = "DELETE FROM scores WHERE game='snake' and screenname=?";
              PreparedStatement pstmt2 = connection.prepareStatement( query2 );
              pstmt2.setString(1, cookies[0].getValue());
              pstmt2.executeQuery();
              String query3 = "INSERT into scores() VALUES (?, ?, 'snake');";
              PreparedStatement pstmt3 = connection.prepareStatement( query3 );
              pstmt3.setString(1, cookies[0].getValue());
              pstmt3.setString(2, cookies[3].getValue());
              pstmt3.executeQuery();
            }
            connection.close();
          } catch(SQLException e) {
            out.println("<h2>Something went wrong</h2>");
          }
        }
      }
    }, 0, 5000); //every 5 seconds
    %>
    <% Cookie[] cookies = request.getCookies(); %>
    <script>
        if(document.getElementById("screenname") && "<%=cookies[0].getValue()%>" != "" && "<%=cookies[0].getName()%>" != "JSESSIONID")
            document.getElementById("screenname").textContent = "Welcome, " + "<%=cookies[0].getValue()%>";
    </script>
    <p style="text-align: center; font-size: 30px;"><strong>Use arrow keys to move</strong></p>
  </body>
</html>