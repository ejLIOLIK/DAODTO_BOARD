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
	
	if(session.getAttribute("idKey")==null){
		%>	Response.Write("<script>alert('로그인 후 이용하세요.');</script>");
		Response.Write("<script>location.href='read.jsp?num=<%=num%>';</script>");<%
	}
	else{

	if(dao.checkRightDB((String)session.getAttribute("idKey"), num)){
	dao.deleteDB(num);
	
	%>	Response.Write("<script>alert('삭제되었습니다.');</script>");
	Response.Write("<script>location.href='list/list.jsp?num=<%=num%>';</script>");
	<%
	
	}
	else{
	%>	Response.Write("<script>alert('권한이 없습니다.');</script>");
		Response.Write("<script>location.href='read.jsp?num=<%=num%>';</script>");<%	
	}
	}
	
%>
</body>
</html>