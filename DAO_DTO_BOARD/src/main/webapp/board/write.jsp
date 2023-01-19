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
if((String)session.getAttribute("idKey")==null){
	%>	Response.Write("<script>alert('로그인 후 이용하세요.');</script>");
	Response.Write("<script>location.href='list/list.jsp';</script>");<%
}
else{
%>

<form action = "writeProc.jsp" method="get">
TITLE / <input type="text" name="title"> <br>
<hr>
ID / <%=(String)session.getAttribute("idKey") %> <br>
CONTENT / <input type="text" name="content">  <br>
<hr>
<input type="submit" value="입력">
</form>

<%} %>

</body>
</html>