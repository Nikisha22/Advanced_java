<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</head>
<body>
  <header>
    <div class="logo"> <img src="${pageContext.request.contextPath}/images/logo.png" alt=""><h1>Admin</h1></div>
  </header>
  <div class="sidebar">
    <ul>
      <li><a href="${pageContext.request.contextPath}/AdminProductList">Product</a></li>
      <li><a href="${pageContext.request.contextPath}/AdminOrderServlet">Order</a></li>
      <li><a href="${pageContext.request.contextPath}/pages/Message.jsp">Message</a></li>
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
    <h2>Welcome to GenZStore</h2>
    <h2 class="admin">Admin</h2>
  </div>
</body>
</html>
