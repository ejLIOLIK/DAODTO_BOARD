<%@ page import = "BOARD.DB.DB" %>
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

<form action = "reply/replyEditProc.jsp">
<%= d.replyId %>
<input type="hidden" name="replyNum" value="<%=d.replyNum%>">
<input type="hidden" name="PostNum" value="<%=d.PostNum%>">
<input type="hidden" name="currentPageStr_R" value="<%=currentPageStr_R%>">
<input type="text" name="replyText" value="<%=d.replyText%>">
<input type="submit" value="수정"> 
<button type="button" onclick="location.href='read.jsp?PostNum=<%=d.PostNum%>&currentPageStr_R=<%=currentPageStr_R%>'"> 취소 </button>
<%= d.date %>
</form>

</body>
</html>