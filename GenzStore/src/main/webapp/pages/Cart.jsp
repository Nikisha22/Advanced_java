<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.CartModel" %>
<%@ page import="model.ProductModel" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/Cart.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/Header.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/Footer.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Shopping Cart</title>
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>
<h1 style="margin-left:12rem;">CART</h1>
<div class="main">
    <div class="list">
        <% List<CartModel> cartList = (List<CartModel>) request.getAttribute("cart");
           if (cartList != null && !cartList.isEmpty()) {
               double totalAmount = 0.0; // Initialize total amount
               for (CartModel cart: cartList) {
                   ProductModel product = cart.getProductModel();
                   double productTotal = product.getProduct_price() * cart.getQuantity(); // Calculate product total
                   totalAmount += productTotal; // Add product total to total amount
        %>
        <div class="container">
            <img src="<%= product.getProduct_image()%>" alt="<%= product.getProduct_name()%>">
            <div class="details">
                <h1 class="inner"><%= product.getProduct_name()%></h1>
                <p style="width: 18rem;"><%= product.getProduct_description()%></p>
                <h2 style="color: #FF833D;">Rs. <%= productTotal %></h2> <!-- Display product total -->
            </div>
            <div class="quantity">
                <h1 class="inner">Quantity</h1>
                <div class="box">
                    <%= cart.getQuantity() %>
                </div>
            </div>
            <div class="button">
                <form action="${pageContext.request.contextPath}/DeleteCartServlet" method="post">
                    <input type="hidden" name="cartItemId" value="<%= cart.getCart_Id()%>">
                    <input type="hidden" name="action" value="delete"> <!-- Action to indicate deletion -->
                    <button class="remove" style="padding: 1.2rem 1.4rem;"><i class="fa-solid fa-trash-can"></i></button>
                </form>
            </div>
        </div>
        <% } %>
    </div>
    <div class="total">
        <div class="amount">
            <h1>Total Amount</h1>
            <h2>Rs. <%= totalAmount %></h2> <!-- Display total amount -->
        </div>
        <form action="${pageContext.request.contextPath}/OrderServlet" method="post">
            <% for (CartModel cart: cartList) { %>
                <input type="hidden" name="product_name" value="<%= cart.getProductModel().getProduct_name()%>">
                <input type="hidden" name="quantity" value="<%= cart.getQuantity() %>">
                <input type="hidden" name="cart_Id" value="<%= cart.getCart_Id()%>">
                 <input type="hidden" name="Status" value="Pending" style="color:green;">
                <input type="hidden" name="total_Amount" value="<%= cart.getProductModel().getProduct_price() * cart.getQuantity()%>">
            <% } %>
            <button type="submit" class="buy2">Check Out</button>
        </form>
    </div>
    <% } else { %>
        <p>No products available</p>
    <% } %>
</div>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
