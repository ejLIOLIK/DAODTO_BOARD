<%@ page import = "BOARD.DAO.replyDAO" %>
<%@ page import = "BOARD.DB.DB" %>
<%@ page import = "BOARD.DB.replyDTO" %>
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

replyDAO rdao = new replyDAO();

if(session.getAttribute("idKey")!=null){
rdao.writeDB((String)session.getAttribute("idKey"),
		request.getParameter("PostNum"),
		request.getParameter("replyText"));
rdao.replyMountUpDB(request.getParameter("PostNum"));
response.sendRedirect("../read.jsp?num="+request.getParameter("PostNum"));
}
else{
	%>	Response.Write("<script>alert('로그인 후 이용하세요.');</script>");
	Response.Write("<script>location.href='../read.jsp?num=<%=request.getParameter("PostNum")%>';</script>");<%
}
%>

</body>
</html>