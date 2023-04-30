<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="Database.Database"%>
<%@page import="Diamond.Diamond"%>
<%@page import="java.util.Vector"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <link type="text/css" rel="stylesheet" href="CSS/CartStyle.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <title>Cart</title>
    </head>

    <body>

        <jsp:include page="../Partials/navbar.jsp" />

        <%
            String[] cart = (String[]) session.getAttribute("cart");

            Database db = new Database();
            int totalamount = 0;

            Vector<Diamond> data = new Vector<>();
            try {
                db.connect();
                db.stmt = db.con.createStatement();

                for (String item : cart) {
                    String query = "select * from `buyer_list` where `report_no`=" + item;
                    ResultSet rs = db.stmt.executeQuery(query);

                    rs.next();
                    Diamond diamond = new Diamond(rs);
                    totalamount += diamond.totalPrice;
                    data.add(diamond);
                }
            } catch (Exception error) {
                out.println(error);
            }

            int size = data.size();
        %>

        <section class="h-100 h-custom" style="background-color: #6b6b6b;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12">
                        <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                            <div class="card-body p-0">
                                <div class="row g-0">
                                    <div class="col-lg-8">
                                        <div class="p-5">
                                            <div class="d-flex justify-content-between align-items-center mb-5">
                                                <h1 class="fw-bold mb-0 text-black">Added Diamonds</h1>
                                                <h4 class="mb-0 text-muted"><%= size%> Diamonds </h4>
                                            </div>
                                            <hr class="my-4">

                                            <%
                                                for (int i = 0; i < size; i++) {
                                            %>
                                            <div class="row mb-4 d-flex justify-content-between align-items-center">
                                                <div class="col-md-1 col-lg-1 col-xl-1">
                                                    <h6 class="text-muted">Color</h6>
                                                    <h6 class="text-black mb-0"><%= data.get(i).color%></h6>
                                                </div>
                                                <div class="col-md-1 col-lg-1 col-xl-2">
                                                    <h6 class="text-muted">Cut</h6>
                                                    <h6 class="text-black mb-0"><%= data.get(i).cut%></h6>
                                                </div>
                                                <div class="col-md-1 col-lg-1 col-xl-1">
                                                    <h6 class="text-muted">Purity</h6>
                                                    <h6 class="text-black mb-0"><%= data.get(i).purity%></h6>
                                                </div>
                                                <div class="col-md-1 col-lg-1 col-xl-2">
                                                    <h6 class="text-muted">Weight</h6>
                                                    <h6 class="text-black mb-0"><%= data.get(i).weight%></h6>
                                                </div>
                                                <div class="col-md-1 col-lg-1 col-xl-2">
                                                    <h6 class="text-muted">Certification</h6>
                                                    <h6 class="text-black mb-0"><%= data.get(i).cert%></h6>
                                                </div>
                                                <div class="col-md-1 col-lg-1 col-xl-2 offset-lg-1">
                                                    <h6 class="text-muted">Price</h6>
                                                    <h6 class="mb-0"><%= data.get(i).totalPrice%></h6>
                                                </div>
                                                <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                                    <form action="cart" method="post"><input type="hidden" value="<%= data.get(i).reportNo%>" name="reportNo"/>
                                                        <button class="btn btn-light text-muted" type="submit"><i class="fas fa-times"></i></button>
                                                    </form>
                                                </div>
                                            </div>
                                            <hr class="my-4">
                                            <% }%>

                                            <% if (size == 0) { %>
                                            <div class="mb-4 d-flex justify-content-center align-items-center">
                                                <h2>Cart is empty</h2>
                                            </div>
                                            <% }%>


                                            <div class="pt-5">
                                                <h6 class="mb-0"><a href="buyDiamond" class="text-body"><i
                                                            class="fas fa-long-arrow-alt-left me-2"></i>Let's Buy</a></h6>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 bg-grey">
                                        <div class="p-5">
                                            <h3 class="fw-bold mb-5 mt-2 pt-1">Summary</h3>
                                            <hr class="my-4">

                                            <div class="d-flex justify-content-between mb-4">
                                                <h5 class="text-uppercase">items <%= size%></h5>
                                                <h5 >$<span id="itemPrice"><%= totalamount%></span></h5>
                                            </div>

                                            <h5 class="text-uppercase mb-3">Shipping</h5>

                                            <div class="mb-4 pb-2">
                                                <select class="select" id="deliveryType" onchange="getDeliveryType()">
                                                    <option value="sd">Standard Delivery- $5.00</option>
                                                    <option value="fd">Fast Delivery- $10.00</option>
                                                </select>
                                            </div>

                                            <form action="Purcahse.php" method="POST">
                                                <h5 class="text-uppercase mb-3">Address</h5>

                                                <div class="mb-5">
                                                    <div class="form-outline">
                                                        <input type="text" id="form3Examplea2" name="address"
                                                               class="form-control form-control-lg" required/>
                                                        <label class="form-label" for="form3Examplea2">Enter your
                                                            address</label>
                                                    </div>
                                                </div>

                                                <hr class="my-4">

                                                <div class="d-flex justify-content-between mb-5">
                                                    <h5 class="text-uppercase">Total price</h5>
                                                    <h5 id="totalAmount"></h5>
                                                </div>

                                                <button type="button" class="btn btn-success btn-block btn-lg"
                                                        onclick="purchaseRedirect()"
                                                        data-mdb-ripple-color="dark">Purchase
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <jsp:include page="../Partials/footer.html"/>

        <script>
            let itemPrice = parseInt(document.getElementById("itemPrice").innerHTML);
            let totalAmount = document.getElementById("totalAmount");
            let deliveryType = document.getElementById("deliveryType");

            function getDeliveryType() {
                if (itemPrice == 0) {
                    totalAmount.innerText = 0;
                    return;
                }
                if (deliveryType.value == "sd") {
                    let amount = itemPrice + 5;
                    totalAmount.innerText = amount;
                } else {
                    let amount = itemPrice + 10;
                    totalAmount.innerText = amount;

                }
            }

            getDeliveryType();

        </script>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

    </body>

</html>
