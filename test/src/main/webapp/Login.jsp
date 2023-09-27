<%@page import="com.entity.Register"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login Page</title>
<%@include file="component/allref.jsp"%>


<style type="text/css">
.back_img {
	background: url(img/3.jpg);
	background-repeat: no-repeat;
	background-size: cover;
}
</style>

</head>
<body class="back_img">
	<%@include file="component/navbars/navbarMain.jsp"%>
	<br>
	<h1 class="text-justify text-light">Login Form</h1>


	<div class="container mt-5 ml-5 mr-5 mv-5">
		<div class="com d-flex justify-content-center align-items-center">
			<div class="row mt-5 ml-5 mr-5 mv-5 rounded">
				<div class="card ">
					<div class="card-body">
						<form action="LoginServlet" method="post">
							<div class="form-group">
								<%
								String logfail = (String) session.getAttribute("logfail");

								if (logfail != null) {
								%>
								<p class="text-danger"><%=logfail%></p>
								<%
								session.removeAttribute("logfail");
								}
								%>
								<%
								String logouted = (String) session.getAttribute("logouted");

								if (logouted != null) {
								%>
								<p class="text-danger"><%=logouted%></p>
								<%
								session.removeAttribute("logouted");
								}
								%>
								<label for="exampleInputEmail1">Email address</label> <input
									name="email" type="email" name="mail" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter email">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									name="password" type="password" name="pass"
									class="form-control" id="exampleInputPassword1"
									placeholder="Password">
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>