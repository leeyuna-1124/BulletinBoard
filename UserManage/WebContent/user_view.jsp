<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 정보</title>
<style>

 table, th, td {      
                border-collapse:collapse;   
                border: solid 1px gray;
                width:30%;
         
            }
            table{
            table-layout: fixed;
            }




</style>
</head>
<body>
<h2>사용자 정보</h2>
<hr>
<div style="text-align:right">
<a href="user_list.jsp">사용자 리스트</a>
</div>
<%
request.setCharacterEncoding("utf-8");
String id =request.getParameter("id");

Context ctx = new InitialContext();
DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/db_mysql");
Connection con = ds.getConnection();

String sql = "select * from users where id=?";
PreparedStatement st = con.prepareStatement(sql);
st.setString(1, id);

ResultSet rs = st.executeQuery();
if(rs.next()){
	//찾았을 때
	%>
	<table>
	<tr><td>ID </td><td><%=rs.getString("id") %></td></tr>
	<tr><td>이름 </td><td><%=rs.getString("name") %></td></tr>
	<tr><td>전화번호 </td><td><%=rs.getString("phone") %></td></tr>
	<tr><td>이메일 </td><td><%=rs.getString("email") %></td></tr>
    <tr><td>주소</td><td><%=rs.getString("address")%></td></tr>
    <tr><td>소개</td><td><%=rs.getString("intro")%></td></tr>
	</table>
	
	<%
}else{
	//없을 때
	out.print("<h3>찾을 수 없습니다.</h3>");
	
}

rs.close();
st.close();
con.close();

%>
<br>
<a href="user_modify_form2.jsp?id=<%=id %>">수정</a>
<a href="user_delete_form.jsp?id="<%=id %>">삭제</a>
</body>
</html>