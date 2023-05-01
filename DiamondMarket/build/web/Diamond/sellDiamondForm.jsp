<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Sell a Diamond</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.css" rel="stylesheet"/>
        <link rel="stylesheet" href="./css/scrollbar.css"/>
    </head>

    <body>

        <jsp:include page="../Partials/navbar.jsp" />
         <% if (request.getAttribute("sellItemAdded") != null) {%>
        <h4 class=" text-center py-2"style="background-color: lightgreen"><%= request.getAttribute("sellItemAdded")%></h4>
        <% } %>
        <form action="sellDiamond" method="POST">
            <section class="h-100 bg-dark">
                <div class="container h-100" style="padding-bottom: 33px; padding-top: 33px">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col">
                            <div class="card card-registration my-4">
                                <div class="row g-0">
                                    <div class="col-xl-6 d-none d-xl-block">
                                        <img src="images/sell.jpg" class="img-fluid" style="border-top-left-radius: .25rem; border-bottom-left-radius: .25rem;"/>
                                    </div>
                                    <div class="col-xl-6 mt-5">
                                        <div class="card-body p-md-5 text-black">
                                            <h1 class="mb-2 border-bottom pb-2">Sell Diamond </h1>
                                            <h3 class="mb-4 mt-3">Diamond Details</h3>

                                            <div class="row">
                                                <div class="col-md-6 mb-4">
                                                    <div class="form-outline">
                                                        <!--                                                name="color"-->
                                                        <select class="form-select" aria-label="Default select example" name="color" required>
                                                            <option value="">Color</option>
                                                            <option value="D">D</option>
                                                            <option value="E">E</option>
                                                            <option value="F">F</option>
                                                            <option value="G">G</option>
                                                            <option value="H">H</option>
                                                            <option value="I">I</option>
                                                            <option value="J">J</option>
                                                            <option value="K">K</option>
                                                            <option value="M">L</option>
                                                            <option value="N">N</option>
                                                            <option value="O">O</option>
                                                            <option value="P">P</option>
                                                            <option value="Q">Q</option>
                                                            <option value="R">R</option>
                                                            <option value="S-Z">S-Z</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 mb-4">
                                                    <div class="form-outline">
                                                        <!--                                                name="purity"-->
                                                        <select class="form-select" aria-label="Default select example" name="purity" required>
                                                            <option value="">Purity</option>
                                                            <option value="FL">FL</option>
                                                            <option value="IF">IF</option>
                                                            <option value="VVS1">VVS1</option>
                                                            <option value="VVS2">VVS2</option>
                                                            <option value="VS1">VS1</option>
                                                            <option value="VS2">VS2</option>
                                                            <option value="SI1">SI1</option>
                                                            <option value="SI2">SI2</option>
                                                            <option value="I1">I1</option>
                                                            <option value="I2">I2</option>
                                                            <option value="I3">I3</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-6 mb-4">
                                                    <div class="form-outline">
                                                        <!--                                                name="cut"-->
                                                        <select class="form-select" aria-label="Default select example" name="cut" required>
                                                            <option value="">Cut</option>
                                                            <option value="Brilliant">Brilliant</option>
                                                            <option value="Square">Square</option>
                                                            <option value="Heart">Heart</option>
                                                            <option value="Marquise">Marquise</option>
                                                            <option value="Oval">Oval</option>
                                                            <option value="Pear">Pear</option>
                                                            <option value="Emerald">Emerald</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 mb-4">
                                                    <div class="form-outline">
                                                        <input type="text" id="weight" class="form-control form-control-lg" name="weight" required/>
                                                        <label class="form-label" for="form3Example1n1">Weight(Carat)</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-6 mb-4">
                                                    <div class="form-outline">
                                                        <input type="text" id="form3Example1n1" class="form-control form-control-lg" name="depther"/>
                                                        <label class="form-label" for="form3Example1n1">Depther</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 mb-4">
                                                    <div class="form-outline">
                                                        <input type="text" id="form3Example1n1" class="form-control form-control-lg" name="table"/>
                                                        <label class="form-label" for="form3Example1n1">Table</label>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="row">
                                                <div class="col-md-6 mb-4">
                                                    <div class="form-outline">
                                                        <input class="form-control form-control-lg" name="totalPrice" id="totalPrice" type="text" value="Total: " readonly>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 mb-4">
                                                    <div class="form-outline">
                                                        <input type="number" id="pricePerCarat" class="form-control form-control-lg" name="pricePerCarat" required onfocusout="calculatePrice(this)"/>
                                                        <label class="form-label" for="form3Example1n1">Price/Carat</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-6 mb-4">
                                                    <div class="form-outline">
                                                        <input class="form-control form-control-lg" name="totalRapPrice" id="totalRapPrice" type="text" value="RAP Total: " readonly>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 mb-4">
                                                    <div class="form-outline">
                                                        <input type="number" id="rapPricePerCarat" class="form-control form-control-lg" name="rapPricePerCarat" required onfocusout="calculateRapPrice(this)"/>
                                                        <label class="form-label" for="form3Example1n1">RAP-Price/Carat</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-outline mb-4">
                                                <select class="form-select" aria-label="Default select example" name="certAuth" required>
                                                    <option value="">Certification Authority</option>
                                                    <option value="GIA">GIA</option>
                                                    <option value="HRD">HRD</option>
                                                    <option value="IGI">IGI</option>
                                                    <option value="EGL">EGL</option>
                                                </select>
                                            </div>

                                            <div class="d-flex justify-content-end pt-3">
                                                <button type="reset" class="btn btn-light btn-lg">Clear</button>
                                                <button type="submit" class="btn btn-dark btn-lg ms-2">Put on Sell</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </form>

        <jsp:include page="../Partials/footer.html"/>

    </body>
    <script type="text/javascript">
        function calculatePrice(price) {
            var weight = document.getElementById('weight');
            var totalPrice = weight.value * price.value;

            document.getElementById("totalPrice").value = "Total:\t\t\t" + Math.round(totalPrice);
        }

        function calculateRapPrice(rapPrice) {
            var weight = document.getElementById('weight');
            var totalRapPrice = weight.value * rapPrice.value;

            document.getElementById("totalRapPrice").value = "RAP Total:\t\t" + Math.round(totalRapPrice);
        }
    </script>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"></script>

</html>
