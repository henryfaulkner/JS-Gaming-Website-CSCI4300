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
        %>
        
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
    </body>
</html>