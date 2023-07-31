<%-- 
    Document   : logout
    Created on : 24 Jul, 2023, 1:28:27 AM
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
       <%
    // Invalidate the session and redirect to the login page
    session.invalidate();
    response.sendRedirect("studentlogin.html");
%>

    </body>
</html>
