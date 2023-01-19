<%@page import="org.apache.catalina.connector.Response"%>
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
String title= request.getParameter("title");
String id= (String)session.getAttribute("idKey");
String content= request.getParameter("content");

dao.writeDB(title, id, content);
response.sendRedirect("list/list.jsp");

%>

</body>
</html>