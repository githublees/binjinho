<%@page import="ch15.PollListBean"%>
<%@page import="java.util.Vector"%>
<%@page import="user.User"%>
<%@page import="user.UserDAO"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="mgr" class="ch15.PollMgr"/>
<%request.setCharacterEncoding("UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Poll</title>
<link href="assets/css/bootstrap.css" rel="stylesheet">
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
		else{
			userID = null;
		}
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		

	%>
<div align="center"><br/>
<h2>투표</h2>
<hr width="60%">
<b>Poll Form</b>
<jsp:include page="pollForm.jsp"/>
<hr width="60%">
<b>Poll List</b>
<table class="table">
	<tr>
		<td>
			<table class="table" border="0">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>시작일~종료일</th>
				</tr>
				<%
					Vector<PollListBean> vlist = mgr.getAllList();
					int cnt = vlist.size();
					for(int i=0;i<vlist.size();i++){
						PollListBean plBean = vlist.get(i);
						int num = plBean.getNum();
						String question = plBean.getQuestion();
						String sdate = plBean.getSdate();
						String edate = plBean.getEdate();
				%>
				<tr>
					<td align="center"><%=cnt %></td>
					<td>
					<a href="pollList.jsp?num=<%=num%>"><%=question %></a>
					</td>
					<td align="center"><%=sdate+"~"+edate %></td>
				</tr>
				<%
						cnt--;
					}
				%>
			</table>
		</td>
	</tr>
	<tr>
	<%
		if(tag == 1){
	%>
		<td align="right">
			<a href="pollInsert.jsp">Poll Post</a>
		</td>
	<%
		}
	%>
	
	</tr>
</table>
</div>
</body>
</html>