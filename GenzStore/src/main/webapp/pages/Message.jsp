<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %> 
<%@ page import="model.SendMessageModel" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/AdMessage.css">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    
</head>
<body style="background-color:#d6d6d6;">
<sql:setDataSource var="dbConnection" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/genzstore" user="root" password="" />

	<sql:query var="messages" dataSource="${dbConnection}">
    	SELECT name, email, phone_number, message FROM message
	</sql:query>
	
	
  <header>
    <div class="logo"> <img src="${pageContext.request.contextPath}/images/logo.png" alt=""><h1>Admin</h1></div>
  </header>
  <div class="sidebar">
    <ul>
      <li><a href="${pageContext.request.contextPath}/AdminProductList" style="text-decoration: none; color: black;">Product</a></li>
      <li><a href="${pageContext.request.contextPath}/" style="text-decoration: none; color: black;">Order</a></li>
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
   <div class="main">
	    <h1 class="title">Message List</h1>
	    
	    <c:if test="${not empty messages}">
	        <c:forEach var="message" items="${messages.rows}">
	            <div class="message-box">
	                <div class="content">
	                    <h3>${message.name}</h3>
						<h4 class="h4">${message.email}</h4>
						<h4 class="h4">${message.phone_number}</h4>
						<h4>Message</h4>
						<p>${message.message}</p>
	                </div>
	            </div>
	        </c:forEach>
	    </c:if>
	    
	    <c:if test="${empty messages}">
	        <p>No messages found.</p>
	    </c:if> 
	  </div>
  </div>
</body>
</html>
