<%@ page import = "BOARD.DAO.crudDAO" %>
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
crudDAO dao = new crudDAO();
String num = request.getParameter("num");

dao.editDB(request.getParameter("title"), (String)session.getAttribute("idKey"), request.getParameter("content"), num);
%>

	Response.Write("<script>alert('수정되었습니다.');</script>");
	Response.Write("<script>location.href='read.jsp?num=<%=num%>';</script>");

</body>
</html>