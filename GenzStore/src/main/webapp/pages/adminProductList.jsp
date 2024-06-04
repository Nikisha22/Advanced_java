<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page import="java.util.List" %>
<%@ page import="model.ProductModel" %>
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
      <script>
        function confirmDelete(productId) {
            if (confirm("Are you sure you want to delete this product?")) {
                // Send AJAX request to delete servlet
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "${pageContext.request.contextPath}/DeleteProductServlet?productId=" + productId, true);
                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                xhr.onreadystatechange = function() {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        // Refresh the page after successful deletion
                        window.location.reload();
                    }
                };
                xhr.send();
            }
        }
    </script>
      <style>
        .product-image {
            max-width: 100px; /* Adjust the size as needed */
            max-height: 100px; /* Adjust the size as needed */
        }
        /* Set equal width for each column */
        table th, table td {
            width: 14.28%; /* 100% divided by 7 (number of columns) */
        }
    </style>
</head>
<body>
  <header>
    <div class="logo"> <img src="${pageContext.request.contextPath}/images/logo.png" alt=""><h1>Admin</h1></div>
  </header>
  <div class="sidebar">
    <ul>
      <li><a href="${pageContext.request.contextPath}/AdminProductList" style="text-decoration: none; color: black;">Product</a></li>
      <li><a href="${pageContext.request.contextPath}/AdminOrderServlet" style="text-decoration: none; color: black;">Order</a></li>
      <li><a href="${pageContext.request.contextPath}/SendMessageServlet" style="text-decoration: none; color: black;">Message</a></li>
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
     <div style="display:flex; justify-content:space-between; padding-right:4rem;">
     <div class="product-title" style="font-size:28px; 	font-weight:600;"> Product</div>
     <a href="${pageContext.request.contextPath}/pages/addProduct.jsp" class="btn btn-primary">Add Product</a>
</div>
    <table class="table table-hover">
        <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Name</th>
                <th scope="col">Description</th>
                <th scope="col">Image</th>
                <th scope="col">Price</th>
                <th scope="col">Stock</th>
                <th scope="col">Action</th>
            </tr>
        </thead>
        <tbody>
          <% List<ProductModel> productList = (List<ProductModel>) request.getAttribute("products");
             if (productList != null && !productList.isEmpty()) {
                 for (ProductModel product : productList) { %>
                  <tr>
                      <td><%= product.getProduct_id() %></td>
                      <td><%= product.getProduct_name() %></td>
                      <td><%= product.getProduct_description() %></td>
                      <td><img src="<%= product.getProduct_image() %>" alt="Product Image" class="product-image" /></td>
                      <td><%= product.getProduct_price() %></td>
                      <td><%= product.getProduct_stock() %></td>
                      <td>
            <a href="${pageContext.request.contextPath}/pages/updateProduct.jsp?productId=<%= product.getProduct_id() %>" class="btn btn-primary">Edit</a>
                          <a href="#" class="btn btn-danger" onclick="confirmDelete(<%= product.getProduct_id() %>)">Delete</a>
                      </td>
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
