<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*"%> 
<script language = "javascript">  // 자바 스크립트 시작
<%
request.setCharacterEncoding("euc-kr");
String driver = "org.mariadb.jdbc.Driver";
Class.forName(driver);
String url = "jdbc:mariadb://localhost:7009/stone";
String uid = "root";
String pwd = "1001";

String name = "";
String password = "";
String title = "";
String memo = "";
int idx = Integer.parseInt(request.getParameter("idx"));
int pg = Integer.parseInt(request.getParameter("pg"));
try {
	
	Connection conn = DriverManager.getConnection(url,uid,pwd);
	Statement stmt = conn.createStatement();
	
	String sql = "SELECT USERNAME, PASSWORD, TITLE, MEMO FROM board_2 WHERE NUM=" + idx;
	ResultSet rs = stmt.executeQuery(sql);

	
	if(rs.next()){
		
		name = rs.getString(1);
		password = rs.getString(2);
		title = rs.getString(3);
		memo = rs.getString(4);
	}
	
	rs.close();
	stmt.close();
	conn.close();
}catch(SQLException e) {
	out.println( e.toString() );
}
 
%>


function modifyCheck()
  {
   var form = document.modifyform;
   
   if( !form.password.value )
   {
    alert( "비밀번호를 적어주세요" );
    form.password.focus();
    return;
   }
   
  if( !form.title.value )
   {
    alert( "제목을 적어주세요" );
    form.title.focus();
    return;
   }
 
  if( !form.memo.value )
   {
    alert( "내용을 적어주세요" );
    form.memo.focus();
    return;
   }  
 		form.submit();
  } 
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>게시판</title>
 </head>
 <body>
<table>
  <tr>
   <td>
   <form name=modifyform method=post action="modify_ok.jsp?idx=<%=idx%>&pg=<%=pg%>">
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('table_mid.gif') repeat-x; text-align:center;">
      <td width="5"><img src="table_left.gif" width="5" height="30" /></td>
      <td>수정</td>
      <td width="5"><img src="table_right.gif" width="5" height="30" /></td>
     </tr>
    </table>
<table>
     <tr>
      <td>&nbsp;</td>
      <td align="center">제목</td>
      <td><input type=text name=title size=50  maxlength=50 value="<%=title%>"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">이름</td>
      <td><%=name%><input type=hidden name=name size=50  maxlength=50 value="<%=name%>"></td>
      <td>&nbsp;</td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">비밀번호</td>
      <td><input type=password name="password" id="pass" size=50  maxlength=50 ></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">내용</td>
      <td><textarea name=memo cols=50 rows=13><%=memo%></textarea></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="black"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2"><input type="button" value="수정" OnClick="javascript:modifyCheck();">
      <input type=button value="취소" OnClick="javascript:history.back(-1)">
      <td>&nbsp;</td>
     </tr> 
    </table>
   </td>
  </tr>
 </table>
</body> 
</html>
