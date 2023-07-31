<%-- 
    Document   : adminpre
    Created on : 25 Jul, 2023, 12:11:30 PM
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
        String s1=request.getParameter("fullname");
        String s2=request.getParameter("password");
        
            if(s1.equals("Admin") && s2.equals("Admin123"))
            {
               response.sendRedirect("adminregister.html");
            }
            else
            {
                out.println("Incorrect user name and password");
            }

        
            %>

    </body>
</html>
