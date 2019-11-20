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

        <% String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Cookie cName = new Cookie("Name", name);
        Cookie cEmail = new Cookie("Email", email);
        Cookie cPass = new Cookie("Password", password);
        cName.setMaxAge(60*60);
        cEmail.setMaxAge(60*60);
        cPass.setMaxAge(60*60);
        response.addCookie(cName);
        response.addCookie(cEmail);
        response.addCookie(cPass);

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
                out.println(pstmt2);
                pstmt2.executeUpdate();                
                out.println("<h2>You have been Registered!!</h2>");
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
        
        <script>document.body.style.background = localStorage.bgcolor;</script>
        <div class = "navBar">
            <h3 id="screenname" style="text-align: right;"></h3>
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
        <script>
            if(document.getElementById("screenname") && "<%=cName.getValue()%>" != "")
                document.getElementById("screenname").textContent = "Welcome, " + "<%=cName.getValue()%>";</script>
        <br>
        <p><% 
            Cookie [] cookies = request.getCookies(); 
            for(int i = 0; i < cookies.length; i++ )
                out.print(cookies[i].getName() + ": " + cookies[i].getValue() + " ");%>
        </p>
        
    </body>
</html>