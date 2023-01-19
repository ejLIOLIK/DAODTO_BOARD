<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.*, java.util.*" %>
<%
	/* CSS/JS 파일 캐시 방지 */
	String styleCss = application.getRealPath("/css/style.css");
	File style = new File(styleCss);
	Date lastModifiedStyle = new Date(style.lastModified()); 
 
	SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMddhhmmssSSS");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/common.css?ver=<%=fmt.format(lastModifiedStyle)%>">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<a href="../member/login.jsp">로그인/회원가입</a> <br>
<a href="../board/list/list.jsp">게시판</a>

</body>
</html>