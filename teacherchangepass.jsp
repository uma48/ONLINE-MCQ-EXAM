<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>
    <style>
        /* Global styles */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }
        
    header {
      background-color:  #1901ce;
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
            height: 100vh;
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
        }
        /* Logout styles */
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
    </style>
    <style>
        

.body1 {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

.login-container {
    padding: 20px;
    border: 1px solid #ccc;
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    max-width: 600px;
    width: 600px;
}

.login-container h2 {
    text-align: center;
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    margin-bottom: 5px;
}

.form-group input {
    width: 100%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 3px;
    font-size: 16px;
}

.form-group button {
    width: 100%;
    padding: 8px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 3px;
    font-size: 16px;
    cursor: pointer;
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
    <header>
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
        <center><br><br><br>
             <%
                     String username= request.getParameter("username");
                    //String oldpassword=request.getParameter("");
                    String newpassword=request.getParameter("new");
                     String confpass=request.getParameter("confirm");
                    
                try{
                    
                     

          Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");

         //  PreparedStatement ps=con.prepareStatement("select*from doctor where username=? and password=?");
                      
                      
                    //  ps.setString(1,dusername);
                     // ps.setString(2,newpassword);
                      
                     
                     // ResultSet rs=ps.executeQuery();

                      //if(rs.next())
                      
                         if(newpassword.equals(confpass)) 
                         {
                             //PreparedStatement ps1=con.prepareStatement("update DoctorRegistration set password=? where password=?");
                            PreparedStatement ps1=con.prepareStatement("update teacherregistration set password=? where username=?");
                               ps1.setString(1,newpassword);
                              // ps1.setString(2,confpass);
                              ps1.setString(2,username);
                               ps1.executeUpdate();
                               response.sendRedirect("teacherhomedashboard.jsp");
                           }
                         else
                             out.println(" Newpassword and confirmation password do not match");
                         
                      
                    
            
                }

                  catch(Exception e)
                {
                    
                }
               %>

            <section class="body">
        <!-- Main Content -->
       <div class="login-container">
            <h2>Change Password</h2>
            <form >
                <div class="form-group">
                    <label for="username"><b><h3>Username</h3></b></label>
                    <input type="text"  name="username" required>
                </div>
                <div class="form-group">
                    <label for="password"><b><h3>New Password</h3></b></label>
                    <input type="password" id="password" name="new" required>
                </div>
                <div class="form-group">
                    <label for="password"><b><h3>Confirm Password</h3></b></label>
                    <input type="password" id="password" name="confirm" required>
                </div>
                <div class="form-group">
                    <button type="submit">Change</button>
                </div>
               
            </form>
       </div></section></center>
        <!-- Logout -->
        <div class="logout"> 
            <a href="studentlogin.html"><button   style="color: white; height: 65px;width: 111px;background-color: red"><b><h1>Logout</h1></b></button></a>
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
