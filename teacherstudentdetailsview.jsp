<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <%@page import="java.sql.DriverManager"%>
        <%@page import="java.sql.ResultSet"%>
        <%@page import="java.sql.Statement"%>
        <%@page import="java.sql.Connection"%>
      
        <%
            try{
                 Class.forName("oracle.jdbc.driver.OracleDriver");
            }
            catch(ClassNotFoundException e)
            {
                e.printStackTrace();
            }
            %>
    <title>Student Dashboard</title>
    <style>
        /* Global styles */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }
        
    header {
      background-color:  rgb(74, 0, 222);
      color: #fff;
      padding: 08px;
      text-align: center;
    }
    #profile-card {
            border: 4px solid rgb(255, 5, 5);
            padding: 16px;
            background-color: #fbfffe;
        }

        .container {
            display: flex;
            flex-direction: row;
        }
        /* Sidebar styles */
        .sidebar {
            width: 250px;
            background-color: #1901ce;
            padding: 15px;
            height: auto;
        }
        .sidebar h2 {
            margin-bottom: 20px;
        }
        .sidebar p {
            margin-bottom: 10px;
        }
        /* Main content styles */
    .main-content {
    flex: 1;
    padding: 20px;
    padding-bottom: 200px; /* Add padding to the bottom */
  } 
        .logout {
            position: absolute;
            top: 9px;
            right: 40px;
            
            padding: 8px 20px;
            
            text-decoration: none;
    
        }
        .sidebar-buttons {
            margin-top: 20px;
        }
        .sidebar-buttons button {
            display: block;
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: none;
            background-color: #01bb07;
            color: white;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        .sidebar-buttons button:hover {
            background-color: red;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #f5f5f5;
        }
        footer {
    background-color: #1901ce;
    color: #fff;
    text-align: center;
    padding: 10px;
    position: fixed; /* Change position to 'fixed' */
    bottom: 0;
    left: 0;
    right: 0;
    width: 100%; /* Add width: 100% to make it full-width */
  }

        footer ul {
            list-style: none;
            padding: 0;
        }

        footer li {
            display: inline;
            margin: 0 10px;
        }

        footer li a {
            text-decoration: none;
            color: #fff;
        }

        footer li a:hover {
            color: #ddd;
        }

    </style>
</head>
<body>
    <header >
        <h1>Teacher Dashboard</h1>
    </header>
    <div class="container">
        <!-- Sidebar -->
        <div class="sidebar">
            <div id="profile-card">
            <center><h2><b>Profile</b></h2></center>
           <center> <img src="user3.png" alt="Student Avatar" width="100"></center>
            <p><strong>Name:</strong> <%= session.getAttribute("fullName") %></p>
            <p><strong>User Name:</strong> <%= session.getAttribute("username") %></p>
          
            <p><strong>Email:</strong><%= session.getAttribute("email") %></p>
        </div>
         <div class="sidebar-buttons">
            <!-- Add the buttons here -->
           <a href="teacherhomedashboard.jsp"><button >Home</button></a>
            <a href="teacherstudentdetailsview.jsp"><button >Student Details</button></a>
             <a href="teacherinsertquestion.jsp"><button >Insert Question</button></a>
              <a href="teacherviewquestion.jsp"><button >view Question</button></a>
               <a href="teacherchangepass.jsp"><button >Change Password</button></a>
        </div></div>
        <!-- Main Content -->
        <div class="main-content">
            <div class="container">
                
        <table>
            <tr>
                <th>Name</th>
                <th>Qualification</th>
                <th>Username</th>
                <th>Password</th>
                <th>Gender</th>
                <th>Age</th>
                <th>Contact No</th>
                <th>Email id</th>
                <th>Stream</th>
            </tr>
            <%
                try{
                    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
                    
                    String sql="Select * from studentregistration";
                    
                    Statement statement=con.createStatement();
                    Connection connection=null;
                    ResultSet resultSet=statement.executeQuery(sql);
                    
                   
                    while(resultSet.next())
                    {
                        
                    %>
                    <tr>
                        <td><%=resultSet.getString("name") %></td>
                        <td><%=resultSet.getString("qualification") %></td>
                        <td><%=resultSet.getString("username") %></td>
                         <td><%=resultSet.getString("password") %></td>
                          <td><%=resultSet.getString("gender") %></td>
                          <td><%=resultSet.getString("age") %></td>
                         <td><%=resultSet.getString("contactno") %></td>
                          <td><%=resultSet.getString("emailid") %></td>
                           <td><%=resultSet.getString("stream") %></td>
                    </tr>
                 
                    <%
                        }
connection.close();
}
catch(Exception e)
                {
                 e.printStackTrace();
                }
                
                %>
            
            
            
            
        </table>
    </div>
            <!-- Add your main content here -->
        </div>
        <!-- Logout -->
        <div class="logout"> 
            <a href="teacherlogin.html"><button   style="color: white; height: 65px;width: 111px;background-color: red"><b><h1>Logout</h1></b></button></a>
        </div>
    </div>
                <footer>
    <div class="footer-content">
      <p>Online MCQ Exam Portal &copy; 2023</p>
      <ul>
        <li><a href="terms.html">Terms of Service</a></li>
        <li><a href="privacy.html">Privacy Policy</a></li>
      </ul>
    </div>
  </footer>
</body>
</html>
