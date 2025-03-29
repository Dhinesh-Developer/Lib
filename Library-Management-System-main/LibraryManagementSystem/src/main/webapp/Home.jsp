<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Management System - Home Page</title>

   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500&family=Lato:wght@400;700&display=swap" rel="stylesheet">

    
    <style>
        body {
            background-color: #f4f7fa;
            color: #333;
            font-family: 'Montserrat', sans-serif;
        }
        h2 {
            color: #333;
            font-weight: bold;
        }
        .navbar {
            background-color: #007BFF;
            padding: 15px;
        }
        .navbar .navbar-brand {
            color: white;
            font-family: 'Montserrat', sans-serif;
            font-weight: 700;
        }
        .navbar a {
            color: white !important;
        }
        .navbar a:hover {
            color: #e2e6ea !important;
        }
        .card {
            background-color: white;
            border: none;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            margin-bottom: 20px;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
        .card-body {
            padding: 20px;
        }
        .card-title {
            color: #007BFF;
            font-size: 1.2rem;
            font-weight: 500;
        }
        .card-subtitle {
            color: #555;
            font-size: 0.95rem;
        }
        .card-text {
            font-size: 0.9rem;
            color: #777;
        }
        .success-message {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            font-weight: bold;
            animation: fadeInOut 4s ease-in-out;
        }
        @keyframes fadeInOut {
            0% { opacity: 0; transform: translateY(20px); }
            10%, 90% { opacity: 1; transform: translateY(0); }
            100% { opacity: 0; transform: translateY(20px); }
        }
        img {
            width: 100%;
            height: 250px;
            object-fit: cover;
            border-radius: 8px;
        }
        .container {
            margin-top: 30px;
        }
        .card-title, .card-subtitle {
            text-transform: capitalize;
        }
        .navbar-toggler-icon {
            background-color: white;
        }
    </style>
</head>
<body>


<nav class="navbar navbar-expand-lg navbar-light">
    <a class="navbar-brand" href="#">Library Management System</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
         <li class="nav-item">
                <a class="nav-link" href="Home.jsp">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="addBook.jsp">Add Books</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="updateBook.jsp">Update Books</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Register.jsp">Register</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="login.jsp">Login</a>
            </li>
        </ul>
    </div>
</nav>

<div class="container">
    <div class="row">
        <% 
            try {
           
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "root@dk");
                Statement stmt = con.createStatement();
                String query = "SELECT * FROM book";
                ResultSet res = stmt.executeQuery(query);
                while (res.next()) {
                    int id = res.getInt("id");
                    String author = res.getString("author");
                    String title = res.getString("title");
                    int copies = res.getInt("copies");
                    int year = res.getInt("year");
                %>

        <div class="col-md-4 mb-4">
            <div class="card">
               
                <div class="card-body">
                    <p>ID: <%= id %><br></p>
                    <h5 class="card-title">Title: <%= title %></h5>
                    <h6 class="card-subtitle mb-2 text-muted">Author: <%= author %></h6>
                    <p>Copies: <%= copies %><br>Year: <%= year %></p>
                </div>
            </div>
        </div>

        <% 
                }
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </div>
</div>

<% if (request.getParameter("success") != null) { %>
    <div class="success-message">
        <%= request.getParameter("success") %>
    </div>
<% } %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    function showSuccessMessage(message) {
        const successDiv = document.createElement('div');
        successDiv.className = 'success-message';
        successDiv.innerHTML = message;
        document.body.appendChild(successDiv);
        setTimeout(() => {
            successDiv.remove();
        }, 4000);
    }
</script>

</body>
</html>
