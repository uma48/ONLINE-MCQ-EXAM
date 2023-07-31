   <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%
    // Retrieve form data
     int qno = Integer.parseInt(request.getParameter("qno"));
    String question = request.getParameter("question");
    String optionA = request.getParameter("optionA");
    String optionB = request.getParameter("optionB");
    String optionC = request.getParameter("optionC");
    String optionD = request.getParameter("optionD");
    String correctOption = request.getParameter("correctoption");

    // Database connection parameters
    

    try {
        // Register the JDBC driver
        
            Class.forName("oracle.jdbc.driver.OracleDriver");
            //step 2 create the connection object
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
            out.println("Connection Established ");


        // Prepare the SQL query to insert the question into the database
        

        // Create a prepared statement to prevent SQL injection
        PreparedStatement ps=con.prepareStatement("insert into  mcqquestion values(?,?,?,?,?,?,?)");
        ps.setInt(1, qno);
        ps.setString(2, question);
        ps.setString(3, optionA);
       ps.setString(4, optionB);
        ps.setString(5, optionC);
        ps.setString(6, optionD);
        ps.setString(7 , correctOption);

        // Execute the query to insert the data
        ps.executeUpdate();

        // Close the statement and connection
        ps.close();
        con.close();

        // Redirect to a success page or display a success message
        //response.sendRedirect("teacherinsertquestion.jsp");
    } catch (Exception e) {
        // Handle any errors that occurred during the database interaction
        out.println("Error: " + e);
    }
%>