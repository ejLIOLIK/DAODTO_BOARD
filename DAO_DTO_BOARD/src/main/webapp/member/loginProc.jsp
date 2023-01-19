<%@ page import = "BOARD.DAO.memDAO" %>
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
memDAO mdao = new memDAO();
if(mdao.loginDB(request.getParameter("id"),request.getParameter("pw"))){
	
	session.setAttribute("idKey", request.getParameter("id"));
	response.sendRedirect("../board/list/list.jsp");
}
else{
%>	Response.Write("<script>alert('로그인 실패');</script>");
	Response.Write("<script>location.href='login.jsp';</script>");<%
}
%>
</body>
</html>