<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 쓰기</title>
</head>
<body>
<%
    String strNum = request.getParameter("num");
    if(strNum == null) strNum = "0";
%>
	<div align="center"><h2>글쓰기</h2></div>
	<div align="right"><a href="list.jsp">글목록</a><br></div>
	
	<form method="POST" action="writepro.jsp">	
	<input type="hidden" name="num" value="<%=strNum%>">
	<table width="100%">
	<tr><th>작성자</th><td><input type="text" name="writer" ></td></tr>
	<tr><th>이메일</th><td><input type="text" name="email" ></td></tr>
	<tr><th>제목</th><td><input type="text" name="subject" ></td>	</tr>
	<tr><th>내용</th><td><textarea  name="content" cols=50 rows="5"></textarea></td></tr>
	<tr><th>비밀번호</th><td><input type="text" name="passwd" ></td></tr>
	</table>
	<br>
	<button type="submit">저장</button>
	<button type="reset">리셋</button>
	<a href="list.jsp">목록보기</a>
	</form>
	
</body>
</html>