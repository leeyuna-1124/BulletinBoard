<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 삭제</title>
</head>
<body>
      <%
String id = (String)session.getAttribute("id");
if(id==null){
	response.sendRedirect("login_form.jsp");//로그인이 되어있지 않은 상태라면, 로그인페이지로 이동한다.
}
      %>
<h2>사용자 정보 삭제</h2>
<hr>
<div style="text-align:right;">
<a href="user_list.jsp">사용자 리스트</a><br>
</div>


<form action="user_delete_view.jsp" method="post">
삭제 할 아이디 : <input type="text" name="id" >
<button type="submit">삭제하기</button>
</form>
<br>
<a href="main.jsp">메인</a>


</body>
</html>