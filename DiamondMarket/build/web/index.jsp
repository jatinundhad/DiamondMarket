<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Welcome to the Diamond Market!</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">



        <link rel="stylesheet" href="./css/scrollbar.css"/>
    </head>
    <body>
        <!-- Navigation Bar -->
        <jsp:include page="./Partials/navbar.jsp" />
        <!-- Carousel -->
        <jsp:include page="./home/corousel.jsp" />
        <!--about us-->
        <jsp:include page="./home/aboutUs.jsp" />
        <!--Module Links-->
        <jsp:include page="./home/module_cards.jsp" />
        <!--footer-->
        <jsp:include page="./Partials/footer.html"/>
    </body>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  
    
    
</html>