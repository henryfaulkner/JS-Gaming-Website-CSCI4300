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
                    <li class="subnav"><a href="Snake_Game/snake_page.jsp">Snake Game</a></li>
                    <li class="subnav"><a href="Birdy_Flap/birdy_page.jsp">Flappy Bird</a></li>
                    <li class="subnav"><a href="high_scores.jsp">High Scores</a></li>
                    <li class="subnav"><a href="account_page.jsp">Account Info</a></li>
                    <li class="subnav" style="margin-left:1%"><a href="store.jsp">Store</a></li>
                </ul>
            </nav>
        </div>
        
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
            ResultSet rs1 = pstmt1.executeQuery();
            if(rs1.first() == false){  //attempts to move cursor to first & only row 
                out.println("<h2>Either your email or password are incorrect.</h2>");
                connection.close();
            } else {
                String name = rs1.getString(1);
                out.println("<h2>You have been Logged in!!</h2>");
                String query2 = "SELECT tokens FROM user WHERE screenname=?;";
                PreparedStatement pstmt2 = connection.prepareStatement( query2 );
                pstmt2.setString(1, name);
                ResultSet rs2 = pstmt2.executeQuery();
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
            }
        } catch(SQLException e){
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
            console.log(getCookie("Tokens"));
        </script>
    </body>
</html>