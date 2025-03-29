<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&family=Montserrat:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Roboto', sans-serif;
            color: #495057;
        }
        .container {
            margin-top: 50px;
        }
        .card {
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background-color: #007bff;
            color: white;
            text-align: center;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-control {
            border-radius: 4px;
            border: 1px solid #ccc;
            padding: 10px;
            background-color: #fff;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .btn {
            width: 100%;
        }
        .text-center {
            text-align: center;
        }
        .text-muted {
            font-size: 0.875rem;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h3>Register</h3>
                </div>
                <div class="card-body">
                    <form method="post">
                        <div class="form-group">
                            <label for="name">Name</label>
                            <input type="text" name="name" id="name" class="form-control" placeholder="Enter your name" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" name="email" id="email" class="form-control" placeholder="Enter your email" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" name="password" id="password" class="form-control" placeholder="Enter your password" required>
                        </div>
                        <div class="form-group">
                            <button type="submit" name="submit" class="btn btn-primary">Register</button>
                        </div>
                    </form>

                    <div class="text-center mt-3">
                        <a href="login.jsp" class="text-muted">Already have an account? Login here</a>
                    </div>

                    <% 
                    if(request.getMethod().equalsIgnoreCase("POST")) {
                        String name = request.getParameter("name");
                        String email = request.getParameter("email");
                        String password = request.getParameter("password");
                        if(!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
                            out.println("<p class='text-danger'>Invalid email format. Please try again.</p>");
                        } else {
                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/library", "root", "root@dk");
                                PreparedStatement pstmt = con.prepareStatement("INSERT INTO user (name, email, password) VALUES(?, ?, ?)");
                                pstmt.setString(1, name);
                                pstmt.setString(2, email);
                                pstmt.setString(3, password);

                                int x = pstmt.executeUpdate();
                                con.close();

                                if(x > 0) {
                                    out.println("<p class='text-success'>Registered successfully!</p>");
                                } else {
                                    out.println("<p class='text-danger'>Something went wrong, please try again.</p>");
                                }
                            } catch (ClassNotFoundException | SQLException e) {
                                out.println("<p class='text-danger'>Error: " + e.getMessage() + "</p>");
                                e.printStackTrace();
                            }
                        }
                    }
                    %>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
