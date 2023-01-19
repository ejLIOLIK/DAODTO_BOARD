<%@page import="java.util.ArrayList"%>
<%@ page import = "BOARD.DB.replyDTO" %>
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

ID / CONTENT / DATE <hr>

<%
ArrayList<replyDTO> rdtoA = new ArrayList<replyDTO>();
replyDAO rdao = new replyDAO();

String currentPageStr_R = request.getParameter("currentPageStr_R");
if(currentPageStr_R==null){
	currentPageStr_R = "1";
}
int currentPage_R = Integer.parseInt(currentPageStr_R);

rdao.pagintInitDB(DB.dto.num); //
rdtoA = rdao.listDB(DB.dto.num,currentPageStr_R);

int i = 0;
for(replyDTO d : rdtoA){
	if(d.replyNum.equals(request.getParameter("editNum"))){
		%><%@include file = "replyEdit.jsp" %><%
	}else{
	%>
	<%= d.replyId %>
	<%= d.replyText %>
	<%= d.date %>
	<a href="read.jsp?editNum=<%=d.replyNum%>&PostNum=<%=d.PostNum%>&currentPageStr_R=<%=currentPageStr_R%>"> 수정 </a> 
	/
	<a href="reply/replyDelete.jsp?delNum=<%=d.replyNum%>&PostNum=<%=d.PostNum%>&currentPageStr_R=<%=currentPageStr_R%>"> 삭제 </a>
	<br>
	<%}	i++;
}

if(i==0){ //리플 하나도 없는 경우
	%>작성된 리플이 없습니다.<%
	i++;
}

if(i<DB.PAGINGNUM_R){
	for(int j=0;j<DB.PAGINGNUM_R-i;j++){
		%> <br> <%
	}
}
%>

<%@include file = "replyBottom.jsp" %>

<form action = "reply/replyWriteProc.jsp" method = "get">

<input type="hidden" name="PostNum" value="<%=DB.dto.num%>">

<%
if(session.getAttribute("idKey")==null){
	%>손님<%
}
else{
%><%=session.getAttribute("idKey") %><% }
%>

<input type="text" name="replyText">
<input type="submit" value="입력">

</form>

<%-- <%=rdao.mountPage %> || <%=rdao.mountPost %> --%>

</body>
</html>