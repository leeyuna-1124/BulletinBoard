<%@page import="baewha.ac.kr.*"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 등록 결과</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf8") ;
	%>
	<jsp:useBean id="user" class="baewha.ac.kr.User" scope="page"/>
	<jsp:setProperty name="user" property="*"/>

	<% 
		String result ;
		UserDB db = new UserDB() ;
		if( db.insertUser(user) ) result = "사용자 정보를 등록했습니다." ;
		else    result = "사용자 정보를 등록하지 못했습니다." ;
	%>
	<h3><%=result %></h3>
	<br><a href="main.jsp">메인</a> <a href="user_list.jsp">사용자 리스트</a>
</body>
</html>
