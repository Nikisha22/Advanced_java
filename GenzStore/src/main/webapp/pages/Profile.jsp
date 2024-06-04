<%@ page import="model.UserModel" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/Profile.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
     <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"/>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"
    ></script>
    <!-- Add any additional stylesheets or scripts here -->
</head>
<body  style="background-color: #cecece;">
    <div class="profile">
        <a class="arrow" href="${pageContext.request.contextPath}/pages/Home.jsp">
            <i class="fa-solid fa-arrow-left"></i>
        </a>
        <h1 class="profile-heading">Profile</h1>

    </div>
    
    <p class="profile-details">Your Profile Details</p>
    <a href="${pageContext.request.contextPath}/UserOrderHistory?username=${userdata.user_name}" class="btn btn-warning" style="margin-left:4rem">Order History</a>
    <div class="main" style="background-color: white;">
   
        <div class="sec">
           <c:choose>
			    <c:when test="${empty userdata}">
			        <p>No data available</p>
			    </c:when>
			    <c:otherwise>  
			     <div class="user">
                <h3 style="font-size: 24px;">UserName</h3>
                <h3 class="box" style="font-size: 20px;">
                   ${userdata.user_name == null ? 'null' : userdata.user_name}
                </h3>
            </div>
            <div class="user">
                <h3 style="font-size: 24px;">Email</h3>
                <h3 class="box" style="font-size: 20px;">
                   ${userdata.user_email == null ? 'null' : userdata.user_email}
                </h3>
            </div>
            <div class="user">
                <h3 style="font-size: 24px;">Address</h3>
                <h3 class="box" style="font-size: 20px;">
                 ${userdata.user_address== null ? 'null' : userdata.user_address}
                </h3>
            </div>
            <div class="user">
                <h3 style="font-size: 24px;">Phone Number</h3>
                <h3 class="box" style="font-size: 20px;">
                   ${userdata.user_phone == null ? 'null' : userdata.user_phone}
                </h3>
            </div>

			    </c:otherwise>
			</c:choose>
         <a href="${pageContext.request.contextPath}/ProfileServlet?action=edit" class="btn btn-primary">Edit</a> 
        </div>
    </div>
</body>
</html>
