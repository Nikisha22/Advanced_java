<%@page import="model.UserModel"%>
<%@page import="utils.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Page</title>
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/Register.css">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
    <div class="container"> 	
        <div class="right-side">
            <div class="purple-shapes">
                <div class="shape shape1"></div>
                <div class="shape shape2"></div>
            </div>
            <div class="shape shape3"></div>
            <img src="${pageContext.request.contextPath}/images/img.png" >
        </div>
        
        <div class="left-side">
            <div class="form-container">
                <h2>Register</h2>
                <h3>Create an account</h3>
                <form action="${pageContext.request.contextPath}/RegisterServlet" method="post" onsubmit="return validateForm()">
                    <input type="email" id="email" name="email" placeholder="Email">
                    <input type="text" id="username" name="username" placeholder="Username">
                    <input type="hidden" id="role" name="role">
                    <input type="hidden" id="address" name="address">
                    <input type="hidden" id="phone" name="phone">
                    <div class="password-container">
                        <input type="password" id="password" name="password" placeholder="Password">
                        <span class="password-toggle" onclick="togglePassword()">
                            <i id="eye-icon" class="fas fa-eye"></i> <!-- Eye icon -->
                        </span>
                    </div>
                    <div class="password-container">
                        <input type="password" id="retype-password" name="retype-password" placeholder="Confirm Password">
                        <span class="password-toggle" onclick="togglePassword()">
                            <i id="eye-icon" class="fas fa-eye"></i> <!-- Eye icon -->
                        </span>
                    </div>
                    <button type="submit">Register</button>
                    <% String errorMessage = (String) request.getAttribute(StringUtils.ERROR_MESSAGE);
                       if (errorMessage !=null && !errorMessage.isEmpty()) {
                    %>
                    <div class="alert alert-danger" role="alert">
                        <%= errorMessage %>
                    </div>
                    <% 
                       }
                    %>
                    <p>Already have an account? <a href="#">Sign in</a></p>
                </form>
            </div>
        </div>
    </div>
    <script>
        function validateForm() {
            var username = document.getElementById("username").value;
            if (username.trim() == "") {
                alert("Username cannot be empty");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
