<%@page import="baewha.ac.kr.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf8");
	%>
	<jsp:useBean id="article" class="baewha.ac.kr.BoardDataBean"/>
	<jsp:setProperty property="*" name="article"/>
	<%
		article.setIp(request.getRemoteAddr()) ;
		BoardDBBean db = BoardDBBean.getInstance();
		db.insertArticle(article) ; 
		response.sendRedirect("list.jsp") ;
	%>

</body>
</html>