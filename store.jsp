<!DOCTYPE html>
<html lang='en'>
    <head>
        <title>Store</title>
        <link rel="stylesheet" href="stylesheet.css">
        <script src="store_scipts.js"></script>
        <meta charset="UTF-8">
    </head>
    <body>
        <div class = "navBar">
            <h3 id="screenname" style="text-align: right; margin-bottom:0px; margin-right:10px;"></h3>
            <h1>Store</h1>
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
        <%@ page import="java.util.*" %>
        <%@ page import="java.sql.*" %>
        <%Cookie [] cookies = request.getCookies();%>
        <script>
            if(document.getElementById("screenname") && "<%=cookies[0].getValue()%>" != "" && "<%=cookies[0].getName()%>" != "JSESSIONID")
                document.getElementById("screenname").textContent = "Welcome, " + "<%=cookies[0].getValue()%>";
        </script>
        <div class="storeItems">
            <div id="storeItem1">
                <br>
                <img src="Store_Pictures/forestgreen.png" alt="Forest Green" style="width:150px; height:150px;"><br>
                <h3>Forest Green Web Background<br>Cost: 5 tokens</h3>
            </div>
            <div id="storeItem2">
                    <br>
                    <img src="Store_Pictures/lightskyblue.png" alt="Sky Blue" style="width:150px; height:150px;"><br>
                    <h3>Sky Blue Web Background<br>Cost: 10 tokens</h3>
            </div>
            <div id="storeItem3">
                    <br>
                    <img src="Store_Pictures/khaki.png" alt="Khaki" style="width:150px; height:150px;"><br>
                    <h3>Khaki Web Background<br>Cost: 0 tokens</h3>
            </div>
        </div>  
        
    </body>
</html>