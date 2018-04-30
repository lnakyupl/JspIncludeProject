<%@page import="java.io.File"%>
<%@page import="com.sist.databoard.dao.*"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:useBean id="dao" class="com.sist.databoard.dao.DataBoardDAO"></jsp:useBean>
<%
	request.setCharacterEncoding("EUC-KR");
	String path = "c://download";
	int size = 1024*1024*100;
	String enctype="EUC-KR";
	MultipartRequest mr = new MultipartRequest(request,path,size,enctype, new DefaultFileRenamePolicy());
	
	String name = mr.getParameter("name");
	String subject= mr.getParameter("subject");
	String content = mr.getParameter("content");
	String filename= mr.getOriginalFileName("upload");
	String pwd = mr.getParameter("pwd");
	
	DataBoardVO vo = new DataBoardVO();
	vo.setName(name);
	vo.setSubject(subject);
	vo.setContent(content);
	vo.setPwd(pwd);
	
	if(filename==null){
		vo.setFilename("");
		vo.setFilesize(0);
	}else{
		vo.setFilename(filename);
		File f =new File(path+"\\"+filename);
		vo.setFilesize((int)f.length());
	}
	dao.databoardInsert(vo);
	response.sendRedirect("../main/main.jsp?mode=4");
%>