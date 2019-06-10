<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.bbs" %>
<%@ page import="bbs.bbsDAO" %>
<%@ page import="java.sql.*"%>
<%@ page import="user.User" %>
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
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->

	</head>
	<body>
	<% 
		UserDAO user = new UserDAO();
		String userID = null;
		int tag = 0;
	
		if (session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
			tag = Integer.parseInt(user.getTag(userID));
			System.out.println(tag);
		}
		if(userID == null){
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
		if (!userID.equals(bbs.getUserID()) && tag != 1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
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
								}
							%>

						</div>

					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li><a href="#top" id="top-link" class="skel-layers-ignoreHref"><span class="icon fa-home">Community</span></a></li>
								<li><a href="#portfolio" id="portfolio-link" class="skel-layers-ignoreHref"><span class="icon fa-th">Hot</span></a></li>
								<li><a href="#about" id="about-link" class="skel-layers-ignoreHref"><span class="icon fa-user">Notice</span></a></li>
								<li><a href="#contact" id="contact-link" class="skel-layers-ignoreHref"><span class="icon fa-envelope">SiteMap</span></a></li>
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
				<!-- Intro -->
					<section id="top" class="one dark cover">
						<div class="container">

							<div class="home-game-list">
                <ol>
                                            <li class="home-game-list__item home-game-list__item--lol">
                            <a href="index_lol.jsp">
                                <div class="home-game__background" style="background-image: url('assets/css/images/LOL.JPG');"></div>
                               <h2 class="home-game__title" style="color:white";>리그오브레전드</h2>
                                
                            </a>
                        </li>
                                            <li class="home-game-list__item home-game-list__item--pubg">
                            <a href="index_bat.jsp">
                                <div class="home-game__background" style="background-image: url('assets/css/images/BATTLE.JPG');"></div>
                                <h2 class="home-game__title" style="color:white">배틀그라운드</h2>
                                
                            </a>
                        </li>
                                            <li class="home-game-list__item home-game-list__item--autochess">
                            <a href="#">
                                <div class="home-game__background" style="background-image: url('assets/css/images/AUTO.JPG');"></div>
                                <h2 class="home-game__title" style="color:white">오토체스</h2>
                                
                            </a>
                        </li>
                                            <li class="home-game-list__item home-game-list__item--ow">
                            <a href="#">
                                <div class="home-game__background" style="background-image: url('assets/css/images/OVER.JPG');"></div>
                                <h2 class="home-game__title" style="color:white">오버워치</h2>
                                
                            </a>
                        </li>
                                    </ol>
            </div>

							<footer>
								<a href="#portfolio" class="button scrolly">More Game</a>
							</footer>

						</div>
					</section>

				<!-- Portfolio -->
					<section id="portfolio" class="two">
						<div class="container">

							<header>
								<h2>Highlight</h2>
							</header>
							
							<div class="row">
								<div class="4u 12u$(mobile)">
									<article class="item">
										<a href='javascript:void(0);' class="image fit" data-video="weNimO1EGDs"><img src="http://img.youtube.com/vi/weNimO1EGDs/1.jpg"/></a>
										<header>
											<h3>SKT vs JAG 3경기</h3>
										</header>
									</article>
									<article class="item">
										<a href='javascript:void(0);' class="image fit" data-video="6svICz6N4B4"><img src="http://img.youtube.com/vi/6svICz6N4B4/1.jpg"/></a>
										<header>
											<h3>배틀그라운드 하이라이트</h3>
										</header>
									</article>
								</div>
								<div class="4u 12u$(mobile)">
									<article class="item">
										<a href='javascript:void(0);' class="image fit" data-video="zxigBqYZAok" onclick="video();"><img src="http://img.youtube.com/vi/zxigBqYZAok/1.jpg"/></a>
										<header>
											<h3>롤 스트림 하이라이트</h3>
										</header>
									</article>
									<article class="item">
										<a href='javascript:void(0);' class="image fit" data-video="9XEZXT4wyxQ" onclick="video();"><img src="http://img.youtube.com/vi/9XEZXT4wyxQ/1.jpg"/></a>
										<header>
											<h3>오버워치 하이라이트</h3>
										</header>
									</article>
								</div>
								<div class="4u$ 12u$(mobile)">
									<article class="item">
										<a href='javascript:void(0);' class="image fit" data-video="zF5Ddo9JdpY" onclick="video();"><img src="http://img.youtube.com/vi/zF5Ddo9JdpY/1.jpg"/></a>
										<header>
											<h3>리그오브레전드 시네마틱</h3>
										</header>
									</article>
									<article class="item">
										<a href='javascript:void(0);' class="image fit" data-video="MZ-hZrrGts8" onclick="video();"><img src="http://img.youtube.com/vi/MZ-hZrrGts8/1.jpg"/></a>
										<header>
											<h3>2019 PKL Phase 2 하이라이트</h3>
										</header>
									</article>
								</div>
							</div>

						</div>
					</section>

				<!-- About Me -->
					<section id="about" class="three">
						<div class="container">

							<header>
								<h2>Notice</h2>
							</header>

							<a href="#" class="image featured"><img src="images/pic08.jpg" alt="" /></a>
														<div class="container">
								<div class="row" id="update">
								<form method="post" action="updateAction.jsp?bbsID=<%=bbsID%>">
									<table class="table table-striped" style="text-align: center; border: 1px solid #ddddddd">
										<thead>
											<tr>
												<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 수정 양식</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%= bbs.getBbsTitle()%>"></td>
											</tr>
											<tr>
												<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;"><%= bbs.getBbsContent() %></textarea></td>
											</tr>
										</tbody>
										<input type="submit" class="btn btn-primary pull-right" value="글쓰기" style="margin:10px;padding:10px 15px 10px 15px;text-align:center;">
										</form>
									</table>		 
								</div>
							</div>
						</div>
					</section>

				<!-- Contact -->
					<section id="contact" class="four">
						<div class="container">
							<header>
								<h2>SiteMap</h2>
							</header>
<div class="row mb-5 mt-5">

                <!--Grid column-->
                <div class="col-lg-3 col-md-6">

                    <!--Card-->
                    <div class="card card-cascade narrower">

                        <!--Card image-->
                        <div class="view view-cascade py-3 gradient-card-header info-color">
                            <h5 class="mb-0"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">리그오브레전드</font></font></h5>
                        </div>
                        <!--/Card image-->

                        <!--Card content-->
                        <div class="card-body card-body-cascade">

                            <ul class="divided-list list-unstyled text-center">
                                <li><a href="https://mdbootstrap.com/plugins/jquery/card-layout/" target="_blank"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">자유게시판</font></font></a></li>
                                <li><a href="https://mdbootstrap.com/plugins/jquery/equal-height-columns/" target="_blank"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">정보게시판</font></font></a></li>
                                <li><a href="https://mdbootstrap.com/docs/jquery/layout/grid-examples/" target="_blank"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">게임 DB</font></font></a></li>
                                <li><a href="https://mdbootstrap.com/docs/jquery/layout/overview/" target="_blank"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">게임 일정</font></font></a></li>
                                <li><a href="https://mdbootstrap.com/docs/jquery/layout/overview/" target="_blank"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">게임 관련 뉴스</font></font></a></li>
                            </ul>

                        </div>
                        <!--/.Card content-->

                    </div>
                    <!--/.Card-->

                </div>
                <!--Grid column-->

                <!--Grid column-->
                <div class="col-lg-3 col-md-6">

                    <!--Card-->
                    <div class="card card-cascade narrower">

                        <!--Card image-->
                        <div class="view view-cascade py-3 gradient-card-header info-color">
                            <h5 class="mb-0"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">배틀그라운드</font></font></h5>
                        </div>
                        <!--/Card image-->

                        <!--Card content-->
                        <div class="card-body card-body-cascade">

                            <ul class="divided-list list-unstyled text-center">
                                <li><a href="https://mdbootstrap.com/plugins/jquery/card-layout/" target="_blank"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">자유게시판</font></font></a></li>
                                <li><a href="https://mdbootstrap.com/plugins/jquery/equal-height-columns/" target="_blank"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">정보게시판</font></font></a></li>
                                <li><a href="https://mdbootstrap.com/docs/jquery/layout/grid-examples/" target="_blank"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">게임 DB</font></font></a></li>
                                <li><a href="https://mdbootstrap.com/docs/jquery/layout/overview/" target="_blank"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">게임 일정</font></font></a></li>
                                <li><a href="https://mdbootstrap.com/docs/jquery/layout/overview/" target="_blank"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">게임 관련 뉴스</font></font></a></li>
                            </ul>

                        </div>
                        <!--/.Card content-->

                    </div>
                    <!--/.Card-->

                </div>
                <!--Grid column-->

                <!--Grid column-->
                <div class="col-lg-3 col-md-6">

                    <!--Card-->
                    <div class="card card-cascade narrower">

                        <!--Card image-->
                        <div class="view view-cascade py-3 gradient-card-header info-color">
                            <h5 class="mb-0"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">오버워치</font></font></h5>
                        </div>
                        <!--/Card image-->

                        <!--Card content-->
                        <div class="card-body card-body-cascade">

                            <ul class="divided-list list-unstyled text-center">
                                <li><a href="https://mdbootstrap.com/plugins/jquery/card-layout/" target="_blank"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">자유게시판</font></font></a></li>
                                <li><a href="https://mdbootstrap.com/plugins/jquery/equal-height-columns/" target="_blank"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">정보게시판</font></font></a></li>
                                <li><a href="https://mdbootstrap.com/docs/jquery/layout/grid-examples/" target="_blank"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">게임 DB</font></font></a></li>
                                <li><a href="https://mdbootstrap.com/docs/jquery/layout/overview/" target="_blank"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">게임 일정</font></font></a></li>
                                <li><a href="https://mdbootstrap.com/docs/jquery/layout/overview/" target="_blank"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">게임 관련 뉴스</font></font></a></li>
                            </ul>

                        </div>
                        <!--/.Card content-->

                    </div>
                    <!--/.Card-->

                </div>
                <!--Grid column-->

                <!--Grid column-->
                <div class="col-lg-3 col-md-6">

                    <!--Card-->
                    <div class="card card-cascade narrower">

                        <!--Card image-->
                        <div class="view view-cascade py-3 gradient-card-header info-color">
                            <h5 class="mb-0"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">오토체스</font></font></h5>
                        </div>
                        <!--/Card image-->

                        <!--Card content-->
                        <div class="card-body card-body-cascade">
                            <ul class="divided-list list-unstyled text-center">
                                <li><a href="https://mdbootstrap.com/plugins/jquery/card-layout/" target="_blank"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">자유게시판</font></font></a></li>
                                <li><a href="https://mdbootstrap.com/plugins/jquery/equal-height-columns/" target="_blank"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">정보게시판</font></font></a></li>
                                <li><a href="https://mdbootstrap.com/docs/jquery/layout/grid-examples/" target="_blank"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">게임 DB</font></font></a></li>
                                <li><a href="https://mdbootstrap.com/docs/jquery/layout/overview/" target="_blank"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">게임 일정</font></font></a></li>
                                <li><a href="https://mdbootstrap.com/docs/jquery/layout/overview/" target="_blank"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">게임 관련 뉴스</font></font></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            </div>
          </section>

			</div>
							<div id="footer1">
									<div class="slider close">
										<button class="closer" onclick="chat();" style="float:right;" value="닫기"></button>
										<iframe src="http://uchat.ch/jinho" height="450" width="700" style="margin: 20 10 20 300;"></iframe>  
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