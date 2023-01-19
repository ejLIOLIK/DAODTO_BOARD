<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

NO. / TITLE / ID 🐰<hr>

<form action="list.jsp" method="get">

<select name="keywordRange" value="내용">
    <option value="제목">제목</option>
    <option value="작성자">작성자</option>
    <option value="내용">내용</option>
    <option value="제목+내용">제목+내용</option>
</select>

<%
if(blSearch){%>
<input type="text" name="keyword" value="<%=keyword%>">
<input type="submit" value="검색">
<% }
else{%>
<input type="text" name="keyword">
<input type="submit" value="검색">
<% }%>

</form>

</body>
</html>