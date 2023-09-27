
<%@page import="com.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>True Caller</title>
<%@include file="component/allref.jsp"%>

<style type="text/css">
.back_img {
	background: url(img/6.jpg);
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body class="back_img">
	<%@include file="component/navbars/navbar.jsp"%>

	<%
	String success = (String) session.getAttribute("success");

	if (success != null) {
	%>
	<h3 class="text-success"><%=success%></h3>
	<%
	session.removeAttribute("success");
	}
	%>


	<%@include file="component/footer.jsp"%>
</body>

</html>