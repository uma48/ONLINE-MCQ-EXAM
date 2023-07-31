<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <%
        String Username = request.getParameter("username");
        String Password = request.getParameter("password");
        
        
        out.print("Username");
                out.print("Password");

        try
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","System");

            PreparedStatement ps = con.prepareStatement("select * from teacherregistration where USERNAME = ? AND PASSWORD = ?");

            ps.setString(1, Username);
            ps.setString(2, Password);

            ResultSet rs = ps.executeQuery();
        out.print("Username");

            while (rs.next()) {
                // Store user information in the session
                String fullName = rs.getString("NAME");
                String email = rs.getString("EMAILID");

                // Set the attributes in the session
                session.setAttribute("username", Username);
                session.setAttribute("fullName", fullName);
                session.setAttribute("email", email);
               out.print("hj");

                // Redirect to the instruction page after successful login
                response.sendRedirect("teacherhomedashboard.jsp");
                System.out.println(rs.getString("NAME"));
                return;
            } 
                // Show an error message if login fails
                %>
                <!--<h3>Login failed. Please check your credentials.</h3>-->
                <% 
            

            // Close the ResultSet, PreparedStatement, and Connection
            rs.close();
            ps.close();
            con.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
    %>
   
</body>
</html>
