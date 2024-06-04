<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    HttpSession userSession = request.getSession();
    String userName = (String) userSession.getAttribute("username");
    Integer notificationCount = (Integer) userSession.getAttribute("notificationCount");
    if (notificationCount == null) {
        notificationCount = 0;
    }
%>
<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Home Page</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/Homes.css">
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/Header.css">
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/Footer.css">
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
      integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"/>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"/>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1N7N6jIeHz"
      crossorigin="anonymous"
    ></script>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
      rel="stylesheet"
    />
    <link rel="icon" href="assets/logo.png" />
  </head>
  
  <body>
  <jsp:include page="Header.jsp"></jsp:include>

  
    <div class="main">
   
      <!-- banner start--------------------------------------------------------------------------------- -->
      <div class="banner">
        <div class="main-text">
          <p class="first">Get the</p>
          <p class="second">Best MONITOR</p>
          <!-- Search -->
          <div class="search">
            <i class="fa-solid fa-magnifying-glass"></i>
            <form action="${pageContext.request.contextPath}/SearchProductUser" method="post" id="searchForm">
            <input
                type="text"
                name="searchQuery"
                class="search-text"
                placeholder="Search monitor"
                id="searchInput"
                style="background:white;"
            />
        </form>
          </div>
        </div>
        <div class="photo">
          <img src="${pageContext.request.contextPath}/images/desktop.png" alt="desktop" class="desktop" alt="desktop image" />
          <img src="${pageContext.request.contextPath}/images/butterfly.png" alt="butterfly" class="butterfly" alt="butterfly" />
        </div>
      </div>
      <!-- Banner end--------------------------------------------------------------------------------- -->

      <!-- Categories start ----------------------------------------------------------------------------->
      <div class="categories">
        <h1>Brand</h1>
        <div class="cards">
          <div class="categories-card apple">
            <div class="d">
              <img src="${pageContext.request.contextPath}/images/apple.png" alt="brand logo" />
              <p>Apple</p>
            </div>
          </div>
          <div class="categories-card apple">
            <div class="d">
            <img src="${pageContext.request.contextPath}/images/mi.png" alt="brand logo" />
              <p>MI</p>
            </div>
          </div>
          <div class="categories-card apple">
            <div class="d">
            <img src="${pageContext.request.contextPath}/images/dell.png" alt="brand logo" />
           
              <p>Dell</p>
            </div>
          </div>
          <div class="categories-card apple">
            <div class="d">
            <img src="${pageContext.request.contextPath}/images/red.png" alt="brand logo" />
             
              <p>Red Dragon</p>
            </div>
          </div>
        </div>
      </div>

      <!-- two seperation -->

      <div class="multiple">
        <div class="firstone">
          <div class="detail">
            <p class="p1">Dell 27" LED Monitor</p>
            <p>Just Starting At Rs. 28500</p>
            <div class="btn">
              <button type="button" class="button">Shop Now</button>
            </div>
          </div>
	<img src="${pageContext.request.contextPath}/images/desktop1.png" alt="desktop" class="desk-img" />
        </div>
        <div class="firstone">
          <div class="detail">
            <p class="p1">Mi 23.8" Monitor</p>
            <p>Just Starting At Rs. 19000</p>
            <div class="btn">
              <button type="button" class="button">Shop Now</button>
            </div>
          </div>
<img src="${pageContext.request.contextPath}/images/desktop2.png" alt="desktop" class="desk-img" />
       </div>
      </div>
      <!-- two seperation end ----------------------------------------------------------------------------------->

      <!-- Product start ---------------------------------------------------------------------------------------->
      <div class="product-name">
        <p class="prod-1">Product</p>
        <p class="pro2">
          View all Product <i class="fa-solid fa-arrow-right"></i>
        </p>
      </div>
      <div class="product">
        <!-- 1 -->
        <div class="product-list">
         <img src="${pageContext.request.contextPath}/images/desktop2.png" alt=""/>
          <p class="p1">Xiaomi Civi 4 Pro</p>
          <p class="p1 p2">Rs. 19000</p>
          <p class="p3">Lorem ipsum dolor sit amet consectetur adipisicing elit.
             Ipsum culpa eum libero</p>
          <!-- <div class="quantity">
            <div class="plus"><i class="fa-solid fa-plus"></i></div>
            <div class="one">1</div>
            <div class="minus"><i class="fa-solid fa-minus"></i></div>
          </div> -->

          <!-- <div class="product-btn">
            <button type="button" class="button">Add To Cart</button>
  </div> -->
        </div>
        <div class="product-list">
         <img src="${pageContext.request.contextPath}/images/desktop2.png" alt=""/>
          <p class="p1">Xiaomi Civi 4 Pro</p>
          <p class="p1 p2">Rs. 19000</p>
          <p class="p3">Lorem ipsum dolor sit amet consectetur adipisicing elit.
             Ipsum culpa eum libero</p>
          <!-- <div class="quantity">
            <div class="plus"><i class="fa-solid fa-plus"></i></div>
            <div class="one">1</div>
            <div class="minus"><i class="fa-solid fa-minus"></i></div>
          </div> -->



          <!-- <div class="product-btn">
            <button type="button" class="button">Add To Cart</button>
  </div> -->

        </div>
        <!-- 3 -->
        <div class="product-list">
          <img src="${pageContext.request.contextPath}/images/desktop2.png" alt=""/>
          <p class="p1">Xiaomi Civi 4 Pro</p>
          <p class="p1 p2">Rs. 19000</p>
          <p class="p3">Lorem ipsum dolor sit amet consectetur adipisicing elit.
             Ipsum culpa eum libero</p>
          <!-- <div class="quantity">
            <div class="plus"><i class="fa-solid fa-plus"></i></div>
            <div class="one">1</div>
            <div class="minus"><i class="fa-solid fa-minus"></i></div>
          </div> -->



          <!-- <div class="product-btn">
            <button type="button" class="button">Add To Cart</button>
  </div> -->

        </div>
        <!-- 4 -->
        <div class="product-list">
         <img src="${pageContext.request.contextPath}/images/desktop2.png" alt=""/>
          <p class="p1">Xiaomi Civi 4 Pro</p>
          <p class="p1 p2">Rs. 19000</p>
          <p class="p3">Lorem ipsum dolor sit amet consectetur adipisicing elit.
             Ipsum culpa eum libero</p>

        </div>
</div>
</div>
    <div class="second-buttom">
      <div class="content">
      <div class="second-text">
          <p class="up">Up To <p class="orange">25%</p> </p>
              <p>Discount</p>
                <br>
            <p class="check"> Check it Out</p>
         <br>

         <p class="hurry">Hurry Up !</p>
         <br>
   
          <button type="button" class="button">Shop Now</button>
      
      </div>
      <img src="${pageContext.request.contextPath}/images/buttom-img.png" alt="mac" class="but-img" />
      

    </div>
    </div>
   
  </body>
  <jsp:include page="Footer.jsp"></jsp:include>
</html>
