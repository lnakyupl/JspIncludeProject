<%@page import="com.sist.change.JspChange"%>
<%@page import="com.sist.databoard.dao.DataBoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:useBean id="dao" class="com.sist.databoard.dao.DataBoardDAO"></jsp:useBean>
<%
	ArrayList<DataBoardVO> list = dao.boardTopData();
	String no = request.getParameter("dno");
	if (no == null)
		no = "0";
	int n = Integer.parseInt(no);
	String jsp = JspChange.databoard_change(n);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div id="content-wrapper">
		<div id="content">
			<div class="container">
				<div class="row">
					<div class="9u 12u(mobile)">

						<!-- Main Content -->
						<jsp:include page="<%=jsp%>"></jsp:include>

					</div>
					<div class="3u 12u(mobile)">

						<!-- Sidebar -->
						<section>
							<header>
								<h2>인기 게시물</h2>
							</header>
							<ul class="link-list">
								<%
									for (DataBoardVO vo : list) {
								%>
								<li><a href="#"><%=vo.getSubject()%></a></li>
								<%
									}
								%>
							</ul>
						</section>
						<section>
							<header>
								<h2>실시간 단어 검색</h2>
							</header>
							<p>
								<img src="images/nyang.gif" width=100%>
							</p>
							<ul class="link-list">

							</ul>
						</section>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>