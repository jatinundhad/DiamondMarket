<%@ page import="Diamond.Diamond" %>
<%@ page import="java.util.Vector" %>
<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Buy it today!</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" rel="stylesheet"/>
    </head>

    <body>

        <jsp:include page="../Partials/navbar.jsp" />

        <% if(request.getAttribute("notification") != null) { %>
        <h4 class=" text-center py-2"style="background-color: lightgreen"><%= request.getAttribute("notification") %></h4>
        <% } %>
        <form action="addToCart" method="POST">
            <div class="container-xxl border rounded-8 my-5 py-3">
                <table id="dataTable" class="display table" style="width:100%">
                    <thead>
                        <tr>
                            <th>
                                <div></div>
                            </th>
                            <th>Report No</th>
                            <th>Company ID</th>
                            <th>Color</th>
                            <th>Purity</th>
                            <th>Cut</th>
                            <th>Weight</th>
                            <th>Depth</th>
                            <th>Table</th>
                            <th>Price/C</th>
                            <th>Total Price</th>
                            <th>RAP/C</th>
                            <th>Total RAP</th>
                            <th>Certification</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                           
                            Vector<Diamond> data = (Vector<Diamond>) request.getAttribute("data");
                            
                            if(data != null){
                            for (Diamond dm : data) {
                        %>
                        <tr>
                            <td scope="row">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="checkRecord" name="checkRecord[]"
                                           value="<%= dm.reportNo%>" >
                                    <label class="custom-control-label" for="checkRecord"></label>
                                </div>
                            </td>
                            <td><%= dm.reportNo%></td>
                            <td><%= dm.companyId%></td>
                            <td><%= dm.color%></td>
                            <td><%= dm.purity%></td>
                            <td><%= dm.cut%></td>
                            <td><%= dm.weight%></td>
                            <td><%= dm.depther%></td>
                            <td><%= dm.table%></td>
                            <td><%= dm.pricePerCarat%></td>
                            <td><%= dm.totalPrice%></td>
                            <td><%= dm.rapPricePerCarat%></td>
                            <td><%= dm.totalRapPrice%></td>
                            <td><%= dm.cert%></td>
                        </tr>
                        <% }} %>
                    </tbody>
                </table>
                <div class="container-xxl rounded-8">
                    <button class="btn btn-dark" type="submit" value="add2Cart" name="add2Cart">Add to Cart</button>
                </div>
            </div>
        </form>

        <jsp:include page="../Partials/footer.html"/>


    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</html>