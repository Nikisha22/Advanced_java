<%@page import="model.ProductModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product</title>
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/SingleProduct.css">
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
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"
    ></script>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
      rel="stylesheet"
    />
</head>
<body style="margin-button:12rem">
    <%-- Include your header if needed --%>
    <%@ include file="Header.jsp" %>
 <h1 style="margin-left:14rem;">Product Details</h1>
  <div class="container">
    <c:choose>
			    <c:when test="${empty product}">
			        <p>No data available</p>
			    </c:when>
			    <c:otherwise>  
        <div class="product-image">
            <img src="${product.product_image == null ? 'null' : product.product_image}" style="height:20vh; width:100%;" alt="Product Image">
        </div>
        <div class="product-details">
            <h1 class="product-name"> ${product.product_name == null ? 'null' : product.product_name}</h1>
            <p class="product-price orange"> ${product.product_price == null ? 'null' : product.product_price}</p>
            <p class="product-description">
                ${product.product_description == null ? 'null' : product.product_description}
            </p>
           
       <div class="product-btn">
                        <form action="${pageContext.request.contextPath}/AddToCartServlet" method="post"> 
		                   <div class="quantity">
		                        <div class="plus"><i class="fa-solid fa-plus"></i></div>
		                        <input type="number" class="one" name="quantity" value="1" min="1"> <!-- Changed div to input -->
		                        <div class="minus"><i class="fa-solid fa-minus"></i></div>
		                    </div><!-- Change the action URL to your servlet -->
                            <input type="hidden" name="productId" value="${product.getProduct_id()}">
                            <button type="submit" class="button">Add To Cart</button>
                        </form>
                    </div>
        </div>
        	    </c:otherwise>
			</c:choose>
    </div>
   </body>
   <script>
  		document.addEventListener("DOMContentLoaded", function() {
    const plusButton = document.querySelector(".plus");
    const minusButton = document.querySelector(".minus");
    const quantityDisplay = document.querySelector(".quantity .one");

    let quantity = 1; // Initial quantity

    // Function to update quantity display
    const updateQuantityDisplay = () => {
      quantityDisplay.textContent = quantity;
    };

    // Event listener for plus button
    plusButton.addEventListener("click", function() {
      quantity++;
      updateQuantityDisplay();
    });

    // Event listener for minus button
    minusButton.addEventListener("click", function() {
      if (quantity > 1) {
        quantity--;
        updateQuantityDisplay();
      }
    });
  });
</script>
    <%@ include file="Footer.jsp" %>
</html>
