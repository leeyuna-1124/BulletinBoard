<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="baewha.ac.kr.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 삭제</title>
</head>
<body>
<%
request.setCharacterEncoding("utf8") ; %>
<jsp:useBean id="user" class="baewha.ac.kr.User" scope="page"/>
<jsp:setProperty name="user" property="*"/>

<% 
	String result ;
    UserDB db = new UserDB() ;
	if( db.deleteUser(user) ) result = "사용자를 삭제했습니다." ;
	else    result = "사용자 정보를 삭제하지 못했습니다." ;
%>
<h3><%=result %></h3>
<%
String r="";
r="local";
pageContext.setAttribute("result", "page");
request.setAttribute("result", "request");
session.setAttribute("result", "session");
application.setAttribute("result", "application");

%>
r:<%=r %>
<a href="main.jsp">메인</a>
<a href="user_list.jsp">사용자 리스트</a>
</body>
</html>