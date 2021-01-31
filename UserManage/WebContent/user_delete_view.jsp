<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page import="java.sql.*"%>
<%@page language="java"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 정보(삭제)</title>
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
<%
request.setCharacterEncoding("utf8");
String id = request.getParameter("id");

//Class.forName("com.mysql.cj.jdbc.Driver");
//String url="jdbc:mysql://127.0.0.1:3306/is02?serverTimezone=UTC";
//Connection conn = DriverManager.getConnection(url, "root", "1234");

Context ctx = new InitialContext();
DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/db_mysql");
Connection con = ds.getConnection();

String sql ="select * from users where id=?";
PreparedStatement st = con.prepareStatement(sql);
st.setString(1, id);


ResultSet rs = st.executeQuery();
String name = "", phone="", email="";

if(rs.next()){
 name=rs.getString("name");
 phone=rs.getString("phone");
 email=rs.getString("email");
}else{
	name="해당 정보가 없습니다.";
}

rs.close();
st.close();
con.close();

%>
<div style="text-align:right;">
<a href="user_list.jsp">사용자 리스트</a><br>
</div>
<hr>
<table>
<tr><td>ID</td><td><%=id %></td></tr>
<tr><td>이름</td><td><%=name %></td></tr>
<tr><td>전화번호</td><td><%=phone %></td></tr>
<tr><td>이메일</td><td><%=email %></td></tr>
</table>

<br>
<a href="user_delete.jsp?id=<%=id%>">삭제</a>


</body>
</html>