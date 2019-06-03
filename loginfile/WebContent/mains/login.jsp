<%@page import="java.util.*, java.io.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Login</title>
	
</head>
<body>
	
	<%
			String userNameOrEmail = request.getParameter("userNameOrEmail");
			String password = request.getParameter("password");
				
			Connection connect = null;
			
            String driver = "org.mariadb.jdbc.Driver";	
			String url = "jdbc:mariadb://localhost:3305/registerdb";
			String uid = "root";
			String pwd = "wkzm1478";

			try{
			
				Class.forName(driver);
				
				connect = DriverManager.getConnection(url, uid, pwd);

				if(connect != null){
					String query = "SELECT count(1) num FROM users WHERE (username = ? OR email = ?) AND pwd = ?;";

					PreparedStatement ps = connect.prepareStatement(query);
					ps.setString(1, userNameOrEmail);
					ps.setString(2, userNameOrEmail);
					ps.setString(3, password);


					ResultSet rs = ps.executeQuery();
					boolean foundUser = false;

					if( rs.next() ){
						
						if(rs.getInt(1) > 0)
							foundUser = true;
					}


					if(foundUser){
					%>
						<script>window.location='.index.html'</script>	
					<%
					}else{
						out.println("<script>alert('Login fail! Please check your information again!')</script>");
						out.println("<script>window.location.href='./index.html'</script>");

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