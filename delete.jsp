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
        <h1>DELETED</h1>
        <br>
        <%@ page import="java.util.*" %>
        <%@ page import="java.sql.*" %>
        <% String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            String dbURL = "jdbc:mysql://127.0.0.1:3306/jsgamedb";
            Connection connection = DriverManager.getConnection(dbURL, "root", "baseball9");
            //checks for matching email & password pair
            String query1 = "SELECT screenname FROM user WHERE email=? and pass=?;";
            PreparedStatement pstmt1 = connection.prepareStatement( query1 );
            pstmt1.setString(1, email);
            pstmt1.setString(2, password);
            ResultSet rs = pstmt1.executeQuery();
            rs.first();
            String user = rs.getString(1);
            String query2 = "DELETE FROM user WHERE screenname=?"; 
            PreparedStatement pstmt2 = connection.prepareStatement( query2 );
            pstmt2.setString(1, user);
            pstmt2.executeUpdate();
            connection.close();
        } catch(SQLException e) {
            out.println("<h2>Could not connect to Database. :/</h2>");
        }
        %>
        
        <%Cookie [] cookies = request.getCookies();%>
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
    </body>
</html>