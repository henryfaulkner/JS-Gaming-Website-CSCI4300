<!DOCTYPE html>
<html lang='en'>
  <head>
    <title>Snake</title>
    <script src="Snake_Game/p5.min.js"></script>
    <script src="Snake_Game/p5.dom.min.js"></script>
    <script src="Snake_Game/p5.sound.min.js"></script>
    <link rel="stylesheet" type="text/css" href="stylesheet.css">
    <meta charset="utf-8">
    <script src="Driver.js"></script>
    <script src="Snake_Game/Snake.js"></script>
  </head>
  <body>
    <script>document.body.style.background = localStorage.bgcolor;</script>
    <div class = "navBar">
        <h3 id="screenname"style="text-align: right; margin-bottom:0px; margin-right:10px;"></h3>
        <h3 id="tokens" style="text-align: right; margin-bottom:0px; margin-right:10px; margin-top:0px;"></h3>
        <h1>Snake</h1>
        <nav>
          <ul class="mainMenu" style="margin-bottom: 5px;">
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
    //first, find user's current score for snake_page
    //then, compare that to just achieved score 
    //if achieved score is > current, delete current and insert achieved
    //else, leave unchanged.

    //"JSESSIONID" doesn't != works sometimes when not logged in; 
    //"JSESSIONID" == works whenever but does log highscores for users
    Cookie user = cookies[0];
    Cookie score = cookies[0];
    Cookie tokens = cookies[0];
    for(int i = 0; i < cookies.length; i++){
      if(cookies[i].getName().equals("Name")){
        user = cookies[i];
      } else if(cookies[i].getName().equals("snakeScore")){
        score = cookies[i];
      } else if(cookies[i].getName().equals("Tokens")){
        tokens = cookies[i];
      }
    }
      
    try {
      String dbURL = "jdbc:mysql://127.0.0.1:3306/jsgamedb";
      Connection connection = DriverManager.getConnection(dbURL, "root", "baseball9");
      String query1 = "SELECT score FROM scores WHERE game='snake' and screenname=?"; 
      PreparedStatement pstmt1 = connection.prepareStatement( query1 );
      pstmt1.setString(1, user.getValue());
      ResultSet rs = pstmt1.executeQuery();
      rs.first();
      int oldScore = rs.getInt(1); //assumes the user has a score 
      
      if(Integer.parseInt(score.getValue()) > oldScore){
        String query2 = "DELETE FROM scores WHERE game='snake' and screenname=?";
        PreparedStatement pstmt2 = connection.prepareStatement( query2 );
        pstmt2.setString(1, user.getValue());
        pstmt2.executeUpdate();
        String query3 = "INSERT into scores() VALUES (?, ?, 'snake');";
        PreparedStatement pstmt3 = connection.prepareStatement( query3 );
        pstmt3.setString(1, user.getValue());
        pstmt3.setString(2, score.getValue());
        pstmt3.executeUpdate();
      }      
      
      connection.close();
    } catch(SQLException e) {
  
    }
    
    try {
      String dbURL = "jdbc:mysql://127.0.0.1:3306/jsgamedb";
      Connection connection = DriverManager.getConnection(dbURL, "root", "baseball9");

      //INCREMENTS TOKENS ON EACH LOAD (ESENTIALLY, EACH GAME); 
      //HAVE TO BE SIGNED IN BUT WHO CARES ANYMORE lol
      String query4 = "SELECT tokens FROM user WHERE screenname=?"; 
      PreparedStatement pstmt4 = connection.prepareStatement( query4 );
      pstmt4.setString(1, user.getValue());
      ResultSet rs2 = pstmt4.executeQuery();
      rs2.first();
      int locTokens = rs2.getInt(1) + 1;
      String query5 = "UPDATE user SET tokens=? WHERE screenname=?"; 
      PreparedStatement pstmt5 = connection.prepareStatement( query5 );
      pstmt5.setString(1, locTokens+"");
      pstmt5.setString(2, user.getValue());
      tokens.setMaxAge(0);  
      response.addCookie(tokens);
      Cookie newCookie = new Cookie("Tokens", locTokens+"");
      newCookie.setMaxAge(24*60*60);
      response.addCookie(newCookie);
      pstmt5.executeUpdate();
      connection.close();
    } catch (SQLException e){
      
    }
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
    <p style="text-align: center; font-size: 30px;"><strong>Use arrow keys to move</strong></p>
    <p id="score" style="text-align: right; font-size:40px;padding-right:250px;"><strong>Score: </strong></p>
    <script>document.getElementById("score").textContent += getCookie("snakeScore");</script>
  </body>
</html>