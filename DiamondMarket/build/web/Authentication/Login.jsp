<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/Register.css" />

        <link rel="stylesheet" href="./css/scrollbar.css"/>
    </head>
    <body>
        <jsp:include page="../Partials/navbar.jsp" />
        <% if (request.getAttribute("alert") != null) { %>
        <svg xmlns="http://www.w3.org/2000/svg" style="display: none; width: 10px;">
    <symbol id="exclamation-triangle-fill" viewBox="0 0 16 16">
        <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
    </symbol>
    </svg>

    <div class="alert alert-danger d-flex align-items-center alert-dismissible fade show" style="height: 50px; border-radius: 0px;" role="alert">
        <svg class="bi flex-shrink-0 me-2" role="img" style="width:26px; fill:red;" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
        <div>
            <strong><%= request.getAttribute("alert") %></strong>
        </div>
        <button type="button" class="btn-close" style="padding: 17px;" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <% }%>
    <section class="vh-100">
        <div class="container-fluid h-custom">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-md-9 col-lg-6 col-xl-5">
                    <img src="images/diamond.png"
                         class="img-fluid img" alt="diamondImg">
                </div>
                <div class="register col-md-8 col-lg-6 col-xl-4 offset-xl-1">

                    <form action="Login" method="post" class="needs-validation" novalidate>
                        <div class="d-flex align-items-center mb-3 pb-1">
                            <span class="h1 fw-bold mb-0">Login</span>
                        </div>

                        <!--Company ID-->
                        <div class="form-outline mb-4">
                            <input type="text" id="f1" name="companyId" class="form-control form-control-lg"
                                   placeholder="Enter a valid Company ID" required />
                            <label class="form-label" for="f1">Company ID</label>
                            <div class="invalid-feedback">Please Enter valid information.</div>
                        </div>

                        <!-- Password input -->
                        <div class="form-outline mb-3">
                            <input type="password" id="f5" name="password" class="form-control form-control-lg"
                                   placeholder="Enter password" required/>
                            <label class="form-label" for="f5">Password</label>
                            <div class="invalid-feedback">Please Enter valid information.</div>
                        </div>

                        <div class="text-center text-lg-start mt-4 pt-2">
                            <button type="submit" class="btn btn-primary btn-lg"
                                    style="padding-left: 2.5rem; padding-right: 2.5rem;">Login</button>
                            <p class="small fw-bold mt-2 pt-1 mb-0">Do not have an account? <a href="Register"
                                                                                               class="link-danger">Register</a></p>
                        </div>

                    </form>
                </div>
            </div>
        </div>

    </section>

    <jsp:include page="../Partials/footer.html"/>
</body>

<script
    type="text/javascript"
    src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"
></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

<script type="text/javascript" src="scripts/validation.js"></script>
</html>
