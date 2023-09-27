<%@page import="com.connection.DbConnection"%>
<%@page import="com.entity.Contact"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.EditContactDao"%>
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
	<h1 class="text-justify text-light ">Edit Contact</h1>

	<div class="container mt-2">
		<div class="row justify-content-center">
			<div class="col-5 col-md-5 col-lg-5">
				<div class="card">
					<div class="card-body">
						<form action="EditContactServlet" method="post">

							<%
							String id = request.getParameter("cId");
							EditContactDao dao1 = new EditContactDao(DbConnection.getConn());
							Contact c = dao1.getContactByID(id);
							%>
							<input type="hidden" value=<%=id%> name="id">
							<div class="form-group">
								<label for="name">Short Name</label> <input
									value="<%=c.getName()%>" name="name" type="text"
									class="form-control" id="name" aria-describedby="namehelp"
									placeholder="Enter Name">
							</div>
							<div class="form-group">
								<label for="mobileno">Mobile No</label> <input
									value="<%=c.getMobileno()%>" name="mobile" type="number"
									class="form-control" id="mobileno"
									aria-describedby="mobileHelp" placeholder="Enter Mobile No">
							</div>
							<div class="form-group">
								<label for="work">Working As</label> <input
									value="<%=c.getWork()%>" name="work" type="text"
									class="form-control" id="work" aria-describedby="workhelp"
									placeholder="Enter The designation">
							</div>
							<div class="form-group">
								<label for="about">About</label>
								<textarea name="about" class="form-control" id="about"
									aria-describedby="Abouthelp" placeholder="Text"><%=c.getAbout()%></textarea>
							</div>
							<button type="submit" class="btn btn-primary">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>