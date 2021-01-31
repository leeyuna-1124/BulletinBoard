<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<h2>로그인</h2>
<%
//로그인되어있을 경우 메인페이지로 이동
String id = (String)session.getAttribute("id");
if(id != null){
	response.sendRedirect("main.jsp");//로그인을 한 상태라면, 로그인폼으로 갈때 메인페이지를 보여준다.
}
%>
   <form method="post" action="login.jsp">
   ID : <input type="text" name="id" value=<%=id %>><Br>
   PW : <input type="password" name="pw"><br>
   <button type="submit">로그인</button>
   </form>
   </body>
</html>