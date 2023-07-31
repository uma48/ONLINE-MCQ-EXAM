<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Dashboard</title>
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
    width: 100%;
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
        <h1>Admin Dashboard</h1>
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
           <a href="admin home dashboard.jsp"><button >Home</button></a>
            <a href="adminstudentdetailsview.jsp"><button >Student Details</button></a>
             <a href="adminteacherdetailsview.jsp"><button >Teacher Details</button></a>
             <a href="admininsertquestion.jsp"><button >Insert Question</button></a>
             <a href="adminviewquestion.jsp"><button >view Question</button></a>
             <a href="adminchangepass.jsp"><button >Change Password</button></a>
        </div></div>
        <!-- Main Content -->
        <div class="main-content">
            <div class="login-container">
            <h1>Insert MCQ Question</h1>
             <form action="insert_question.jsp" method="post">
                <div class="form-group">
        <label for="question"><b>Question:</b></label><br>
        <textarea id="question" name="question" rows="4" cols="50" required></textarea><br>
</div>
<div class="form-group">
        <label for="optionA"><b>Q.No:</b></label>
        <input type="text" id="optionA" name="optionA" required><br>
</div>
                 <div class="form-group">
        <label for="optionA"><b>Option A:</b></label>
        <input type="text" id="optionA" name="optionA" required><br>
</div>
                 <div class="form-group">
        <label for="optionB"><b>Option B:</b></label>
        <input type="text" id="optionB" name="optionB" required><br>
</div><div class="form-group">
        <label for="optionC"><b>Option C:</b></label>
        <input type="text" id="optionC" name="optionC" required><br>
</div><div class="form-group">
        <label for="optionD"><b>Option D:</b></label>
        <input type="text" id="optionD" name="optionD" required><br>
</div><div class="form-group">
        <label for="correctOption"><b>Correct Option (A, B, C, or D):</b></label>
        <input type="text" id="correctOption" name="correctoption" required><br>
</div>
    <div class="form-group">
        <button type="submit">Submit</button>
    </div>
        
    </form>
        </div>
        </div>
        <!-- Logout -->
        <div class="logout"> 
            <a href="adminlogin.html"><button   style="color: white; height: 65px;width: 111px;background-color: red"><b><h1>Logout</h1></b></button></a>
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
