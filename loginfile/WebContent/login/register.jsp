<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>Register</title>
	
</head>
<body>

	<%
			// Get parameter value from HTML
			String userName = request.getParameter("userName");
			String email = request.getParameter("email");
			String password = request.getParameter("password");

			

			String driver = "org.mariadb.jdbc.Driver";		
			Connection connect = null;			
			String url = "jdbc:mariadb://localhost:3305/registerdb";
			String uid = "root";
			String pwd = "wkzm1478";

			try{
			
				Class.forName(driver);
				
				connect = DriverManager.getConnection(url, uid, pwd);

				if(connect != null){


					// Check duplicated user
					String query = "SELECT count(1) num FROM users WHERE username = ? OR email = ? ;";

					PreparedStatement ps = connect.prepareStatement(query);
					ps.setString(1, userName);
					ps.setString(2, email);			


					ResultSet rs = ps.executeQuery();
					boolean foundUser = false;

					if( rs.next() ){
						
						if(rs.getInt(1) > 0)
							foundUser = true;
					}


					if(foundUser){
						out.println("<script>alert('Register fail! User is duplicated!')</script>");
						out.println("<script>window.location='./register.html'</script>");
					}else {

						query = "INSERT INTO users(username, email, pwd) VALUES(?,?,?);";

						ps = connect.prepareStatement(query);
						ps.setString(1, userName);
						ps.setString(2, email);
						ps.setString(3, password);
						ps.executeQuery();
					%>	
						<script>window.location.href='./login.html'</script>

					<%
					}

					ps.close();
					connect.close();
					
				}else{
					out.println("Database cannot be connected!");
				}
			}catch(Exception e){
				out.println(e.getMessage()); 
				e.printStackTrace();
			}	

			
		
	%>

	
</body>
</html>