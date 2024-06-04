<%@page import="utils.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/Login.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"> <!-- Font Awesome for icons -->
</head>
<body>
    <div class="container">
        <div class="right-side">
            <div class="purple-shapes">
                <div class="shape shape1"></div>
                <div class="shape shape2"></div>
               
            </div>
            <div class="shape shape3"></div>
            
            <img src="${pageContext.request.contextPath}/images/img.png" alt="Logos">
        </div>
        <div class="left-side">
            <div class="form-container">
                <h2>Welcome Back</h2>
                <h3>Login to your account</h3>
                <form action="${pageContext.request.contextPath}/LoginServlet" method="post">
	                <input type="text" id="username" name="username" placeholder="Username">
	                <input type="password" id="password" name="password" placeholder="Password">
	                
	                <button>Login</button>
	                <p>Don't have an account? <a href="${pageContext.request.contextPath}/pages/Register.jsp">Sign up</a></p>
                </form>
                 <% 
        String successMessage = (String) request.getAttribute(StringUtils.SUCCESS_MESSAGE);
        String errorMessage = (String) request.getAttribute(StringUtils.ERROR_MESSAGE);

        if (errorMessage != null && !errorMessage.isEmpty()) {
        %>
        <!-- Display error message -->
         <div class="alert alert-danger mt-2" role="alert">
            <%= errorMessage %>
        </div>
        <% } %>

        <% 
        if (successMessage != null && !successMessage.isEmpty()) {
        %>
        <!-- Display success message -->
        <div class="alert alert-success mt-2" role="alert">
            <%= successMessage %>
        </div>
        <% } %>
            </div>
        </div>
    </div>
    <script src="login.js"></script>
</body>
</html>