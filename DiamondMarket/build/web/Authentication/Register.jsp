<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <title>Registration</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/Register.css" />

        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
            />
        <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
            />
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.css"
            rel="stylesheet"
            />
    </head>
    <body>
        <section class="vh-100">
            <div class="container-fluid h-custom">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-md-9 col-lg-6 col-xl-5">
                        <img src="images/diamond.png"
                             class="img-fluid img" alt="diamondImg">
                    </div>
                    <div class="register col-md-8 col-lg-6 col-xl-4 offset-xl-1">

                        <form action="Register" method="post" class="needs-validation" novalidate>
                            <div class="d-flex align-items-center mb-3 pb-1">
                                <span class="h1 fw-bold mb-0">Register</span>
                            </div>

                            <!--Company ID-->
                            <div class="form-outline mb-4">
                                <input type="text" id="f1" name="comapanyId" class="form-control form-control-lg"
                                       placeholder="Enter a valid Company ID" required />
                                <label class="form-label" for="f1">Company ID</label>
                                <div class="invalid-feedback">Please Enter valid information.</div>
                            </div>

                            <!--Company Name-->
                            <div class="form-outline mb-4">
                                <input type="text" id="f2" name="companyname" class="form-control form-control-lg"
                                       placeholder="Enter your company's name" required />
                                <label class="form-label" for="f2">Comapany Name</label>
                                <div class="invalid-feedback">Please Enter valid information.</div>
                            </div>

                            <!-- Email input -->
                            <div class="form-outline mb-4">
                                <input type="email" id="f3" name="email" class="form-control form-control-lg"
                                       placeholder="Enter a valid email address" required />
                                <label class="form-label" for="f3">Email address</label>
                                <div class="invalid-feedback">Please Enter valid information.</div>
                            </div>

                            <!--Contact-->
                            <div class="form-outline mb-4">
                                <input type="text" id="f4" name="contact" class="form-control form-control-lg"
                                       placeholder="Enter a valid Contact Number" minlength="10" maxlength="10" required/>
                                <label class="form-label" for="f4">Contact</label>
                                <div class="invalid-feedback">Please Enter valid information.</div>
                            </div>

                            <!-- Password input -->
                            <div class="form-outline mb-3">
                                <input type="password" id="f5" name="password" class="form-control form-control-lg"
                                       placeholder="Enter password" required/>
                                <label class="form-label" for="f5">Password</label>
                                <div class="invalid-feedback">Please Enter valid information.</div>
                            </div>
                            
                            <div class="form-outline mb-3">
                                <input type="password" id="f5" name="cfmpassword" class="form-control form-control-lg"
                                       placeholder="Enter password again" required/>
                                <label class="form-label" for="f5">Confirm Password</label>
                                <div class="invalid-feedback">Please Enter valid information.</div>
                            </div>

                            <div class="text-center text-lg-start mt-4 pt-2">
                                <button type="submit" class="btn btn-primary btn-lg"
                                        style="padding-left: 2.5rem; padding-right: 2.5rem;">Register</button>
                                <p class="small fw-bold mt-2 pt-1 mb-0">Already have an account? <a href="LoginForm"
                                                                                                    class="link-danger">Login</a></p>
                            </div>

                        </form>
                    </div>
                </div>
            </div>

        </section>
    </body>

    <script
        type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"
    ></script>

    <script type="text/javascript" src="scripts/validation.js"></script>
</html>
