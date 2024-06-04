<%
    String cookieUsername = null;
    Cookie[] cookies = request.getCookies();
    
    if(cookies != null) {
        for (Cookie cookie: cookies) {
            if (cookie.getName().equals("user")) cookieUsername = cookie.getValue();
        }
    }
    HttpSession userSession = request.getSession();
    Integer notificationCount = (Integer) userSession.getAttribute("notificationCount"); // Retrieve notification count from session
    if (notificationCount == null) {
        notificationCount = 0; // Initialize notification count if not found in session
    }
%>

<header style="box-shadow: 3px 3px .6em  rgb(215, 213, 213), -0.7em 0 .6em rgb(233, 233, 233);">
    <img src="${pageContext.request.contextPath}/images/logo.png" class="logo" alt="desktop" />
    <ul>
        <li class="nav-item">
            <a class="nav-link active" aria-current="page"
               href="${pageContext.request.contextPath}/pages/Home.jsp">Home</a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" aria-current="page"
               href="${pageContext.request.contextPath}/ProductServlet">Product</a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" aria-current="page"
               href="${pageContext.request.contextPath}/pages/Aboutus.jsp">About Us</a>
        </li>
     
    </ul>
    <div class="icons">
        <div class="search-icon search" style="background-color:#EDE4FF; width:15rem;">
        <i class="fa-solid fa-magnifying-glass"></i>
        <form action="${pageContext.request.contextPath}/SearchProductUser" method="post" id="searchForm" >
            <input
                type="text"
                name="searchQuery"
                class="search-text"
                placeholder="Search monitor"
                id="searchInput"
                style="background-color:#EDE4FF; width:10rem;"
            />
        </form>
    </div>
       <!-- Cart Icon -->
<a href="${pageContext.request.contextPath}/AddToCartServlet" id="cart-link" style="position: relative;"> 
    <i class="fa-solid fa-cart-shopping"></i>
</a>

<!-- Bootstrap alert message for Cart -->
<div id="cart-alert" class="alert alert-danger" role="alert" style="display: none; position: absolute; z-index: 100; right: 0%; top: 7%;">
    You need to log in to view your cart.
</div>


<!-- Bootstrap alert message for Profile -->
<div id="profile-alert" class="alert alert-danger" role="alert" style="display: none; position: absolute; z-index: 100; right: 0%; top: 7%;">
    You need to login to access your profile.
</div>

<script>
    // Get the cart link element
    var cartLink = document.getElementById('cart-link');
    
    // Get the cart alert element
    var cartAlert = document.getElementById('cart-alert');
    
    // Add a click event listener to the cart link
    cartLink.addEventListener('click', function(event) {
        // Check if the user is not logged in
        if (<%= session.getAttribute("user") == null %>) {
            // Prevent the default link behavior
            event.preventDefault();
            
            // Show the cart alert
            cartAlert.style.display = 'block';
            
            // Set a timeout to hide the alert after 3 seconds
            setTimeout(function() {
                cartAlert.style.display = 'none';
            }, 3000);
        }
    });
    
    // Get the profile link element
    var profileLink = document.getElementById('profile-link');
    
    // Get the profile alert element
    var profileAlert = document.getElementById('profile-alert');
    
    // Add a click event listener to the profile link
    profileLink.addEventListener('click', function(event) {
        // Check if the user is not logged in
        if (<%= session.getAttribute("user") == null %>) {
            // Prevent the default link behavior
            event.preventDefault();
            
            // Show the profile alert
            profileAlert.style.display = 'block';
            
            // Set a timeout to hide the alert after 3 seconds
            setTimeout(function() {
                profileAlert.style.display = 'none';
            }, 3000);
        }
    });
</script>

        <div class="logins" style=" display:flex; ">
            <% if (cookieUsername != null) { %>
            <a href="${pageContext.request.contextPath}/ProfileServlet" id="profile-link" style="position: relative; padding-top:18px; "> 
    <i class="fa-solid fa-circle-user"></i>
</a>
                <form class="login" style="margin-left: 1rem;" action="${pageContext.request.contextPath}/LogoutServlet" method="post">
                    <button type="submit">Logout</button>
                </form>
                <!-- Profile Icon -->

                
            <% } else { %>
                <a class="login-btn" href="${pageContext.request.contextPath}/pages/Login.jsp">Login</a>
            <% } %>
        </div>
    </div>
</header>
<script>
    // Get the search input element
    var searchInput = document.getElementById('searchInput');

    // Add a keyup event listener to the search input
    searchInput.addEventListener('keyup', function(event) {
        // Check if the key pressed is 'Enter'
        if (event.key === 'Enter') {
            // Submit the form
            document.getElementById('searchForm').submit();
        }
    });
</script>