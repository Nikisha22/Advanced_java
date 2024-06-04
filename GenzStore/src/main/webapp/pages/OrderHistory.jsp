<%@ page import="java.util.List" %>
<%@ page import="model.OrderModel" %>
<%@ page import="controller.DatabaseController" %>
<%@ page import="utils.StringUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
</head>
<body style="background-color: rgb(189, 189, 189);">
 <%
        String username = request.getParameter("username");
        List<OrderModel> orderList = new DatabaseController().getOrderHistoryByUsername(username);
        request.setAttribute("orderList", orderList);
    %>
    <div class="profile" style="display: flex; align-items: center;">
        <a class="arrow" href="${pageContext.request.contextPath}/ProfileServlet">
            <i class="fa-solid fa-arrow-left" style="color: black; font-size: 2rem; padding:3rem ;"></i>
        </a>
        <h1 class="profile-heading">Order History</h1>

    </div>
    <table class="table table-hover" style="margin: 0 12rem; width: 40rem;">
        <thead style="margin-right: 12rem;">
          <tr>
            <th scope="col">Product Name</th>
            <th scope="col">Quantity</th>
            <th scope="col">Price</th>
            <th scope="col">Status</th>
          </tr>
        </thead>
        <tbody>
        
            <% if (orderList != null && !orderList.isEmpty()) { %>
                <% for (OrderModel order : orderList) { %>
                    <tr>
                        <td><%= order.getProduct_name() %></td>
                        <td><%= order.getQuantity() %></td>
                        <td><%= order.getTotalAmount() %></td>
                        <td style="color: <%= order.isOrder_Status() ? "green" : "red" %>;"><%= order.isOrder_Status() ? "Delivered" : "Arrive Soon" %></td>
            
                    </tr>
                <% } %>
            <% } else { %>
                <tr>
                    <td colspan="4">No orders available</td>
                </tr>
            <% } %>
        </tbody>
      </table>
</body>
</html>