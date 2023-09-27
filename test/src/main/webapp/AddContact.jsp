<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Contact Page</title>
<%@include file="component/allref.jsp"%>


<style type="text/css">
.back_img {
	background: url(img/7.jpg);
	background-repeat: no-repeat;
	background-size: cover;
}
</style>

</head>
<body class="back_img">
	<%@include file="component/navbars/navbar.jsp"%>
	<br>
	<h1 class="text-justify text-light ">Add New Contact</h1>

	<div class="container mt-2">
		<div class="row justify-content-center">
			<div class="col-5 col-md-5 col-lg-5">
				<div class="card">
					<div class="card-body">
						<form action="AddContactServlet"  method="post">
						<%
							String contactfail = (String) session.getAttribute("contactfail");

							if (contactfail != null) {
							%>
							<p class="text-danger"><%=contactfail%></p>
							<%
							session.removeAttribute("contactfail");
							}
							%>
							<%
							String contactsuccess = (String) session.getAttribute("contactsuccess");

							if (contactsuccess != null) {
							%>
							<p class="text-success"><%=contactsuccess%></p>
							<%
							session.removeAttribute("contactsuccess");
							}
							%>
							
							<div class="form-group">
								<label for="name">Short Name</label> 
								<input name="name" type="text"
									class="form-control" id="name" aria-describedby="namehelp"
									placeholder="Enter Name">
							</div>
							<div class="form-group">
								<label for="mobileno">Mobile No</label> 
								<input name="mobile" type="number"
									class="form-control" id="mobileno"
									aria-describedby="mobileHelp" placeholder="Enter Mobile No">
							</div>
							<div class="form-group">
								<label for="work">Working As</label> 
								<input name="work" type="text"
									class="form-control" id="work" aria-describedby="workhelp"
									placeholder="Enter The designation">
							</div>
							<div class="form-group">
								<label for="about">About</label>
								<textarea name="about" class="form-control" id="about"
									aria-describedby="Abouthelp" placeholder="Text"></textarea>
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