<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>

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
        
        
        <jsp:include page="../Partials/navbar.jsp" />
        <p>Company ID :  <%= request.getParameter("comapanyId")%> </p>
        <p>Company Name : <%= request.getParameter("companyname")%> </p>
        <p>Email ID : <%= request.getParameter("email")%> </p>
        <p>Contact Info  <%= request.getParameter("contact")%> </p>
        <p>Password : <%= request.getParameter("password")%> </p>
    </body>

    <script
        type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"
    ></script>
</html>
