<%@ page import="java.sql.*"%>
<html lang = 'en'>
    <head>
        <title>Snake High Scores</title>
        <link rel="stylesheet" href="stylesheet.css">
        <meta charset="UTF-8">
        <script></script>
    </head>
    <body>
        <script>document.body.style.background = localStorage.bgcolor;</script>
        <div class = "navBar">
            <br>
            <h1>Snake High Scores</h1>
            <br>
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

        <%
        	String dbURL = "jdbc:mysql://localhost/jsgamedb";
        	String query = "SELECT screenname, score FROM scores WHERE game = 'snake' ORDER BY score desc";
        	Connection connection = DriverManager.getConnection(dbURL, "root", "baseball9");
        	PreparedStatement pstmt = connection.prepareStatement( query );
            ResultSet rs = pstmt.executeQuery( );
            out.println("<table border='2'> <th>Rank</th> <th>Player</th> <th>Score</th>");
            int count = 1;
        	while(rs.next())
        	{
                out.println("<tr>");
        		out.println("<td>" + count + "</td><td>" + rs.getString(1) +  "</td><td>" + rs.getString(2)+"</td>");
                out.println("</tr>");
                count++;
          	}
        	connection.close();  
          	out.println("</table>");
        %>
    </body>
</html>