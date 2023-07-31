<%-- 
    Document   : studentlogin
    Created on : 24 Jul, 2023, 1:40:54 AM
    Author     : uduma
--%>


<%@page import="java.sql.*;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            
            
            
            
            
                
               try{
                    Class.forName("oracle.jdbc.driver.OracleDriver");
               Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","System");
                
               
               
                PreparedStatement ps = con.prepareStatement("select * from studentregistration where USERNAME = ?And PASSWORD = ?");
                
                ps.setString(1, Username);
                ps.setString(2, Password);
                
                ResultSet rs = ps.executeQuery();
                
                
                if(rs.next())
                { %>
                <h3>Login successful...u</h3>
                <%}
                else
                {%>
                <h3>failed...</h3>
               <% }
               
               }
                
                catch(Exception e){
                    System.out.println(e);
                }
      %>
    </body>
</html>
