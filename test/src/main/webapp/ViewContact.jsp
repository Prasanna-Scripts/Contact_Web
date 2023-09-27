
<%@page import="com.dao.RegisterDao"%>
<%@page import="com.entity.Contact"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Register"%>
<%@page import="com.dao.AddContactDao"%>
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
	background: url(img/7.jpg);
	background-repeat: no-repeat;
	background-size: cover;
}

.card-hov:hover {
	background-color: #e9ebf0;
}
</style>
</head>
<body class="back_img">
	<%@include file="component/navbars/navbar.jsp"%>
<%
	String contactdeletefail = (String) session.getAttribute("contactdeletefail");

	if (contactdeletefail != null) {
	%>
	<div class="alert alert-danger" role="alert">
		<%=contactdeletefail%>
	</div>
	<%
	session.removeAttribute("contactdeletefail");
	}
	%>
	<%
	String contactdeletesuccess = (String) session.getAttribute("contactdeletesuccess");

	if (contactdeletesuccess != null) {
	%>
	<div class="alert alert-success" role="alert">
		<%=contactdeletesuccess%>
	</div>
	<%
	session.removeAttribute("contactdeletesuccess");
	}
	%>






	<%
	String contactupdatefail = (String) session.getAttribute("contactupdatefail");

	if (contactupdatefail != null) {
	%>
	<div class="alert alert-danger" role="alert">
		<%=contactupdatefail%>
	</div>
	<%
	session.removeAttribute("contactupdatefail");
	}
	%>
	<%
	String contactupdatesuccess = (String) session.getAttribute("contactupdatesuccess");

	if (contactupdatesuccess != null) {
	%>
	<div class="alert alert-success" role="alert">
		<%=contactupdatesuccess%>
	</div>
	<%
	session.removeAttribute("contactupdatesuccess");
	}
	%>

	<div class="container">
		<div class="row p-4">
			<%
			AddContactDao dao = new AddContactDao(DbConnection.getConn());
			List<Contact> contact = dao.getAllContact(username);

			for (Contact c : contact) {
			%>

			<div class="col-md-3  mt-5">


				<div class="card border border-primary rounded card-hov">
					<div class="card-body">
						<h5>
							Name:
							<%=c.getName()%></h5>
						<p>
							Mobile No:
							<%=c.getMobileno()%></p>
						<p>
							Work:
							<%=c.getWork()%></p>
						<p>
							About:
							<%=c.getAbout()%></p>

						<div class="text-center">
							<a href="EditContact.jsp?cId=<%=c.getId()%>"
								class="btn btn-success btn-sm text-white">Edit</a> 
								<a href="delete?cId=<%=c.getId()%>"
								class="btn btn-danger btn-sm text-white">Delete</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>





	<%@include file="component/footer.jsp"%>
</body>

</html>