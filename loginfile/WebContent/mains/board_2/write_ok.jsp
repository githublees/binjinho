<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>  
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.sql.*,java.text.SimpleDateFormat,java.util.Date"%>
<%
	request.setCharacterEncoding("euc-kr");

String driver = "org.mariadb.jdbc.Driver";
	Class.forName(driver);
String url = "jdbc:mariadb://localhost:7009/stone";
	String uid = "root";
	String pwd = "1001";
	UserDAO user = new UserDAO();
    String userID = null;
    int tag = 0;
 
    if (session.getAttribute("userID") != null){
       userID = (String)session.getAttribute("userID");
       tag = Integer.parseInt(user.getTag(userID));
    }
    System.out.println(userID);
    
	String name = userID;
	String password = request.getParameter("password");
	String title = request.getParameter("title");
	String memo = request.getParameter("memo");
	int max =0;
	try {	
		Connection conn = DriverManager.getConnection(url,uid,pwd);
		Statement stmt = conn.createStatement();
		String sql = "SELECT MAX(NUM) FROM board_2";
		ResultSet rs = stmt.executeQuery(sql);
		if(rs.next()){ 
			max=rs.getInt(1); 
			}
		sql = "INSERT INTO board_2(USERNAME,PASSWORD,TITLE,MEMO,REF) VALUES(?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql); 

		
		
		pstmt.setString(1, name);
		pstmt.setString(2, password);
		pstmt.setString(3, title);
		pstmt.setString(4, memo);
		pstmt.setInt(5, max+1);
		pstmt.execute();
		pstmt.close();
		
		conn.close();
} catch(SQLException e) {
	out.println( e.toString() );
	}
%>
  <script language=javascript>
   self.window.alert("입력한 글을 저장하였습니다.");
   location.href="list.jsp"; 
</script>
