<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="model.OrderModel" %>

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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Page</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/AdminHome.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
<header>
    <div class="logo">
        <img src="${pageContext.request.contextPath}/images/logo.png" alt="">
        <h1>Admin</h1>
    </div>
</header>
<div class="sidebar">
    <ul>
        <li><a href="${pageContext.request.contextPath}/AdminProductList" style="text-decoration: none; color: black;">Product</a></li>
        <li><a href="${pageContext.request.contextPath}/AdminOrderServlet" style="text-decoration: none; color: black;">Order</a></li>
        <li><a href="${pageContext.request.contextPath}/pages/Message.jsp" style="text-decoration: none; color: black;">Message</a></li>
    </ul>
    <div class="logout-btn">
        <% if (cookieUsername != null) { %>
        <form class="login" action="${pageContext.request.contextPath}/LogoutServlet" method="post">
            <button class="logout-btn-danger" type="submit" style="border:none; background:#d9534f; color:white; font-size:20px" >Logout</button>
        </form>
        <% } %>
    </div>
</div>
<div class="main-content">
    <div class="product-title" style="font-size:28px; font-weight:600;"> Orders</div>
    <table class="table table-hover">
        <thead>
            <tr>
                <th scope="col">Order ID</th>
                <th scope="col">Customer Name</th>
                <th scope="col">Quantity</th>
                <th scope="col">Price</th>
                <th scope="col">Status</th>
            </tr>
        </thead>
       <tbody>
    <% List<OrderModel> orderList = (List<OrderModel>) request.getAttribute("orders");
    if (orderList != null && !orderList.isEmpty()) {
        for (OrderModel order : orderList) { %>
    <tr>
        <form action="${pageContext.request.contextPath}/UpdateOrderStatusServlet" method="post">
            <td><%= order.getOrder_Id() %></td>
            <td><%= order.getUser_name() %></td>
            <td><%= order.getQuantity()%></td>
            <td><%= order.getTotalAmount()%></td>
            <td style="color: <%= order.isOrder_Status() ? "green" : "red" %>;"><%= order.isOrder_Status() ? "Delivered" : "Pending" %></td>
            <input type="hidden" name="orderId" value="<%= order.getOrder_Id() %>">
            <td><button type="submit" name="updateStatusBtn" class="btn btn-primary">Update Status</button></td>
        </form>
    </tr>
    <% }
    } else { %>
    <tr>
        <td colspan="7">No products available</td>
    </tr>
    <% } %>
</tbody>

    </table>
</div>
</body>
</html>
