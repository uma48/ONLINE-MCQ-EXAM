<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Exam Result</title>
</head>
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

<body>
    <header>
        <h1>Result Dashboard</h1>
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
        </div>
<%
    try {
        // Register the JDBC driver
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // Create a connection to the database
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system");

        // Prepare the SQL query to select the questions and their correct options from the database
        String sql = "SELECT qno,question, correctoption FROM mcqquestion";

        // Create a statement to execute the query
        PreparedStatement statement = con.prepareStatement(sql);

        // Execute the query and get the result set
        ResultSet resultSet = statement.executeQuery();

        // Initialize variables to store the total questions, correct answers count, wrong answers count, and skipped answers count
        int totalQuestions = 0;
        int correctAnswersCount = 0;
        int wrongAnswersCount = 0;
        int skippedAnswersCount = 0;

        // Iterate through the result set to check the user's answers against the correct options
        while (resultSet.next()) {
            totalQuestions++;
            String question = resultSet.getString("question");
            String correctOption = resultSet.getString("correctoption");

            // Get the user's selected answer for this question
            String userAnswer = request.getParameter("answer_" + totalQuestions );

            // Compare the user's answer with the correct option for this question
            if (userAnswer != null && userAnswer.equals(correctOption)) {
                correctAnswersCount++;
            } else if (userAnswer != null) {
                wrongAnswersCount++;
            } else {
                skippedAnswersCount++;
            }
        }

        // Close the result set, statement, and connection
        resultSet.close();
        statement.close();
        con.close();

        // Calculate the score and percentage
        int score = (correctAnswersCount * 100) / totalQuestions;
%>
<div class="main-content">
    <h1>Exam Result</h1>
    <p>Total Questions: <%= totalQuestions %></p>
    <p>Correct Answers: <%= correctAnswersCount %></p>
    <p>Wrong Answers: <%= wrongAnswersCount %></p>
    <p>Skipped Answers: <%= skippedAnswersCount %></p>
    <p>Score: <%= score %> %</p>
    <center> <h1 >Thank you for Participating in Exam</h1></center>
<%
    } catch (Exception e) {
        // Handle any errors that occurred during the database interaction
        out.println("Error: " + e);
    }
%>
<!-- Logout -->
        <div class="logout"> 
            <a href="instruction.jsp"><button   style="color: white; height: 65px;width: 111px;background-color: red"><b><h1>Logout</h1></b></button></a>
        </div>
</div></div>
</body>
</html>
