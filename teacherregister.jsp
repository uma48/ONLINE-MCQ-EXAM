<%-- 
    Document   : studentregister
    Created on : 23 Jul, 2023, 8:41:51 PM
    Author     : uduma
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    try{
           Class.forName("oracle.jdbc.driver.OracleDriver");   
    }
            
        
        catch(Exception e){
                e.printStackTrace();
                }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
           out.println("Connection Established ");
               String Name = request.getParameter("name");
               String Qualification = request.getParameter("qualification");
               String Username = request.getParameter("username");
               String Password = request.getParameter("password");
               String Sex = request.getParameter("sex");
                 
                     int   Age=Integer.parseInt(request.getParameter("age"));
               
               String Contactno = request.getParameter("contactno");
               String Email = request.getParameter("email");
                 String State = request.getParameter("state");
                 String Specialization = request.getParameter("specialization");
                 String Experience = request.getParameter("experience");
               
               try{
                   out.println("Connection Established ");
             
                
           
            
            //step 2 create the connection object
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
             System.out.println("Connection Established ");
             PreparedStatement ps=con.prepareStatement("insert into  teacherregistration values(?,?,?,?,?,?,?,?,?,?,?)");

             
             
             out.println(Name+Qualification+Username);

             ps.setString(1,Name);
             ps.setString(2, Qualification);
             ps.setString(3,Username);
             ps.setString(4,Password);
             ps.setString(5,Sex);
              ps.setInt(6,Age);
             ps.setString(7,Contactno);
             ps.setString(8,Email);
             ps.setString(9,State);
              ps.setString(10,Specialization);
               ps.setString(11,Experience);
             
             
             
              ps.executeQuery();
                   response.sendRedirect("studentlogin.html");;
               }
        catch(Exception e)
        {
         e.printStackTrace();
    }
                %>


    </body>
</html>
