<%@ page import = "BOARD.DAO.crudDAO" %>
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

crudDAO dao = new crudDAO();
String num = request.getParameter("num");
dao.readDB(num);

if(session.getAttribute("idKey")==null){
	%>	Response.Write("<script>alert('로그인 후 이용하세요.');</script>");
	Response.Write("<script>location.href='read.jsp?num=<%=num%>';</script>");<%
}else{

if(dao.checkRightDB((String)session.getAttribute("idKey"), num)){
%>

<form action="editProc.jsp" method="get">
<input type="hidden" name="num" value=<%=DB.dto.num%>>

TITLE / <input type="text" name="title" value="<%=DB.dto.title%>"> <br>
<hr>
ID / <%=(String)session.getAttribute("idKey") %> <br>
CONTENT / <input type="text" name="content" value="<%=DB.dto.content%>"> <br>
<hr>
<input type="submit" value="수정">
</form>

<% }
else{
%>	Response.Write("<script>alert('권한이 없습니다.');</script>");
	Response.Write("<script>location.href='read.jsp?num=<%=num%>';</script>");<%
}}
%>

</body>
</html>