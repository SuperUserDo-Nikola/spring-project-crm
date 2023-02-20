<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!doctype html>
<html lang="en">

<head>
	
	<title>Login Page</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- reference our style sheet -->
	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/assets/css/style.css" />

	<!-- reference to bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
		  integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	
	<!-- Reference Bootstrap files -->
	<link rel="stylesheet"
		 href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body>




	<div class="container-fluid">
		<%-- NavBar	--%>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">Customer Relationship Manager - CRM </a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

					<form class="d-flex justify-content-end">
						<form:form action="search" method="get">
							<a href="${pageContext.request.contextPath}/register/showRegistrationForm" class="btn btn-primary"
							   role="button" aria-pressed="true">Register New User</a>

						</form:form>
					</form>
				</div>
		</nav>

		<br><br><br>
		
		<div id="loginbox" style="margin-top: 50px;"
			class="mainbox d-flex justify-content-center">
			
			<div class="panel panel-info">

				<div class="panel-heading ">
					<div class="panel-title">Sign In</div>
				</div>

				<div style="padding-top: 30px" class="panel-body">

					<!-- Login Form -->
					<form action="${pageContext.request.contextPath}/authenticateTheUser" 
						  method="POST" class="form-horizontal">

					    <!-- Place for messages: error, alert etc ... -->
					    <div class="form-group">
					        <div class="col-xs-15">
					            <div>
								
									<!-- Check for login error -->
								
									<c:if test="${param.error != null}">
										
										<div class="alert alert-danger col-xs-offset-1 col-xs-10">
											Invalid username and password.
										</div>
		
									</c:if>
										
									<!-- Check for logout -->

									<c:if test="${param.logout != null}">
										            
										<div class="alert alert-success col-xs-offset-1 col-xs-10">
											You have been logged out.
										</div>
								    
									</c:if>
									
					            </div>
					        </div>
					    </div>

						<!-- User name -->
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> 
							
							<input type="text" name="username" placeholder="username" class="form-control">
						</div>

						<!-- Password -->
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span> 
							
							<input type="password" name="password" placeholder="password" class="form-control" >
						</div>

						<!-- Login/Submit Button -->
						<div style="margin-top: 10px" class="form-group">						
							<div class="col-sm-6 controls">
								<button type="submit" class="btn btn-success">Login</button>
							</div>
							<div class="col-sm-6"><img style="height: 32px; margin-left: -55px;" src="${pageContext.request.contextPath}/assets/img/lock.png"></div>
						</div>

						<!-- I'm manually adding tokens ! -->

						<input type="hidden"
							   name="${_csrf.parameterName}"
							   value="${_csrf.token}" />
						
					</form>

				</div>
				
			</div>

		</div>

	</div>




	<script src="${pageContext.request.contextPath}/assets/js/simple.js"></script>
	<!-- Reference to Bootstrap JS files -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
			integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
			integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>