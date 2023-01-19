<%@page import="java.util.ArrayList"%>
<%@ page import = "BOARD.DAO.searchDAO" %>
<%@ page import = "BOARD.DB.DB" %>
<%@ page import = "BOARD.DB.DTO" %>
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
boolean blSearch=false;
String keyword = "";
String keywordRange = "";
searchDAO dao = new searchDAO();

if (request.getParameter("keyword")!=null) {
	blSearch = true;
	keyword = request.getParameter("keyword");
	keywordRange = request.getParameter("keywordRange");
}

%>
<%@include file = "listTop.jsp" %>
<hr>
<%@include file = "listBest.jsp" %>
<hr>
<%
ArrayList<DTO> dtoA = new ArrayList<DTO>();

String currentPageStr = request.getParameter("currentPage");
if(currentPageStr==null){
	currentPageStr = "1";
}
int currentPage = Integer.parseInt(currentPageStr);

if(blSearch){
	dao.pagintInitDB(keyword, keywordRange);
	dtoA = dao.listDB(currentPageStr, keyword, keywordRange);
}
else{
	dao.pagintInitDB();
	dtoA = dao.listDB(currentPageStr);
}

int i = 0;
for(DTO d : dtoA){
	%>
	<%= d.num %>
	<a href = "../read.jsp?num=<%=d.num%>"> <%=d.title %> </a> [<%=d.replyCount %>]
	<%= d.id %> 
	/ <%= d.hit %>hit <br>
	<%	i++;
}
if(i<DB.PAGINGNUM){
	for(int j=0;j<DB.PAGINGNUM-i;j++){
		%> <br> <%
	}
}

if(i==0){ //검색결과 없음 팝업 %>
	Response.Write("<script>alert('결과가 없습니다.');</script>");
	Response.Write("<script>location.href='list.jsp';</script>");
<%}%>

<%@ include file = "listBottom.jsp" %>



</body>
</html>