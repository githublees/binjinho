<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.bbsDAO" %>
<%@ page import="bbs.bbs" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Login</title>
</head>
<body>
	<%
		UserDAO user = new UserDAO();
		String userID = null;
		int tag = 0;
		if (session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
			tag = Integer.parseInt(user.getTag(userID));
		}
		
		if (userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		int bbsID = 0;
		if (request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
		}
		bbs bbs = new bbsDAO().getBbs(bbsID);
		if (!userID.equals(bbs.getUserID()) && tag != 1 ){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
		}else {
			bbsDAO bbsDAO = new bbsDAO();
			int result = bbsDAO.delete(bbsID);
			if (result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("글 삭제에 실패했습니다.'");
				script.println("</script>");
			}
			else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'index.jsp#index'");
				script.println("</script>");
			}
		}
	%>
</body>
</html> 