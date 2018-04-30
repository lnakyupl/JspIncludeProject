<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:useBean id="dao" class="com.sist.member.dao.MemberDAO"></jsp:useBean>
<%
	String id = request.getParameter("id");
	int count = dao.idCheck(id);
%>
<%=count%>