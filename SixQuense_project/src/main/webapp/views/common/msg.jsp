<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg=(String)request.getAttribute("msg");
	String loc=(String)request.getAttribute("loc");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>triptogether::여행을 떠나요</title>
</head>
<body>
	<script>
		alert("<%= msg %>");
	    location.replace("<%= request.getContextPath() + loc %>?userId=userId");
	</script>
</body>
</html>