<!DOCTYPE html>
<html lang='en'>
    <head>
        <title>Account Page</title>
        <link rel="stylesheet" href="stylesheet.css">
        <meta charset="UTF-8">
    </head>
    <body>
        
        
        <script>document.body.style.background = localStorage.bgcolor;</script>
        <div class = "navBar">
            <h3 id="screenname" style="text-align: right; margin-bottom:0px; margin-right:10px;"></h3>
            <h3 id="tokens" style="text-align: right; margin-bottom:0px; margin-right:10px; margin-top:0px;"></h3>
            <h1>Sign up for your gaming account now!</h1>
            <h2>Be the highest scorer!!</h2>
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

        <% String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            String dbURL = "jdbc:mysql://127.0.0.1:3306/jsgamedb";
            Connection connection = DriverManager.getConnection(dbURL, "root", "baseball9");
            String query = "SELECT email FROM user WHERE email=?";
            PreparedStatement pstmt1 = connection.prepareStatement( query );
            pstmt1.setString(1, email);
            ResultSet rs = pstmt1.executeQuery( );
            if(rs.first() == false){
                String insert = "INSERT into user () VALUES (?, ?, ?, 0);";
                PreparedStatement pstmt2 = connection.prepareStatement( insert );
                pstmt2.setString(1, name);
                pstmt2.setString(2, email);
                pstmt2.setString(3, password);
                pstmt2.executeUpdate(); 
                String snakeScore = "INSERT into scores () VALUES (?, 0, 'snake');";
                PreparedStatement pstmt3 = connection.prepareStatement( snakeScore );
                pstmt3.setString(1, name);
                pstmt3.executeUpdate();
                String birdScore = "INSERT into scores () VALUES (?, 0, 'bird');";
                PreparedStatement pstmt4 = connection.prepareStatement( birdScore );
                pstmt4.setString(1, name);
                pstmt4.executeUpdate();
                String query2 = "SELECT tokens FROM user WHERE screenname=?;";
                PreparedStatement pstmt5 = connection.prepareStatement( query2 );
                pstmt5.setString(1, name);
                ResultSet rs2 = pstmt5.executeQuery();
                rs2.first();
                int tokens = rs2.getInt(1);
                connection.close();

                Cookie cName = new Cookie("Name", name);
                Cookie cEmail = new Cookie("Email", email);
                Cookie cPass = new Cookie("Password", password);
                Cookie cTokens = new Cookie("Tokens", tokens+"");
                cName.setMaxAge(60*60);
                cEmail.setMaxAge(60*60);
                cPass.setMaxAge(60*60);
                cTokens.setMaxAge(60*60);
                response.addCookie(cName);
                response.addCookie(cEmail);
                response.addCookie(cPass);
                response.addCookie(cTokens);

                out.println("<h1>You have been Registered!!</h1>");
            } else {
                out.println("<h2>Email is already in use. Please enter a different email.</h2>");
            }
            connection.close();
          }
          catch(SQLException e) {
              out.println("<p>");
              e.printStackTrace();
              out.println("</p>");
              out.println("<h2>Screen name already taken. Please enter different screen name.</h2>");
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
        <br>
        
    </body>
</html>