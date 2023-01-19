<%@ page import="BOARD.DAO.searchDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

추천글 <br>
<% 

ArrayList<DTO> dtoB = new ArrayList<DTO>();

dtoB = dao.BestlistDB();
int bestN=1; // 
for(DTO d : dtoB){
	%><%=bestN%>위(<%=d.recmd %>추천) /
	<%= d.num %>
	<a href = "../read.jsp?num=<%=d.num%>"> <%=d.title %> </a> [<%=d.replyCount %>]
	<%= d.id %><br>
	<%bestN++;
}
%>

</body>
</html>