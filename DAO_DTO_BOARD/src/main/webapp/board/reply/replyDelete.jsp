<%@ page import = "BOARD.DAO.replyDAO" %>
<%@ page import = "BOARD.DB.DB" %>
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
// 권한 부여 필요
replyDAO rdao = new replyDAO();

if(rdao.checkRightDB((String)session.getAttribute("idKey"), request.getParameter("delNum"))){

rdao.replyDeleteDB(request.getParameter("delNum"));
rdao.replyMountDownDB(request.getParameter("PostNum"));

response.sendRedirect("../read.jsp?num="+ request.getParameter("PostNum") + "&currentPageStr_R="+ request.getParameter("currentPageStr_R"));
}
else{
	%>	Response.Write("<script>alert('권한이 없습니다.');</script>");
	Response.Write("<script>location.href='read.jsp?num=<%=request.getParameter("PostNum")%>';</script>");<%	
}

%>

</body>
</html>