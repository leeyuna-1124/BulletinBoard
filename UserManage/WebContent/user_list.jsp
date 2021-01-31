<%@page import="baewha.ac.kr.User"%>
<%@page import="java.util.List"%>
<%@page import="baewha.ac.kr.UserDB"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 리스트</title>
</head>
<body>
	<table width="100%">
		<tr>
			<th>번호</th><th>id</th><th>이름</th><th>전화번호</th><th>메일</th>
		</tr>
<%

	//데이터 가져오는 부분을 
	UserDB userdb = UserDB.getInstance() ;
	List<User> list = userdb.getUserList() ;
	
	int index = 1 ;
	for(User user : list) {
%>
		<tr>
			<td><%=index++ %></td><td><%=user.getId() %></td>
			<td><a href="user_view.jsp?id=<%=user.getId()%>">
			         <%=user.getName() %></a>
			</td>
			<td><%=user.getPhone() %></td>
			<td><%=user.getEmail() %></td>
		</tr>
<%
	}
%>	
	</table>
	
	<a href="main.jsp">메인</a>
</body>
</html>