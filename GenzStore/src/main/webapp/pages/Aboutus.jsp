<%@page import="utils.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/Aboutus.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/Header.css">
    
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/Footer.css">
</head>
<body>
      <jsp:include page="Header.jsp"></jsp:include>
<div>
    <h1>About us</h1>
    <h2>Our Story</h2>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae quam autem repellendus ipsum perspiciatis assumenda repudiandaeipsa nisi eveniet, dignissimos, impedit, maxime sed exercitationdus ea, magni rerum similique ullam ab modi hic laboriosam. Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae quam autem repellendus ipsum perspiciatis assumenda repudiandaeipsa nisi eveniet, dignissimos, impedit, maxime sed exercitationdus ea, magni rerum similique ullam ab modi hic laboriosam</P ></div>

    <div class="container">
        <h3>Contact Us</h3>
        <form action="${pageContext.request.contextPath}/SendMessageServlet" method="post">
            <div class="form-group">
                <label for="name">Your Name</label>
                <input type="text" id="name" name="name">
            </div>
            <div class="form-group">
                <label for="email">Your Email</label>
                <input type="email" id="email" name="emails" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="tel" id="phone" name="phone">
            </div>
            <div class="form-group">
                <label for="message">Message</label>
                <input type="message" id="message" name="message">
            </div>
            <button type="submit">Submit</button>
            <%
			        String errorMessage = (String) request.getAttribute(StringUtils.ERROR_MESSAGE);
			    
			        
			        if (errorMessage !=null && !errorMessage.isEmpty()) {
			    %>
			        <div class="alert alert-danger" role="alert">
			            <%= errorMessage %>
			        </div>
			        <% 
			        }
			       %>
        </form>
    </div>
</body>
</html>