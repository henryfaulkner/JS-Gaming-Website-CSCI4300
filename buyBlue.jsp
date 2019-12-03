<!DOCTYPE html>
<html lang = 'en'>
    <head>
        <title>Sky Blue Background</title>
        <link rel="stylesheet" href="stylesheet.css">
        <meta charset="UTF-8">
        <script></script>
    </head>
    <body>
        <script>document.body.style.background = localStorage.bgcolor;</script>
        <div class = "navBar">
            <h3 id="screenname" style="text-align: right; margin-bottom:0px; margin-right:10px;"></h3>
            <h3 id="tokens" style="text-align: right; margin-bottom:0px; margin-right:10px; margin-top:0px;"></h3>
            <h1>Sky Blue Background</h1> <br>	
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
        
        
		<br><br>
		<%
			String tokens = null;
			String screenname = null;
			Cookie ogTokens = cookies[0];
			for(Cookie c:cookies)  
			{
				if(c.getName().equals("Tokens"))
				{
				tokens = c.getValue();
				ogTokens = c;
				}
				else if(c.getName().equals("Name"))
				{
					screenname = c.getValue(); 	
				}
			}
       		
       		if(tokens == null)
       		{
       			out.println("<h1> Please create an account or login to buy an item. </h1>");
       		}
       		else
       		{
       			//get price from database
	       		String dbURL = "jdbc:mysql://localhost/jsgamedb";
	        	String query = "SELECT price FROM product WHERE name = 'Sky Blue Web Background'";
	        	Connection connection = DriverManager.getConnection(dbURL, "root", "baseball9");
	        	PreparedStatement pstmt = connection.prepareStatement( query );
	            ResultSet rs = pstmt.executeQuery( );
	            rs.first();
				int price = rs.getInt(1);
				String query3 = "SELECT screenname FROM ownsproduct WHERE screenname=? and id=2";
				pstmt5.setString(1, screenname);
				PreparedStatement pstmt5 = connection.prepareStatement(query3);
				ResultSet rs3 = pstmt5.executeQuery();
	            
	            if(rs3.first()){
					out.println("<h1> You already own this item. </h1>");
					%>
		            <script>document.body.style.background = 'skyblue';
		            localStorage.bgcolor = 'skyblue';</script>
					<%
				} 
				else if(price > Integer.parseInt(tokens)) //item too expensive
	            {
	       			out.println("<h1> Not enough tokens to purchase this item. </h1>");
				} 
	            else
	            {
	            	//getting the user's current tokens
	            	String query2 = "SELECT tokens FROM user WHERE screenname = ?";
					PreparedStatement pstmt2 = connection.prepareStatement( query2 );
					pstmt2.setString(1, screenname);
					ResultSet rs2 = pstmt2.executeQuery();
					rs2.first();
		            int currentTokens = rs2.getInt(1);
					
					//subtracting the price of the background
		            currentTokens -= price;
		            
		            //updating the user's current tokens
		            String updateQuery = "UPDATE user SET tokens = ? WHERE screenname = ?";
					PreparedStatement pstmt3 = connection.prepareStatement(updateQuery);
					pstmt3.setString(1, currentTokens+"");
					pstmt3.setString(2, screenname);
					pstmt3.executeUpdate();
					
					//updates ownProduct table 
					String addProduct = "INSERT into ownsproduct () VALUES (?, 2)";
					PreparedStatement pstmt4 = connection.prepareStatement(addProduct);
					pstmt4.setString(1, screenname);
					pstmt4.executeUpdate();
		            %>
		            <script>document.body.style.background = 'skyblue';
		            localStorage.bgcolor = 'skyblue';</script>
					<% 
					ogTokens.setMaxAge(0);
					response.addCookie(ogTokens);
					Cookie cTokens = new Cookie("Tokens", currentTokens+"");
					cTokens.setMaxAge(24*60*60);
	                response.addCookie(cTokens);
		            
		            //confirmation message
		            out.println("<h1> Sky Blue Web Background purchased </h1>");
	            }
       		}
        %>
    </body>
</html>