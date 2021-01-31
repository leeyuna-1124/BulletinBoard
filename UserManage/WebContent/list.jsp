<%@page import="baewha.ac.kr.BoardDataBean"%>
<%@page import="java.util.List"%>
<%@page import="baewha.ac.kr.BoardDBBean"%>
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
		BoardDBBean db = BoardDBBean.getInstance() ;
		int count = db.getArticleCount();
		String strPage = request.getParameter("page");
		int pageNo = 0;
		int pageSize = 5;
		try{
		pageNo = Integer.parseInt(strPage);
		}catch(Exception e){
			pageNo = 1;
		}
		int first = (pageNo -1) * pageSize ;
		
	%>
	<h2>글목록:<%=count %></h2>
	<table width="100%" boarder="1">
	<tr><th width="5%">번호</th><th width="50%">제목</th><th>이름</th>
	                             <th>날짜</th><th>IP</th></tr>	                         
	<%
		List<BoardDataBean> list = db.getArticles(first, pageSize) ;
	    int index = count - first;
		for(BoardDataBean item: list) {
			String indent = "";
			for(int i=0; i<= item.getRe_level(); i++){
				indent = indent + "&nbsp;&nbsp;&nbsp;";
			}
	%>
		<tr>
			<td><%=index--%></td>
			<td><%=indent%><a href="content.jsp?num=<%=item.getNum()%>"><%=item.getSubject()%></a></td>
			<td><%=item.getWriter()%></td>
			<td><%=item.getReg_date()%></td>
			<td><%=item.getIp()%></td>		 
		</tr>	
	
	<%
		}
	%>
	</table>
	<p align="center">
	<%
	    int maxPage = (count-1) / pageSize+1;
	    for(int i=1; i<=maxPage; i++){
	%>
	      <a href="list.jsp?page=<%=i%>">[<%=i %>]</a>
	<%
	}
	%>
	
	</p>
	

	<a href="writeform.jsp">글쓰기</a>
</body>
</html>