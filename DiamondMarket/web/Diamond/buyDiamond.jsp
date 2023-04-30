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

        <form action="#" method="POST">
            <div class="container-xxl border rounded-8 my-5">
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

                <div class="container-fluid mt-5">
                    <div class="row">
                        <div class="col-lg-6">
                            <label class="">Show&nbsp;
                                <select class="browser-default custom-select" id="entries" onchange="getEntriesPerPage(this)">
                                    <option value="10">10</option>
                                    <option value="25">25</option>
                                    <option value="50">50</option>
                                    <option value="100">100</option>
                                </select>
                                &nbsp;records per page
                            </label>

                            <script>
//                                function getEntriesPerPage(entryNumber) {
//                                    const entries = entryNumber.value;
//                                    const currentURL = document.URL;
//
//                                    if (!currentURL.includes('entries'))
//                                        location.replace(currentURL + '?entries=' + entries);
//                                    else {
//                                        const url = new URL(document.URL);
//                                        const search_params = url.searchParams;
//
//                                        search_params.set('entries', entries);
//                                        url.search = search_params.toString();
//                                        const new_url = url.toString();
//
//                                        location.replace(new_url);
//                                    }
//                                }
                            </script>


                            <div class="col-lg-6 d-flex justify-content-end">
                                <nav aria-label="Page navigation example" class="justify-content-end">
                                    <ul class="pagination">
                                        <li class="page-item">
                                            <a class="page-link" href="">Previous</a>
                                        </li>

                                        <li class="page-item">
                                            <a class="page-link" href="">1</a>
                                        </li>
                                        <li class="page-item">
                                            <a class="page-link" href="">Next</a>
                                        </li>

                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="container-xxl rounded-8">
                    <button class="btn btn-dark" type="submit" value="add2Cart" name="add2Cart">Add to Cart</button>
                    &emsp;&emsp;
                </div>
            </div>
        </form>

        <jsp:include page="../Partials/footer.html"/>


    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"></script>

</html>