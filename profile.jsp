<%-- 
    Document   : profile
    Created on : 24 Jul, 2023, 1:15:36 AM
    Author     : uduma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
</head>
<body>
    <h2>User Profile</h2>
     <p><strong>Name:</strong> <%= session.getAttribute("name") %></p>
       <p><strong>Email:</strong> <%= session.getAttribute("qualification") %></p>
    <p><strong>Username:</strong> <%= session.getAttribute("username") %></p>
   
  
   
    <!-- Add other user-specific information here -->
    <a href="logout.jsp">Logout</a>
</body>
</html>

    
