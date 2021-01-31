<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 등록</title>
<style>

table {
    width: 170px;
    table-layout: fixed;
}
</style>

</head>
<body>

<h2>사용자 정보 등록</h2>
<hr>
<div style="text-align:right;">
<a href="user_list.jsp">사용자 리스트</a>
</div>

<form method="post" action="user_insert.jsp">
      <table>
      <tr><td>아이디</td><td><input type="text" name="id"></td></tr>
      <tr><td>이름 </td><td><input type="text" name="name" ></td></tr>
      <tr> <td>비밀번호 </td><td><input type="text" name="password" ></td></tr>
      <tr><td>전화번호 </td><td><input type="text" name="phone" ></td></tr>
      <tr><td> 이메일 </td><td><input type="text" name="email" ></td></tr>
      <tr><td>주소 </td><td><input type="text" name="address" ></td></tr>
      <tr><td>소개 </td><td><textarea rows="5" cols="50"></textarea></td></tr>
      </table>
      <div style="margin:20px;">
      <button type="submit" >저장</button>
       <button type="reset" >리셋</button>
       </div>

      </form>


</body>
</html>