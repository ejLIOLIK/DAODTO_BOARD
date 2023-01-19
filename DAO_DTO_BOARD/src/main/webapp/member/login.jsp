<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="loginProc.jsp" method = "post">
ID : <input type="text" name="id"> 
<a href='register.jsp'">회원가입</a> <br>
PW : <input type="password" name="pw"> 
<input type="submit" value="로그인">
</form>

<a href="../board/list/list.jsp">게시판으로</a>

</body>
</html>