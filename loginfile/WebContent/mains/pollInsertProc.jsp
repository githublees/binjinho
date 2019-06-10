<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="mgr" class="ch15.PollMgr"/>
<jsp:useBean id="plBean" class="ch15.PollListBean"/>
<jsp:setProperty property="*" name="plBean"/>
<jsp:useBean id="piBean" class="ch15.PollItemBean"/>
<jsp:setProperty property="*" name="piBean"/>
<%
		String sdate = request.getParameter("sdateY")+"-"+
							   request.getParameter("sdateM")+"-"+	
							   request.getParameter("sdateD");
		String edate = request.getParameter("edateY")+"-"+
							   request.getParameter("edateM")+"-"+	
							   request.getParameter("edateD");
		plBean.setSdate(sdate);
		plBean.setEdate(edate);
		boolean flag = mgr.insertPoll(plBean, piBean);
		String msg = "설문 추가에 실패 하였습니다.";
		String url = "pollInsert.jsp";
		if(flag){
			msg = "설문 추가에 성공 하였습니다.";
			url = "pollInsert.jsp";
		}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>