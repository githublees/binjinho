<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.bbsDAO" %>
<%@ page import="bbs.bbs" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*"%>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO" %>


<html>
<head>
	<head>
		<title>Prologue by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link href="assets/css/bootstrap.css" rel="stylesheet">
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets/css/mainG.css" />
		<link rel="stylesheet" href="assets/css/slider.css" />
		<link rel="stylesheet" href="assets/css/video.css" />
		<link rel="stylesheet" href="assets/css/board.css" />
		<link rel="stylesheet" id="woocommerce-currency-switcher-css" href="https://mdbootstrap.com/wp-content/plugins/woocommerce-currency-switcher/css/front.css?ver=5.2.1" type="text/css" media="all"/>
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<style type="text/css">
			a,a:hover {
				color: #000000;
				text-decoration: none;
			}
		</style>
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
		<div class="video-popup">
  			<div class="video-popup-closer"></div>
		</div>

		<!-- Header -->
			<div id="header">

				<div class="top">

					<!-- Logo -->
						<div id="logo">
							<span class="image avatar48"><img src="images/avatar.jpg" alt="" /></span>
							<%
								if(userID != null){
							%>
							<a href ="logout.jsp"><button type="button" class="btn btn-black">Logout</button></a>
							<p>
							<%
								out.println(session.getAttribute("userID"));
							%> 님
							</p>
							<%
								} else if(userID == null){
							%>
								<a href ="login.html"><button type="button" class="btn btn-black">Login</button></a>	
								<p>비회원</p>
							<%
								}
							%>
						</div>

					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li><a href="index.jsp#top" id="top-link" class="skel-layers-ignoreHref"><span class="icon fa-home">Community</span></a></li>
								<li><a href="index.jsp#portfolio" id="portfolio-link" class="skel-layers-ignoreHref"><span class="icon fa-th">Hot</span></a></li>
								<li><a href="index.jsp#about" id="about-link" class="skel-layers-ignoreHref"><span class="icon fa-user">Notice</span></a></li>
								<li><a href="index.jsp#contact" id="contact-link" class="skel-layers-ignoreHref"><span class="icon fa-envelope">SiteMap</span></a></li>
							</ul>
						</nav>

				</div>

				<div class="bottom">

					<!-- Social Icons -->
						<ul class="icons">
							<li><a href="https://twitter.com/?lang=ko" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="https://www.facebook.com/" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
							<li><a href="https://github.com/" class="icon fa-github"><span class="label">Github</span></a></li>
							<li><a href="https://support.discordapp.com/hc/ko" class="icon fa-dribbble"><span class="label">Discord</span></a></li>
							<li><a href='javascript:void(0);' class="icon fa-envelope" onclick="chat();"><span class="chat">Email</span></a></li>
						</ul>

				</div>
			</div>

		<!-- Main -->
			<div id="main">

  <iframe  src="battle_board_1.html"  scrolling='auto' border='no' maginwidth='0' frameborder='0' style="height:120%; width: 101%">
           </iframe>
							<div id="footer1">
									<div class="slider close">
										<button class="closer" onclick="chat();" style="float:right;" value="닫기"></button>
										<iframe src="http://uchat.ch/jinho_bat" height="450" width="700" style="margin: 20 10 20 300;"></iframe>  
									<iframe src="pollList.jsp" height="450" width="700" style="margin: auto 20 20 20;"></iframe> 
									</div>
							</div>
		<!-- Footer -->
			<div id="footer" style="margin-left: 0px;">

				<!-- Copyright -->
					<ul class="copyright">
						<li>&copy; Untitled. All rights reserved.</li><li> 이호성   전진호   이상빈  <a href="http://html5up.net">HTML5 UP</a></li>
					</ul>
			</div>
</div>
		<!-- Scripts -->
			<script src="http://code.jquery.com/jquery-latest.js"></script>
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.scrollzer.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>
			<script src="assets/js/slider.js"></script>
			<script src="assets/js/video.js"></script>
	</body>
</html>