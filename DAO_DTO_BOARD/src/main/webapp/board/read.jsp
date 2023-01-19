<%@page import="BOARD.DB.DTO"%>
<%@page import="BOARD.DB.DB"%>
<%@ page import = "BOARD.DAO.crudDAO" %>
<%@ page import = "BOARD.DAO.replyDAO" %>
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
dao.readDB(request.getParameter("num"));
dao.hitUpDB(DB.dto.num);

%>

<%=DB.dto.num %> <%= DB.dto.title %> [<%=DB.dto.replyCount%>] <br>
<hr>
hit / <%=DB.dto.hit %> <br>
ID / <%= DB.dto.id %> <br>
CONTENT / <%= DB.dto.content %> <br>

<hr>

<a href="recommandProc.jsp?value=up&rcmdNum=<%=DB.dto.num%>">👍추천</a> 
[<%=DB.dto.recmd %>]
<a href="recommandProc.jsp?value=down&rcmdNum=<%=DB.dto.num%>">👎반대</a> <br>

<button type="button" onclick="location.href='edit.jsp?num=<%=DB.dto.num%>'">수정</button>
<button type="button" onclick="location.href='delete.jsp?num=<%=DB.dto.num%>'">삭제</button>
<button type="button" onclick="location.href='list/list.jsp'">전체글보기</button>

<hr>

<%@include file = "reply/reply.jsp" %>

</body>
</html>