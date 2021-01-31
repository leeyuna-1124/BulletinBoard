<%@page import="baewha.ac.kr.User"%>
<%@page import="baewha.ac.kr.UserDB"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="user_list.jsp">사용자 리스트</a>
	<hr>
	<jsp:useBean id="user" class="baewha.ac.kr.User"/>
	<%
	request.setCharacterEncoding("utf8") ;
	String id = request.getParameter("id") ;
	
	UserDB db = new UserDB() ;
	boolean found = db.getUser2(id, user) ;
	
	if(found) {
		//찾았을 때
	%>	
		<form method="post" action="user_modify.jsp">
		ID : <input type="text" name="id" value='<jsp:getProperty property="id" name="user"/>' ><br>
		비빌번호 :  <input type="text" name="pw"><br>
		이름 :  <input type="text" name="name" value="<jsp:getProperty property="name" name="user"/>" ><br>
		전화번호 :  <input type="text" name="phone" value="<jsp:getProperty property="phone" name="user"/>" ><br>
		이메일 :  <input type="text" name="email" value="<%=user.getEmail() %>" ><br>
		주소 :  <input type="text" name="address" value="<%=user.getAddress() %>" ><br>
		<button type="submit">저장</button>
		<button type="reset">리셋</button>
		</form>
	<% 	
	} else {
		//없을 때
		out.print("<h3>찾을 수 없습니다.<h3>") ;
	}
	%>
	

</body>
</html>