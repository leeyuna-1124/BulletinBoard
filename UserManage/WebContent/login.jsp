<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.*"%>
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
 String id =request.getParameter("id");
 String pw =request.getParameter("pw");
 
 Context ctx = new InitialContext();
 DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/db_mysql");
 Connection con = ds.getConnection();

Statement st = con.createStatement();
String sql = String.format("select * from users where id='%s' and password='%s'", id, pw);
ResultSet rs = st.executeQuery(sql);//sql injection공격에 안좋음!!
if(rs.next()){
	//로그인 성공
	out.print("<h3>로그인 성공</h3>");
	session.setAttribute("id", id);
	session.setAttribute("name", rs.getString("name"));//세션정보에 id와 name저장
}else{
	//로그인 실패
	out.print("로그인 실패");
	response.sendRedirect("login_fail.jsp");
}
rs.close(); con.close(); st.close();
 %>
 <a href="main.jsp">메인</a><br>
 <a href="logout.jsp">로그아웃</a>
</body>
</html>