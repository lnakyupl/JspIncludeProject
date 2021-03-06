<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.databoard.dao.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:useBean id="dao" class="com.sist.databoard.dao.DataBoardDAO"></jsp:useBean>
<%
	String strPage = request.getParameter("page");
	if (strPage == null)
		strPage = "1";
	int curpage = Integer.parseInt(strPage);
	ArrayList<DataBoardVO> list = dao.boardListData(curpage);
	int totalpage = dao.databoardTotalPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

</head>
<body>
	<section>
		<header>
			<h2>자료실</h2>
		</header>
		<table class="table table-striped">
			<tr>
				<td class="text-left">
					<a href="main.jsp?mode=4&dno=1" class="btn btn-sm btn-success">새글</a>
				</td>
			</tr>
		</table>
		<table class="table">
			<tr class="bg-primary">
				<th width="10%" class="text-center">번호</th>
				<th width="40%" class="text-center">제목</th>
				<th width="20%" class="text-center">이름</th>
				<th width="20%" class="text-center">작성일</th>
				<th width="10%" class="text-center">번호</th>
			</tr>
			<%
				int i = 0;
				String color;
				for (DataBoardVO vo : list) {
					if ((i++) % 2 == 0)
						color = "";
					else
						color = "warning";
			%>
			<tr class="<%=color%>">
				<td width="10%" class="text-center"><%=vo.getNo()%></td>
				<td width="40%" class="text-left">
				<a href="main.jsp?mode=4&dno=2&no=<%=vo.getNo()%>&page=<%=curpage%>"><%=vo.getSubject()%></a>
				</td>
				<td width="20%" class="text-center"><%=vo.getName()%></td>
				<td width="20%" class="text-center"><%=vo.getRegdate()%></td>
				<td width="10%" class="text-center"><%=vo.getHit()%></td>
			</tr>
			<%
				}
			%>

		</table>
		<table class="table table-striped">
			<tr>
				<td class="text-right"><a
					href="main.jsp?mode=4&page=<%=curpage > 1 ? curpage - 1 : curpage%>"
					class="btn btn-sm btn-info">이전</a> <a
					href="main.jsp?mode=4&page=<%=curpage < totalpage ? curpage + 1 : curpage%>"
					class="btn btn-sm btn-danger">다음</a></td> &nbsp;&nbsp;

				<%=curpage%>
				page /
				<%=totalpage%>
				pages
			</tr>
		</table>

	</section>
</body>
</html>