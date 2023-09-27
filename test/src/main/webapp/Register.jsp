<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up Page</title>
<%@include file="component/allref.jsp"%>


<style type="text/css">
.back_img {
	background: url(img/1.jpg);
	background-repeat: no-repeat;
	background-size: cover;
}
</style>

</head>
<body class="back_img">
	<%@include file="component/navbars/navbarMain.jsp"%>
	<br>
	<h1 class="text-justify text-light">Registration Form</h1>
	<div class="container mt-5 ml-5 mr-5 mv-5">
		<div class="com d-flex justify-content-center align-items-center">
			<div class="row mt-5 ml-5 mr-5 mv-5 rounded">
				<div class="card ">
					<div class="card-body">
						<form action="register" method="post">

							<%
							String fail = (String) session.getAttribute("fail");

							if (fail != null) {
							%>
							<p class="text-danger"><%=fail%></p>
							<%
							session.removeAttribute("fail");
							}
							%>
							<small id="emailHelp" class="form-text text-muted mb-2">We'll
								never share your info's with anyone else.</small>

							<div class="form-group">
								<label for="exampleInputEmail1">Name</label> <input name="name"
									type="text" class="form-control" placeholder="Enter Name">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									name="email" type="email" class="form-control"
									placeholder="Enter email">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									name="password" type="password" class="form-control"
									placeholder="Password">
							</div>
							<button type="submit" value="register" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>