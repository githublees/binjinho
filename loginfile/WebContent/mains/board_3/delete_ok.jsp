<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>  
			
<%
String driver = "org.mariadb.jdbc.Driver";
	Class.forName(driver);
String url = "jdbc:mariadb://localhost:7009/stone";
	String uid = "root";
	String pwd = "1001";
	String password = null;
	int idx = Integer.parseInt(request.getParameter("idx"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	String passw = request.getParameter("password");
	
	try{
				
		Connection conn = DriverManager.getConnection(url,uid,pwd);
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT PASSWORD FROM board_3 WHERE NUM=" + idx;
		ResultSet rs = stmt.executeQuery(sql);
		
		 if(rs.next()){
				password = rs.getString(1);
		 }
		 
		 if(password.equals(passw)) {
			   			
			sql = "DELETE FROM board_3 WHERE NUM=" + idx;	
			stmt.executeUpdate(sql);	 
%>
  			<script language=javascript>
   				self.window.alert("해당 글을 삭제하였습니다.");
   				location.href="list.jsp?pg=<%=pg%>";
  			</script>

<%
		rs.close();
		stmt.close();
		conn.close();
		
		 } else { 
%>
			<script language=javascript>
			 self.window.alert("비밀번호를 틀렸습니다.");
				location.href="javascript:history.back()";
			</script>
<%		
		 }
 	} catch(SQLException e) {
		out.println( e.toString() );
	} 
%>

