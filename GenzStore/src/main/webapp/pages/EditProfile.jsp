<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/EditProfile.css">
</head>
<body>
    <div class="container">
    <div class="display:flex; ">
    <a href="${pageContext.request.contextPath}/ProfileServlet" class="btn btn-primary">back</a>

     <h2>Edit Profile</h2>
     
    </div>
       
        <form id="editProfileForm" action="${pageContext.request.contextPath}/ProfileServlet" method="post"> 
           
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="username" value="${userdata.user_name}" readonly>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="${userdata.user_email}" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone Number:</label>
                <input type="tel" id="phone" name="phoneNumber" value="${userdata.user_phone}" required>
            </div>
            <div class="form-group">
                <!-- Assuming role is a hidden field to determine user's role -->
              
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <textarea id="address" name="address" required>${userdata.user_address}</textarea>
            </div>
            
            <button type="submit">Save Changes</button>
        </form>
    </div>

</body>
</html>
