<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.ArrayList"%>
<%@ page import = "BOARD.DAO.listDAO" %>
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

<hr>
<form action="list.jsp">

<%
//=====================================================================
//페이징 화살표 버튼 선택시 링크 //
String url_leftB ="";
String url_rightB ="";
String tmpUrl_R=""; //인코딩용
String tmpUrl="";  	//인코딩용

url_leftB += "location.href='list.jsp?currentPage=";
url_leftB += Integer.toString(currentPage-1);
url_rightB += "location.href='list.jsp?currentPage=";
url_rightB += Integer.toString(currentPage+1);

if(blSearch){
	%><input type="hidden" name="keywordRange" value="<%=keywordRange%>">
	<input type="hidden" name="keyword" value="<%=keyword%>"><%

	////url인코딩 
	////방법 1. url을 문자열로 입력하기위해 encoding된 값으로 바꿔줌//
	tmpUrl_R = URLEncoder.encode(keywordRange);
	tmpUrl = URLEncoder.encode(keyword); 
	////방법 2. +특수문자를 인코딩된 문자열로 대체함.
	//keywordRange = keywordRange.replaceAll("[+]","%2B"); 

	url_leftB += "&keywordRange="+tmpUrl_R+"&keyword="+tmpUrl+"'";
	url_rightB += "&keywordRange="+tmpUrl_R+"&keyword="+tmpUrl+"'";
}
else{
	url_leftB += "'";
	url_rightB += "'";	
}
//=====================================================================
//특수기호 '<','>' 이전 &lt; 다음 &gt;
if(currentPage==1){ %>
<button type="button" onclick=<%=url_leftB%> disabled> &lt; </button>
<%}
else{%>
<button type="button" onclick=<%=url_leftB%>> &lt; </button>
<%} %> 

<input type="number" min="1" max="<%=dao.mountPage%>" style="width: 2em;" name="currentPage" value="<%= dao.currentPageNum%>"> 
/ <%= dao.mountPage %>
<input type="submit" value="이동">

<%if(currentPage==dao.mountPage){%>
<button type="button" onclick=<%=url_rightB%> disabled> &gt; </button>
<%}
else{%>
<button type="button" onclick=<%=url_rightB%>> &gt; </button>
<%} %>
</form>

<!-- == 페이징 블록 ========================================================================================== -->
<% 
//PAGINGNUM_BLOCK //페이징블록 수
//dao.mountPage // 전체 페이지 수
//currentPage //현재 페이지
//dao.mountPage+(DB.PAGINGNUM_BLOCK-1))/DB.PAGINGNUM_BLOCK //PAGINGNUM_BLOCK 상수 수정하더라도 호환가능
int curBlockPage;
if(request.getParameter("curBlockPage")==null){
curBlockPage = (int)(currentPage+(DB.PAGINGNUM_BLOCK-1))/DB.PAGINGNUM_BLOCK; }
else{
	curBlockPage = Integer.parseInt(request.getParameter("curBlockPage"));}

int startBlockPage=DB.PAGINGNUM_BLOCK*(curBlockPage-1)+1;

////이전////
if(curBlockPage>1){
	if(blSearch){ 
	%><a href="list.jsp?currentPage=<%=currentPage%>&curBlockPage=<%=curBlockPage-1%>&keywordRange=<%=tmpUrl_R%>&keyword=<%=tmpUrl%>">이전</a> - <%}
	else{
	%><a href="list.jsp?currentPage=<%=currentPage%>&curBlockPage=<%=curBlockPage-1%>">이전</a> - <%}
}	else{%>이전 - <%}

////숫자나열////	
if(blSearch){ 
	for(int l=0; l<DB.PAGINGNUM_BLOCK ; l++){ 
	if(startBlockPage+l<=dao.mountPage){%> 
	<a href="list.jsp?currentPage=<%=startBlockPage+l%>&curBlockPage=<%=curBlockPage%>&keywordRange=<%=tmpUrl_R%>&keyword=<%=tmpUrl%>">
	[<%=startBlockPage+l%>]
	</a><%}}
} else{
	for(int l=0; l<DB.PAGINGNUM_BLOCK ; l++){
	if(startBlockPage+l<=dao.mountPage){%> 
	<a href="list.jsp?currentPage=<%=startBlockPage+l%>&curBlockPage=<%=curBlockPage%>">[<%=startBlockPage+l%>]</a>
	<%}}
}

////다음////
if(curBlockPage<(dao.mountPage+(DB.PAGINGNUM_BLOCK-1))/DB.PAGINGNUM_BLOCK){  
	if(blSearch){
	%> - <a href="list.jsp?currentPage=<%=currentPage%>&curBlockPage=<%=curBlockPage+1%>&keywordRange=<%=tmpUrl_R%>&keyword=<%=tmpUrl%>">다음</a><%} 
	else{
	%> - <a href="list.jsp?currentPage=<%=currentPage%>&curBlockPage=<%=curBlockPage+1%>">다음</a><%}
}	else{%> - 다음<%}
%>
<hr>
<!-- ====================================================================================================== -->
<button type="button" onclick="location.href='../write.jsp'">글쓰기</button> 
<%if((String)session.getAttribute("idKey")==null){ %>
	<a href="../../member/login.jsp">로그인/회원가입</a>
<%}
else{%>
	<%=(String)session.getAttribute("idKey")%>(<a href="../../member/logout.jsp">로그아웃</a>) 
<%}%>

총 페이지 <%=dao.mountPage %> / 총 게시글 수 <%=dao.mountPost %>

</body>
</html>