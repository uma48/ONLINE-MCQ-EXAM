<%-- 
    Document   : login
    Created on : 24 Jul, 2023, 1:19:33 AM
    Author     : uduma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>

<%@ page language="java" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
<%
    // Retrieve login form data
    String Username = request.getParameter("username");
    String Password = request.getParameter("password");

    // Database connection parameters
    String dbUrl = "jdbc:oracle://@localhost:1521:xe/studentregistration";
    String dbUsername = "system";
    String dbPassword = "system";

   

    try {
        // Register the JDBC driver
         Class.forName("oracle.jdbc.driver.OracleDriver");


        // Create a connection to the database
          Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");


        // Prepare the SQL query to check user credentials
       PreparedStatement ps = con.prepareStatement("select * from studentregistration where USERNAME = ?And PASSWORD = ?");
        ps.setString(1, Username);
        ps.setString(2, Password);

        // Execute the query
        ResultSet resultSet = ps.executeQuery();

        // Check if the login is successful
        if (resultSet.next()) {
            // Store user information in the session for the profile page
            session.setAttribute("name", resultSet.getString("name"));
            session.setAttribute("qualification", resultSet.getString("qualification"));
            session.setAttribute("username", resultSet.getString("username"));
            
            // Add other user-specific attributes if needed

            // Redirect to the user profile page
            response.sendRedirect("profile.jsp");
        } else {
            // Login failed, redirect back to the login page with an error message
            response.sendRedirect("studentlogin.html");
        }

        // Close the result set, statement, and connection
        resultSet.close();
        ps.close();
        con.close();
    } catch (Exception e) {
        // Handle any errors that occurred during the database interaction
        out.println("Error: " + e);
    }
%>

    </body>
</html>
