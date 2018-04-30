<%@page import="java.io.File"%>
<%@page import="com.sist.databoard.dao.DataBoardVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:useBean id="dao" class="com.sist.databoard.dao.DataBoardDAO"></jsp:useBean>
<%
	String strNo = request.getParameter("no");
	String strPage = request.getParameter("page");
	String pwd = request.getParameter("pwd");
	DataBoardVO vo = dao.databoardFileInfo(Integer.parseInt(strNo));
	boolean flag = dao.databoardDelete(Integer.parseInt(strNo), pwd);

	if (flag) {
		if (vo.getFilesize() > 0) {
			File f = new File("c:\\download\\" + vo.getFilename());
			f.delete();
		}
		response.sendRedirect("../main/main.jsp?&mode=4&page=" + page);
	} else {
%>
<script>
	alert("비밀번호가 틀립니다");
	history.back();
</script>
<%
	}
%>