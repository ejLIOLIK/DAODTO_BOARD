<%@ page import="BOARD.DAO.crudDAO" %>
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
dao.recommand(request.getParameter("value"), request.getParameter("rcmdNum"));
response.sendRedirect("read.jsp?num="+request.getParameter("rcmdNum"));

%>

</body>
</html>