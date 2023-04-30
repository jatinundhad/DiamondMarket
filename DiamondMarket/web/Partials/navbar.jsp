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

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <button
            class="navbar-toggler"
            type="button"
            data-mdb-toggle="collapse"
            data-mdb-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
            >
            <i class="fas fa-bars"></i>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <a class="navbar-brand mt-2 mt-lg-0" href="/DiamondMarket">
                B2B Diamond Market
            </a>
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="#aboutUs">About Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="sellDiamond">Sell Diamonds</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="buyDiamond">Buy Diamonds</a>
                </li>
            </ul>


            <%
                if (session != null && session.getAttribute("loggedIn") == null) {
            %>
            <div>
                <a class="btn btn-primary me-1 mb-1" href="Register">Register</a>
                <a class="btn btn-secondary me-2 mb-1" href="Login">Login</a>
            </div>
            <%
                }
            %>

        </div>



        <%
            if (session != null && session.getAttribute("loggedIn") != null && (Boolean) session.getAttribute("loggedIn")) {
        %>
        <div>
            <a type="button" class="btn btn-outline-dark me-2" href="cart">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                    <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"></path>
                </svg>
            </a>
        </div>
        <% }%>

        <div class="dropdown">
            <a
                class="dropdown-toggle d-flex align-items-center hidden-arrow"
                href="#"
                id="navbarDropdownMenuAvatar"
                role="button"
                data-mdb-toggle="dropdown"
                aria-expanded="false"
                >

                <%
                    if (session != null && session.getAttribute("loggedIn") != null && (Boolean) session.getAttribute("loggedIn")) {
                %>
                <img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="rounded-circle m-1" height="35" alt="Black and White Portrait of a Man" loading="lazy"/>
                <h5 class="mt-2"><%= session.getAttribute("companyId")%></h5>
                <% }%>

            </a>
            <ul
                class="dropdown-menu dropdown-menu-end"
                aria-labelledby="navbarDropdownMenuAvatar"
                >
                <li>
                    <a class="dropdown-item" href="Profile">My profile</a>
                </li>
                <li>
                    <a class="dropdown-item" href="Logout">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</div>
</nav>


<script
    type="text/javascript"
    src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"
></script>