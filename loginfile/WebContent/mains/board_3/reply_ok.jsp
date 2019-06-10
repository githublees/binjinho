<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("euc-kr");

String driver = "org.mariadb.jdbc.Driver";
	Class.forName(driver);
String url = "jdbc:mariadb://localhost:7009/stone";
	String uid = "root";
	String pwd = "1001";
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String title = request.getParameter("title");
	String memo = request.getParameter("memo");
	int idx = Integer.parseInt(request.getParameter("idx"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	
	try {
		int ref = 0;
		int indent = 0;
		int step = 0;

		Connection conn = DriverManager.getConnection(url,uid,pwd);
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT REF, INDENT, STEP FROM board_3 WHERE NUM=" + idx;
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()) {
			ref = rs.getInt(1);
			indent = rs.getInt(2);
			step = rs.getInt(3);
		}
		
		sql = "UPDATE board_3 SET STEP=STEP+1 where REF="+ref+" and STEP>" +step;
		stmt.executeUpdate(sql);
		
		sql = "INSERT INTO board_3(USERNAME, PASSWORD, TITLE, MEMO, REF, INDENT, STEP) "+
				"values(?,?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, password);
		pstmt.setString(3, title);
		pstmt.setString(4, memo);
		pstmt.setInt(5, ref);
		pstmt.setInt(6, indent+1);
		pstmt.setInt(7, step+1);
		
		pstmt.execute(); 
		rs.close();
		stmt.close();
		pstmt.close();
		conn.close();
		
	}catch(Exception e) {
		
	}
%>
  <script language=javascript>
   self.window.alert("입력한 글을 저장하였습니다.");
   location.href="list.jsp?pg=<%=pg%>";
  </script>
