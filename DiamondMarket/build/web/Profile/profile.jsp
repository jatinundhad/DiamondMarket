<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="Database.Database"%>
<%@page import="Diamond.Diamond"%>
<%@page import="java.util.Vector"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Profile</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
    </head>
    <body>
        <jsp:include page="../Partials/navbar.jsp" />
        <%
            String companyId = (String) session.getAttribute("companyId");
            String companyName = "", email = "", mobileno = "";

            Database db = new Database();
            db.connect();

            String query = "SELECT * FROM `user_credentials` WHERE `company_id`='" + companyId + "'";
            ResultSet rs;

            try {
                db.stmt = db.con.createStatement();
                rs = db.stmt.executeQuery(query);
                rs.next();

                companyName = rs.getString("company_name");
                email = rs.getString("email");
                mobileno = rs.getString("mobile_number");

            } catch (Exception error) {
                out.println(error);
            }

            int srno = 1;
            Vector<Diamond> sellOrders = new Vector<>();
            query = "SELECT * FROM `buyer_list` WHERE `company_id`='" + companyId + "' and `is_sold`=0";
            try {
                rs = db.stmt.executeQuery(query);

                while (rs.next()) {
                    Diamond dm = new Diamond(rs);
                    sellOrders.add(dm);
                }

            } catch (Exception error) {
                out.println(error);
            }

            Vector<Diamond> BuyOrders = new Vector<>();
            query = "SELECT * FROM `buyer_list` WHERE `buyer_id`='" + companyId + "'";
            try {
                rs = db.stmt.executeQuery(query);

                while (rs.next()) {
                    Diamond dm = new Diamond(rs);
                    BuyOrders.add(dm);
                }

            } catch (Exception error) {
                out.println(error);
            }

            Vector<Diamond> SoldOrders = new Vector<>();
            query = "SELECT * FROM `buyer_list` WHERE `company_id`='" + companyId + "' and `is_sold`=1";
            try {
                rs = db.stmt.executeQuery(query);

                while (rs.next()) {
                    Diamond dm = new Diamond(rs);
                    SoldOrders.add(dm);
                }

            } catch (Exception error) {
                out.println(error);
            }

        %>

        <section style="background-color: #eee;">
            <div class="container pt-5">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="card">
                            <div class="card-body text-center">
                                <h2 class="mt-1"><%= companyId%></h2>
                                <h5 class="text-muted mb-4">Diamond Dealer</h5>
                                <div class="mb-2 d-flex justify-content-center">
                                    <div><span  class="badge badge-danger m-1 fs-6"> Live on Sell <%= sellOrders.size() %></span></div>
                                     <div><span  class="badge badge-warning m-1 fs-6">Buyings <%= BuyOrders.size() %></span></div>
                                     <div><span  class="badge badge-success m-1 fs-6">Sold Diamonds <%= SoldOrders.size() %></span></div>
                                    </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Company Name</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0"><%= companyName%></p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Email</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0"><%= email%></p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Phone</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0"><%= mobileno%></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="container pt-5">
                    <% if (sellOrders.size() > 0) { %>
                    <div class="table table-responsive">
                        <h2 class="ms-2 mb-3">Currently in Sale</h2>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">SR No.</th>
                                    <th scope="col">Report No.</th>
                                    <th scope="col">Color</th>
                                    <th scope="col">Purity</th>
                                    <th scope="col">Cut</th>
                                    <th scope="col">Weight</th>
                                    <th scope="col">Table</th>
                                    <th scope="col">Depther</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Remove</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (Diamond dm : sellOrders) {
                                %>
                                <tr>
                                    <td><%= srno%></td>
                                    <td><%= dm.reportNo%></td>
                                    <td><%= dm.color%></td>
                                    <td><%= dm.purity%></td>
                                    <td><%= dm.cut%></td>
                                    <td><%= dm.weight%></td>
                                    <td><%= dm.table%></td>
                                    <td><%= dm.depther%></td>
                                    <td><%= dm.totalPrice%></td>
                                    <td><button class="btn btn-danger">Remove</button></td>
                                </tr>
                                <% srno++;
                                    }%>
                            </tbody>
                        </table>
                    </div>
                    <% }%>
                    <% if (BuyOrders.size() > 0) { %>
                    <div class="table table-responsive">
                        <h2 class="ms-2 mb-3">Buyings</h2>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">SR No.</th>
                                    <th scope="col">Report No.</th>
                                    <th scope="col">Color</th>
                                    <th scope="col">Purity</th>
                                    <th scope="col">Cut</th>
                                    <th scope="col">Weight</th>
                                    <th scope="col">Table</th>
                                    <th scope="col">Depther</th>
                                    <th scope="col">Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%  srno = 1;
                                    for (Diamond dm : BuyOrders) {
                                %>
                                <tr>
                                    <td><%= srno%></td>
                                    <td><%= dm.reportNo%></td>
                                    <td><%= dm.color%></td>
                                    <td><%= dm.purity%></td>
                                    <td><%= dm.cut%></td>
                                    <td><%= dm.weight%></td>
                                    <td><%= dm.table%></td>
                                    <td><%= dm.depther%></td>
                                    <td><%= dm.totalPrice%></td>
                                </tr>
                                <% srno++;
                                    }%>
                            </tbody>
                        </table>
                    </div>
                    <% }%>
                    <% if (SoldOrders.size() > 0) { %>
                    <div class="table table-responsive">
                        <h2 class="ms-2 mb-3">Sold Orders</h2>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">SR No.</th>
                                    <th scope="col">Report No.</th>
                                    <th scope="col">Color</th>
                                    <th scope="col">Purity</th>
                                    <th scope="col">Cut</th>
                                    <th scope="col">Weight</th>
                                    <th scope="col">Table</th>
                                    <th scope="col">Depther</th>
                                    <th scope="col">Price</th>
                                    <td>Status</td>

                                </tr>
                            </thead>
                            <tbody>
                                <%  srno = 1;
                                    for (Diamond dm : SoldOrders) {
                                %>
                                <tr>
                                    <td><%= srno%></td>
                                    <td><%= dm.reportNo%></td>
                                    <td><%= dm.color%></td>
                                    <td><%= dm.purity%></td>
                                    <td><%= dm.cut%></td>
                                    <td><%= dm.weight%></td>
                                    <td><%= dm.table%></td>
                                    <td><%= dm.depther%></td>
                                    <td><%= dm.totalPrice%></td>
                                    <td > <span class="badge badge-success">Sold Out</span></td>
                                </tr>
                                <% srno++;
                                    }%>
                            </tbody>
                        </table>
                    </div>
                    <% }%>
                </div>
                <jsp:include page="../Partials/footer.html" />
        </section>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</html>