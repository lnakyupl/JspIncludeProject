<%@page import="com.sist.databoard.dao.DataBoardVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:useBean id="dao" class="com.sist.databoard.dao.DataBoardDAO" />
<%
	String strNo = request.getParameter("no");
	String strPage = request.getParameter("page");
	DataBoardVO vo = dao.databoardDetailData(Integer.parseInt(strNo));
%>
<!DOCTYPE html >
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('#delBtn').click(function() {
			var txt = $('#delBtn').text();
			if (txt == '삭제') {
				$('#del').show();
				$('#delBtn').text("취소");
			} else {
				$('#del').hide();
				$('#delBtn').text("삭제");
			}
		});
	});
</script>
</head>
<body>
	<section>
		<header>
			<h2>내용보기</h2>
		</header>
		<table class="table table-hover">
			<tr>
				<td width=20% class="text-center success">번호</td>
				<td width=30% class="text-center"><%=vo.getNo()%></td>
				<td width=20% class="text-center success">작성일</td>
				<td width=30% class="text-center"><%=vo.getRegdate().toString()%></td>
			</tr>
			<tr>
				<td width=20% class="text-center success">이름</td>
				<td width=30% class="text-center"><%=vo.getName()%></td>
				<td width=20% class="text-center success">조회수</td>
				<td width=30% class="text-center"><%=vo.getHit()%></td>
			</tr>

			<tr>
				<td width=20% class="text-center success">제목</td>
				<td colspan="3" class="text-left"><%=vo.getSubject()%></td>
			</tr>
			<%
				if (vo.getFilesize() > 0) {
				
			%>
			<tr>
				<td width=20% class="text-center success">첨부파일</td>
				<td colspan="3" class="text-left"><a href="../databoard/download.jsp?fn=<%=vo.getFilename()%>"><%=vo.getFilename()%></a>(<%=vo.getFilesize()%>Bytes)
				</td>
			</tr>
			<%
				}
			%>
			<tr>
				<td colspan="4" class="text-left" valign="top" height="200"><%=vo.getContent()%></td>
			</tr>
		</table>
		<table class="table">
			<tr>
				<td class="text-right">
				<a href="#"	class="btn btn-sm btn-primary">수정</a> 
				<a href="#"	class="btn btn-sm btn-success" id="delBtn">삭제</a> 
				<a href="main.jsp?mode=4&dno=0&page=<%=strPage%>" class="btn btn-sm btn-info">목록</a>
			</tr>

			<tr id="del" style="display: none">
				<td class="text-right">
					<form action="../databoard/delete_ok.jsp">
						비밀번호:<input type="password" name=pwd size=10 required> <input
							type=hidden name=no value="<%=strNo%>"> <input
							type=hidden name=page value="<%=strPage%>"> <input
							type=submit value="삭제" class="btn btn-sm btn-danger">
					</form>
				</td>
			</tr>

		</table>
	</section>
</body>
</html>