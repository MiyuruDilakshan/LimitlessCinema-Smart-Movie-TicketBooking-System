<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>
<%@ page import="jakarta.servlet.http.Part" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link href='https://fonts.googleapis.com/css?family=Urbanist' rel='stylesheet'>
    <link href='https://fonts.googleapis.com/css?family=Plus Jakarta Sans' rel='stylesheet'>
    <title>Admin Panel - Manage Movies</title>
    
    <style type="text/css">
    
    /* Global Styles */
body {
    font-family: 'Urbanist', sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
    display: flex;
}

/* Admin Sidebar */
.admin-sidebar {
    width: 250px;
    background-color: #333;
    color: #fff;
    height: 100vh;
    padding-top: 20px;
    position: fixed;
}

.sidebar-header {
    text-align: center;
    font-size: 24px;
    margin-bottom: 30px;
}

.sidebar-menu {
    list-style: none;
    padding: 0;
}

.sidebar-menu li {
    padding: 15px;
    text-align: center;
    border-bottom: 1px solid #444;
}

.sidebar-menu li a {
    text-decoration: none;
    color: #fff;
    font-size: 18px;
    display: block;
}

.sidebar-menu li a:hover {
    background-color: #575757;
}

/* Main Content */
.main-content {
    margin-left: 250px;
    padding: 20px;
    width: 100%;
}

.container {
    max-width: 900px;
    margin: 0 auto;
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

h1 {
    font-size: 32px;
    color: #333;
    margin-bottom: 20px;
}

/* Form Styling */
.movie-form {
    margin-top: 20px;
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    font-size: 16px;
    font-weight: bold;
    color: #333;
}

.form-control {
    width: 100%;
    padding: 10px;
    font-size: 16px;
    border-radius: 5px;
    border: 1px solid #ddd;
    margin-top: 5px;
}

.form-control:focus {
    outline: none;
    border-color: #007bff;
}

/* Button */
.btn {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 10px 20px;
    font-size: 16px;
    cursor: pointer;
    border-radius: 5px;
    transition: background-color 0.3s;
}

.btn:hover {
    background-color: #0056b3;
}

/* Alert Messages */
.alert {
    padding: 15px;
    margin-top: 20px;
    border-radius: 5px;
    font-size: 16px;
}

.alert-success {
    background-color: #28a745;
    color: white;
}

.alert-danger {
    background-color: #dc3545;
    color: white;
}

/* Footer */
.footer {
    text-align: center;
    padding: 20px;
    background-color: #333;
    color: #fff;
    position: fixed;
    bottom: 0;
    width: 100%;
}
    
    </style>
    
    
</head>
<body>
    <!-- Admin Panel Sidebar -->
    <div class="admin-sidebar">
        <div class="sidebar-header">
            <h2>Admin Panel</h2>
        </div>
        <ul class="sidebar-menu">
            <li><a href="dashboard.jsp">Dashboard</a></li>
            <li><a href="movies.jsp">Movies</a></li>
            <li><a href="users.jsp">Users</a></li>
            <li><a href="feedback.jsp">Feedback</a></li>
            <li><a href="settings.jsp">Settings</a></li>
        </ul>
    </div>
    
    <!-- Main Content Area -->
    <div class="main-content">
        <div class="container">
            <h1>Add New Movie</h1>

            <% 
                String message = null; 
                boolean isSuccess = false; 
                Class.forName("com.mysql.cj.jdbc.Driver");
                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    String title = request.getParameter("title");
                    String genre = request.getParameter("genre");
                    String description = request.getParameter("description");
                    int duration = Integer.parseInt(request.getParameter("duration"));
                    float rating = Float.parseFloat(request.getParameter("rating"));
                    String imageUrl = request.getParameter("imageUrl"); // Get image URL from the form
                   
                    String jdbcURL = "jdbc:mysql://localhost:3308/movie";
                    String jdbcUsername = "root";
                    String jdbcPassword = "12345678";

                    try (Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword)) {
                        String sql = "INSERT INTO movies (title, genre, duration, rating, description, image_url) VALUES (?, ?, ?, ?, ?, ?)";
                        try (PreparedStatement ps = conn.prepareStatement(sql)) {
                            ps.setString(1, title);
                            ps.setString(2, genre);
                            ps.setInt(3, duration);
                            ps.setFloat(4, rating);
                            ps.setString(5, description);
                            ps.setString(6, imageUrl != null ? imageUrl : null); // Set image URL

                            int result = ps.executeUpdate();
                            if (result > 0) {
                                isSuccess = true;
                                message = "Movie added successfully!";
                            } else {
                                message = "Failed to add movie.";
                            }
                        }
                    } catch (Exception e) {
                        message = "Database Error: " + e.getMessage();
                        e.printStackTrace();
                    }
                }
            %>

            <!-- Display Message -->
            <% if (message != null) { %>
                <div class="alert <%= isSuccess ? "alert-success" : "alert-danger" %>">
                    <%= message %>
                </div>
            <% } %>

            <!-- Movie Form -->
            <form action="" method="POST" class="movie-form">
                <div class="form-group">
                    <label>Movie Title</label>
                    <input type="text" name="title" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Genre</label>
                    <input type="text" name="genre" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Duration (minutes)</label>
                    <input type="number" name="duration" class="form-control" min="1" required>
                </div>
                <div class="form-group">
                    <label>Rating</label>
                    <input type="number" step="0.1" name="rating" class="form-control" min="0" max="10" required>
                </div>
                <div class="form-group">
                    <label>Description</label>
                    <textarea name="description" class="form-control" rows="3" required></textarea>
                </div>
                <div class="form-group">
                    <label>Image URL</label>
                    <input type="text" name="imageUrl" class="form-control" placeholder="Enter image URL" required>
                </div>
                <button type="submit" class="btn btn-primary">Add Movie</button>
            </form>
        </div>
    </div>


</body>
</html>
