<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer Form For Adding Customers</title>

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
            <a class="navbar-brand" href="#" id="navBarTitle">Customer Relationship Manager - CRM | </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/customer/list">Home</a>
                    </li>
                </ul>
                <form class="d-flex">
                    <form:form action="${pageContext.request.contextPath}/logout" method="post">
                        <input style="margin-left: 5px; margin-top: 15px" type="submit" value="Logout" class="btn btn-danger">
                    </form:form>
                </form>
            </div>
        </div>
    </nav>

    <br><br>


    <form:form action="saveCustomer" modelAttribute="customer" method="post">

        <%--    Need to associate this data with customer id!!!--%>
        <form:hidden path="id"/>

        <section class="h-100 bg-dark">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col">
                        <div class="card card-registration my-4">
                            <div class="row g-0">

                                <div class="col-xl-6">
                                    <div class="card-body p-md-5 text-black">
                                        <h3 class="mb-5 text-uppercase">Customer registration form</h3>

                                        <div class="row">
                                            <div class="col-md-6 mb-4">
                                                <div class="form-outline">
                                                    <form:input path="firstName" id="form3Example1m" class="form-control form-control-lg"/>
                                                    <label class="form-label" for="form3Example1m">First name</label>
                                                </div>
                                            </div>
                                            <div class="col-md-6 mb-4">
                                                <div class="form-outline">
                                                    <form:input path="lastName" id="form3Example1n" class="form-control form-control-lg"/>
                                                    <label class="form-label" for="form3Example1n">Last name</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <form:input path="email" id="form3Example97" class="form-control form-control-lg"/>
                                            <label class="form-label" for="form3Example97">Email</label>
                                        </div>

                                        <div class="row">
                                            <div class="form-outline col-md-6 mb-4">
                                                <form:input path="city" id="form3Example9" class="form-control form-control-lg"/>
                                                <label class="form-label" for="form3Example9">City</label>
                                            </div>


                                            <div class="form-outline col-md-6 mb-4">
                                                <form:input path="address" id="form3Example8" class="form-control form-control-lg"/>
                                                <label class="form-label" for="form3Example8">Address</label>
                                            </div>
                                        </div>


                                            <%-- Later to Add with custom validation--%>
<%--                                        <div class="form-outline mb-4">--%>
<%--                                            <input type="text" id="form3Example99" class="form-control form-control-lg" />--%>
<%--                                            <label class="form-label" for="form3Example99">Course</label>--%>
<%--                                        </div>--%>


                                        <div class="d-flex justify-content-end pt-3">
                                            <input type="reset" id="btnReset" value="Reset" class="btn btn-light btn-lg">
                                            <input type="submit" accept="Save" class="btn btn-warning btn-lg ms-2">
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </form:form>


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
