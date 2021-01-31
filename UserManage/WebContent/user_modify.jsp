<%@page import="baewha.ac.kr.UserDB"%>
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
	<jsp:useBean id="user" class="baewha.ac.kr.User"/>
	<jsp:setProperty name="user" property="*" />
	<%
	    UserDB db = new UserDB() ;
		boolean success = db.updateUser(user) ;  
		String result = success ? "변경완료했습니다." : "수정하지 못했습니다"  ;
	%>
	<h3><%=result %></h3>
	<a href="user_list.jsp">사용자 리스트</a>
</body>
</html>