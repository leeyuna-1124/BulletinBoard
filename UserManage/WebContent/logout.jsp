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
//session.removeAttribute("id");
//session.removeAttribute("name");//세션에 등록되어 있는 정보 하나하나 지움
session.invalidate();//세션에 있는 모든 정보를 삭제
%>
<h3>로그아웃 되었습니다.</h3>
<a href="login_form.jsp">로그인</a>
</body>
</html>