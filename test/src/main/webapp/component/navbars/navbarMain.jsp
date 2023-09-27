
<body>

	<link rel="stylesheet"
		href="path/to/font-awesome/css/font-awesome.min.css">
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp"><i class="fa fa-home" aria-hidden="true"></i><b>
							Home</b><span class="sr-only">(current)</span></a></li>

				<%
				String username = (String) session.getAttribute("username");

				if (username != null) {
				%>

				<li class="nav-item active"><a class="nav-link"
					href="AddContact.jsp"><i class="fa fa-plus-square-o"
						aria-hidden="true"></i><b> Add Contact</b></a></li>
				<%
				} else {
				%>

				<li class="nav-item active"><a class="nav-link"
					data-toggle="modal" data-target="#exampleModal2"><i
						class="fa fa-plus-square-o" aria-hidden="true"></i><b> Add
							Contact</b></a></li>
				<%
				}
				if (username != null) {
				%>

				<li class="nav-item active"><a class="nav-link"
					href="ViewContact.jsp"><i class="fa fa-eye" aria-hidden="true"></i><b>
							View Contact</b></a></li>
				<%
				} else {
				%>


				<li class="nav-item active"><a class="nav-link"
					data-toggle="modal" data-target="#exampleModal2"><i
						class="fa fa-eye" aria-hidden="true"></i><b> View Contact</b></a></li>
				<%
				}
				%>
			</ul>

			<%
			if (username != null) {
			%>
			<form class="form-inline my-2 my-lg-0">
				<h1 align="left">True Caller App</h1>
				<a class="btn btn-success ml-4"><i class="fa fa-user"
					aria-hidden="true"></i> <%=username%> </a> <a data-toggle="modal"
					data-target="#exampleModal" class="btn btn-danger ml-4"><i
					class="fa fa-user" aria-hidden="true"></i> Log out</a>
			</form>
			<%
			}

			if (username == null) {
			%>

			<form class="form-inline my-2 my-lg-0">
				 <h1 class="text-light" align="left">True Caller App</h1>
				<a href="Login.jsp" class="btn btn-success ml-4"><i
					class="fa fa-user" aria-hidden="true"></i> Login</a> <a
					class="btn btn-danger ml-3" href="Register.jsp"><i
					class="fa fa-user-o" aria-hidden="true"></i> Sign up</a>
			</form>
			<%
			}
			%>


			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">

						<div class="modal-body">
							Are you sure you want to logout? <br> <a type="button"
								class="btn btn-success text-light mt-3 mr-3"
								data-dismiss="modal">No,I don't</a> <a href="LogouServlet"
								type="button" class="btn btn-danger mt-3">Yes,I want</a>

						</div>

					</div>
				</div>
			</div>

			<!-- Modal 2 -->
			<div class="modal fade bd-example-modal-sm" id="exampleModal2"
				tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
				aria-hidden="true">
				<div class="modal-dialog modal-sm border" role="document">
					<div class="modal-content">

						<div class="modal-body text-center">
							Please Login To Continue <br> <a href="Login.jsp"
								type="button" class="btn btn-success mt-3 ml-3">Log in</a>

						</div>

					</div>
				</div>
			</div>


		</div>
	</nav>

</body>