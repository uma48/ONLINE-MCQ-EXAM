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
       .large-container {
            background-color:  #e3edf1;
            padding: 20px;
            margin: 20px;
            text-align: center;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .large-container h2 {
            font-size: 24px;
            margin-bottom: 10px;
            color: black; /* Blue color for headings */
        }

        .large-container p {
            font-size: 32px; /* Larger font size for numbers */
            margin-bottom: 0;
            color: blue; /* Green color for numbers */
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
     <script>
        // Function to animate the number count
        function animateNumber(targetElement, startValue, endValue, duration) {
            let current = startValue;
            const step = (endValue - startValue) / (duration / 10);
            const interval = setInterval(() => {
                current += step;
                targetElement.innerText = Math.round(current);
                if (current >= endValue) {
                    clearInterval(interval);
                    targetElement.innerText = endValue;
                }
            }, 10);
        }

        // Function to start the number animations
        function startAnimations() {
            animateNumber(document.getElementById('teachers-count'), 0, 06, 2000);
            animateNumber(document.getElementById('students-count'), 0, 20, 2000);
            animateNumber(document.getElementById('questions-count'), 0, 10, 2000);
            animateNumber(document.getElementById('accounts-count'), 0, 1, 2000);
        }

        // Start the animations when the page is loaded
        window.addEventListener('load', startAnimations);
    </script>
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
        <!-- Main Content -->
        
          <div class="main-content">
        <!-- Existing main content here -->

        <!-- New large containers with updated styles -->
        <div class="large-container">
            <h2>Number of Teachers</h2>
           <p id="teachers-count"><b>0</b></p>
        </div>
        <div class="large-container">
            <h2>Number of Students</h2>
            <p id="students-count"><b>0</b></p>
        </div>
        <div class="large-container">
            <h2>Number of Questions</h2>
            <p id="questions-count"><b>0</b></p>
        </div>
        <div class="large-container">
            <h2>Number of Update Question</h2>
            <p id="accounts-count"><b>0</b></p>
        </div>
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
