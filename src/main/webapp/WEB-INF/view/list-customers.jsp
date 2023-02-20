<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.nikola.springproject.utility.SortUtils"%>

<!DOCTYPE html>

<html>

<head>
	<title>List Customers</title>
	
	<!-- reference our style sheet -->
	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/assets/css/style.css" />

	<!-- reference to bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
		  integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>

<body>

<div class="container-fluid">

	<%-- NavBar	--%>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">Customer Relationship Manager - CRM | </a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item">
							<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/customer/list">Home</a>
						</li>
					</ul>
					<a class="navbar-brand d-flex justify-content-end" href="#">
						<img src="${pageContext.request.contextPath}/assets/img/unlock.png" width="30" height="30" class="d-inline-block align-top" alt="">

					</a>

							<p style="margin-top: 15px; margin-left: 15px">
								Username: <security:authentication property="principal.username" />, Role(s): <security:authentication property="principal.authorities" />
							</p>

						<form:form action="${pageContext.request.contextPath}/logout" method="post">
							<input style="margin-left: 5px" type="submit" value="Logout" class="btn btn-danger">
						</form:form>
				</div>
			</div>
		</nav>

		<br><br><br>



		<div class="row">
			<div class="col-lg-1 col-sm-12"></div>
			<div class="col-lg-3 col-sm-12"></div>
			<div class="col-lg-4 col-sm-12">
				<form:form action="search" method="GET">
					<input type="text" placeholder="Search" name="theSearchName" class="form-control me-2"/>
					<input type="submit" value="Search" class="form-control btn btn-outline-success"/>
				</form:form>
			</div>
		</div>

		<div class="row" style="margin-top: 5px">
			<div class="col-lg-1 col-sm-12"></div>

			<div class="col-lg-10 col-sm-12 tbodyDiv" >
				<%-- Table For Customers --%>
				<table class="table table-striped ">

					<c:url var="sortLinkFirstName" value="/customer/list">
						<c:param name="sort" value="<%= Integer.toString(SortUtils.FIRST_NAME)%>"/>
					</c:url>
					<c:url var="sortLinkLastName" value="/customer/list">
						<c:param name="sort" value="<%=Integer.toString(SortUtils.LAST_NAME)%>"/>
					</c:url>
					<c:url var="sortLinkEmail" value="/customer/list">
						<c:param name="sort" value="<%=Integer.toString(SortUtils.EMAIL)%>"/>
					</c:url>
					<c:url var="sortLinKCity" value="/customer/list">
						<c:param name="sort" value="<%=Integer.toString(SortUtils.CITY)%>"/>
					</c:url>

					<tr class="sticky-top table-success">
						<th><a href="${sortLinkFirstName}">First Name</a> </th>
						<th><a href="${sortLinkLastName}">Last Name</a> </th>
						<th><a href="${sortLinkEmail}">Email</a> </th>
						<th><a href="${sortLinKCity}">City</a> </th>
						<th>Address</th>

						<security:authorize access="hasAnyRole('ADMIN','MANAGER')">
						<th>Update <security:authorize access="hasRole('ADMIN')">| Delete</security:authorize></th>
						</security:authorize>

					</tr>

					<!-- loop over and print our customers -->
					<c:forEach var="tempCustomer" items="${customers}">

						<c:url var="updateLink" value="/customer/showFormForUpdate">
							<c:param name="customerId" value="${tempCustomer.id}"/>
						</c:url>

						<c:url var="deleteLink" value="/customer/delete">
							<c:param name="customerId" value="${tempCustomer.id}"/>
						</c:url>

						<tr>
							<td> ${tempCustomer.firstName} </td>
							<td> ${tempCustomer.lastName} </td>
							<td> ${tempCustomer.email} </td>
							<td> ${tempCustomer.city} </td>
							<td> ${tempCustomer.address} </td>


							<security:authorize access="hasAnyRole('MANAGER', 'ADMIN')">
							<%-- Display the update and delete link/button --%>
							<td>
								<security:authorize access="hasAnyRole('MANAGER', 'ADMIN')">
								<a href="${updateLink}"><button type="button" class="btn btn-sm btn-info">Update</button></a>
								</security:authorize>

								<security:authorize access="hasAnyRole('ADMIN')">
								<a href="${deleteLink}"><button onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false" type="button" class="btn btn-sm btn-dark">Delete</button></a>
								</security:authorize>
							</td>
							</security:authorize>

						</tr>

					</c:forEach>

				</table>

			</div>

			<security:authorize access="hasAnyRole('MANAGER','ADMIN')">
			<div class="col-lg-1 col-sm-12">
				<a href="${pageContext.request.contextPath}/customer/showFormForAdding"><button type="button" class="btn btn-warning">Add Customer</button></a>
			</div>
			</security:authorize>

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









