<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="read.jsp?num=<%=request.getParameter("num")%>">
<!-- 이전 &lt; 다음 &gt; -->

<%
//=====================================================================
// 페이징 화살표 버튼 선택시 링크 // currentPageStr_R //currentPage_R
String url_leftB_R ="";
String url_rightB_R ="";

url_leftB_R += "location.href='read.jsp?num="+request.getParameter("num")+"&currentPageStr_R=";
url_leftB_R += Integer.toString(currentPage_R-1)+"'";

url_rightB_R += "location.href='read.jsp?num="+request.getParameter("num")+"&currentPageStr_R=";
url_rightB_R += Integer.toString(currentPage_R+1)+"'";
//=====================================================================

if(currentPage_R==1){ %>
<button type="button" onclick=<%=url_leftB_R%> disabled> &lt; </button>
<%}
else{%>
<button type="button" onclick=<%=url_leftB_R%>> &lt; </button>
<%} %> 

<input type="hidden" name="num" value="<%=request.getParameter("num")%>">
<input type="number" min="1" max="<%=rdao.mountPage%>" style="width: 2em;" name="currentPageStr_R" value="<%=rdao.currentPageNum%>"> 
/ <%= rdao.mountPage %>
<input type="submit" value="이동">

<%if(currentPage_R==rdao.mountPage){%>
<button type="button" onclick=<%=url_rightB_R%> disabled> &gt; </button>
<%}
else{%>
<button type="button" onclick=<%=url_rightB_R%>> &gt; </button>
<%} %>

</form>

</body>
</html>