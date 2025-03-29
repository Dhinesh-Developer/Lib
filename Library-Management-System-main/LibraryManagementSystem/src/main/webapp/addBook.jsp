<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Books</title>

    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f4f4;
            color: #333;
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
        .container {
            margin-top: 50px;
        }
        .card {
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background-color: #007BFF;
            color: white;
            text-align: center;
            font-weight: 600;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-control {
            border-radius: 4px;
            border: 1px solid #ddd;
            padding: 10px;
        }
        .btn-primary {
            background-color: #007BFF;
            border-color: #007BFF;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .text-center p {
            font-size: 16px;
            color: green;
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
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">
                    <h3>Add Book Details</h3>
                </div>
                <div class="card-body">
                    <form method="post">
                        <div class="form-group">
                            <label for="id">Enter The Author ID</label>
                            <input type="number" name="id" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="author">Enter The Author Name</label>
                            <input type="text" name="author" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="title">Enter the Title of the Book</label>
                            <input type="text" name="title" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="year">Enter Year of Publication</label>
                            <input type="number" name="year" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="copies">Enter the Number of Copies Available</label>
                            <input type="number" name="copies" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary w-100">Submit</button>
                        </div>
                    </form>

                    <div class="text-center mt-3">
                        <%
                            if (request.getMethod().equalsIgnoreCase("POST")) {
                                long id = Long.parseLong(request.getParameter("id"));
                                String title = request.getParameter("title");
                                String author = request.getParameter("author");
                                int year = Integer.parseInt(request.getParameter("year"));
                                int copies = Integer.parseInt(request.getParameter("copies"));

                                try {
                                   
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "root@dk");
                                    String query = "INSERT INTO book (id, title, author, year, copies) VALUES (?, ?, ?, ?, ?)";
                                    PreparedStatement pstmt = con.prepareStatement(query);
                                    pstmt.setLong(1, id);
                                    pstmt.setString(2, title);
                                    pstmt.setString(3, author);
                                    pstmt.setInt(4, year);
                                    pstmt.setInt(5, copies);
                                    int result = pstmt.executeUpdate();
                                    con.close();
                                    if (result > 0) {
                                        out.println("<p style='color: green;'>Book details added successfully!</p>");
                                    } else {
                                        out.println("<p style='color: red;'>Failed to add book details. Please try again.</p>");
                                    }
                                } catch (ClassNotFoundException e) {
                                    out.println("<p style='color: red;'>Error: Unable to load the MySQL Driver!</p>");
                                    e.printStackTrace();
                                } catch (SQLException e) {
                                    out.println("<p style='color: red;'>Error: Unable to connect to the database or execute the query.</p>");
                                    e.printStackTrace();
                                }
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
