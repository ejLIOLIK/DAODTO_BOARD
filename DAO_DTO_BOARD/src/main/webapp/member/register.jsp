<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="registerProc.jsp" method="post">
email / <input type="email" name="email" required> <br>
id / <input type="text" name="id" required> <br>
pw / <input type="password" name="pw1" required> <br>
pw* / <input type="password" name="pw2" required> <br>
<input type="submit" value="가입">
<a href="login.jsp">뒤로</a>
</form>

</body>
</html>