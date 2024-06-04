<%@page import="model.ProductModel"%>
<%@page import="utils.StringUtils"%>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/Product.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/Header.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/Footer.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheets/product.css">
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>
 
<div class="main">
    <h1 class="title">All Product</h1>

    <div class="product" style="margin-left:6rem;">
        <% List<ProductModel> productList = (List<ProductModel>) request.getAttribute("products");
           if (productList != null && !productList.isEmpty()) {
               for (ProductModel product : productList) { %>
                    <a href="${pageContext.request.contextPath}/SingleServlet?id=<%= product.getProduct_id()%>" style="text-decoration:none;">
                        <div class="product-list">
                            <img src="<%= product.getProduct_image() %>" alt="Product Image" style="height:auto; width:70%; margin: 1.4rem 0 0 2rem;" />
                            <div class="details" style="padding-top:4rem;">
                                <p class="p1" style="color:black;"><%= product.getProduct_name() %></p>
                                <p class="p1 p2">Rs. <%= product.getProduct_price() %></p>
                                <p class="p3" style="color:black;"><%= product.getProduct_description() %></p>
                            </div>
                        </div>
                    </a>
        <% } 
           } else { %>
               <p>No products available</p>
        <% } %>
    </div>
</div>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
