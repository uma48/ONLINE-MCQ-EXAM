<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
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
        var currentQuestion = 0;
        var totalQuestions = 0;

        function showQuestion(questionIndex) {
            var questions = document.getElementsByClassName('card');
            totalQuestions = questions.length;

            if (questionIndex >= totalQuestions) {
                questionIndex = totalQuestions - 1;
            }
            if (questionIndex < 0) {
                questionIndex = 0;
            }

            for (var i = 0; i < totalQuestions; i++) {
                questions[i].style.display = 'none';
            }

            questions[questionIndex].style.display = 'block';
            currentQuestion = questionIndex;
        }

        function showNext() {
            showQuestion(currentQuestion + 1);
            showQuestion(questionIndex);
        }

        function showPrevious() {
            showQuestion(currentQuestion - 1);
               showQuestion(questionIndex);
        }

        window.onload = function() {
            showQuestion(0);
        };
    </script>
    
</head>

<body>
    
      <header>
        <h1>Exam Dashboard</h1>
        <h2> <div id="timer">Time Left: 10:00</div></h2>
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
            </div></div>
         <div class="main-content">
    <form action="submitexam.jsp" method="post">
<%
    try {
        // Register the JDBC driver
         Class.forName("oracle.jdbc.driver.OracleDriver");

        // Create a connection to the database
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");

        // Prepare the SQL query to select the questions from the database
        String sql = "SELECT question, optiona, optionb, optionc, optiond FROM mcqquestion";

        // Create a statement to execute the query
        Statement statement = con.createStatement();

        // Execute the query and get the result set
        ResultSet resultSet = statement.executeQuery(sql);

        // Iterate through the result set and display the questions and options
        int questionIndex = 0;
        while (resultSet.next()) {
            String question = resultSet.getString("question");
            String optionA = resultSet.getString("optiona");
            String optionB = resultSet.getString("optionb");
            String optionC = resultSet.getString("optionc");
            
            
            
            String optionD = resultSet.getString("optiond");
            questionIndex++;

            // Display the question and options in the card format
            %>
            <div class="card" id="question<%= questionIndex %>">
                <p class="question"><strong>Question <%= questionIndex %> of <%= question %>:</strong> </p>
                <input type="radio" name="answer_<%= questionIndex %>" value=<%= optionA %> >  <%= optionA %><br>
                <input type="radio" name="answer_<%= questionIndex %>" value=<%= optionB %> > <%= optionB %><br>
                <input type="radio" name="answer_<%= questionIndex %>" value=<%= optionC %> > <%= optionC %><br>
                <input type="radio" name="answer_<%= questionIndex %>" value=<%= optionD %> > <%= optionD %><br>
            </div>
            <%
        }

        // Close the result set, statement, and connection
        resultSet.close();
        statement.close();
    //    connection.close();
    } catch (Exception e) {
        // Handle any errors that occurred during the database interaction
        out.println("Error: " + e);
    }
%>
<br><br><br><br>

   
<center>   <button type="submit" style="background-color: #007bff; color: #fff; padding: 10px 20px; border: none; border-radius: 5px; font-size: 16px; cursor: pointer;">Save & Submit</button></center>
    

 
</form>
         </div>
<script>


        // You can use AJAX to send the answers to the server for evaluation and display the result.
        // For simplicity, we'll just display the answers in the console for now.
       
    }
     
</script>
<div class="logout"> 
            <a href="instruction.jsp"><button   style="color: white; height: 65px;width: 111px;background-color: red"><b><h1>Logout</h1></b></button></a>
        </div></div>
<script>
        var currentQuestion = 0;
        var totalQuestions = 0;
        var questionsData = [];
        var timer;
        var minutes = 10;
        var seconds = 0;

        function fetchQuestions() {
            // ... (same as before) ...
        }

        function startTimer() {
            timer = setInterval(updateTimer, 1000);
        }

        function updateTimer() {
            if (minutes === 0 && seconds === 0) {
                clearInterval(timer);
                document.getElementById("timer").textContent = "Time's up!";
                document.getElementById("submitBtn").style.display = "block";
            } else {
                if (seconds === 0) {
                    minutes--;
                    seconds = 59;
                } else {
                    seconds--;
                }

                var formattedTime = (minutes < 10 ? "0" : "") + minutes + ":" + (seconds < 10 ? "0" : "") + seconds;
                document.getElementById("timer").textContent = "Time Left: " + formattedTime;
            }
        }

        function showQuestion(questionIndex) {
            // ... (same as before) ...
        }

        function showNext() {
            // ... (same as before) ...
        }

        function showPrevious() {
            // ... (same as before) ...
        }

        window.onload = function() {
            fetchQuestions();
            startTimer();
        };
    </script>
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
