<%@ page import="BOARD.DAO.memDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- email id pw1 pw2 -->
<%
	memDAO mtdo = new memDAO();
	String str =mtdo.registerDB(request.getParameter("email"), request.getParameter("id"), request.getParameter("pw1"),	request.getParameter("pw2"));
%>
Response.Write("<script>alert('<%=str%>');</script>"); <%  
if(str.equals("회원가입 성공")){
	%>Response.Write("<script>location.href='login.jsp';</script>");<%
}
else{
	%>Response.Write("<script>location.href='register.jsp';</script>");<%
}
%>


</body>
</html>