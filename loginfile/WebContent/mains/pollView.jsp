<%@page import="java.util.Random"%>
<%@page import="ch15.PollListBean"%>
<%@page import="ch15.PollItemBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="mgr" class="ch15.PollMgr"></jsp:useBean>
<%
		request.setCharacterEncoding("UTF-8");
		int num =0;
		if(request.getParameter("num")!=null){
			num= Integer.parseInt(request.getParameter("num"));
			
		}
		int sum = mgr.sumCount(num);
		Vector<PollItemBean> vlist = mgr.getView(num);
		PollListBean plBean = mgr.getList(num);
		String question = plBean.getQuestion();
		
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Poll</title>
<link href = "assets/css/bootstrap.css" rel="stylesheet" type = "text/css">
</head>
<div align ="center"><br> 
<h2>투표프로그램</h2>
<table  border="1" width="400">
	<tr>
	<td colspan="4">
	<b>Q:<%=question %></b>
	</td>
	</tr>
	<tr>
	<td colspan="3">
	<b>총 투표자 : <%=sum %>명</b>
	</td>
	<td width="40">count</td>
	</tr>
	<%
		Random r = new Random();
	    for(int i =0; i<vlist.size();i++){
	    	PollItemBean piBean = vlist.get(i);
	    	String item[]= piBean.getItem();
	    	int rbg = r.nextInt(255*255*255);
	    	String hRGB = "#"+Integer.toHexString(rbg);
	    	int count = piBean.getCount();
	    	int ratio =(new Double(Math.ceil((double)count/sum*100))).intValue();
	 %>
	    	<tr>
	    	<td width="20" align="center"><%=i+1 %></td>
	    	<td width="120"><%=item[0] %></td>
	    	<td>
	    	<table width="<%=ratio%>" height="15">
	    	<tr>
	    	<td bgcolor="<%=hRGB%>"></td>
	    	</tr>
	    	</table>
	    	</td>
	    	<td align="center"><%=count %></td>
	    	</tr>
	    <%}%>
</table></p>
<a href="javascript:window.close()">닫기</a>
</div>


</body>
</html>