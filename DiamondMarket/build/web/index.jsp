<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Welcome to the Diamond Market!</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="CSS/IndexStyle.css" rel="stylesheet" type="text/css">
</head>
<body>
<!-- Navigation Bar -->
<jsp:include page="./Partials/navbar.jsp" />
<!-- Carousel -->
<jsp:include page="./home/corousel.jsp" />
<!--Module Links-->
<jsp:include page="./home/module_cards.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>