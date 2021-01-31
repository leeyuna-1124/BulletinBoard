<%@page import="baewha.ac.kr.BoardDBBean"%>
<%@page import="baewha.ac.kr.BoardDataBean"%>
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
		String numStr = request.getParameter("num") ;
		int num = Integer.parseInt(numStr) ;	
		BoardDataBean data = BoardDBBean.getInstance().getArticleView(num) ;
	%>
	읽은 수: <%=data.getReadcount() %><br>
	작성자 : <%=data.getWriter() %><br>
	작성일 : <%=data.getReg_date() %><br>
	제목 : <%=data.getSubject() %><br>
	내용 : <%=data.getContent() %><br>
	
	<a href="writeform.jsp?num=<%=num%>">답글</a>
	<a href="updateform.jsp?num=<%=num%>">수정</a>
	<a href="deleteform.jsp?num=<%=num%>">삭제</a>
	<a href="list.jsp">목록</a>
</body>
</html>