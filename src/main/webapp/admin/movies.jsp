<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Movies</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        h1 {
            font-size: 2.5rem;
            font-weight: 600;
            color: #343a40;
            margin-bottom: 20px;
        }
        .table th, .table td {
            text-align: center;
        }
        .add-btn {
            margin-bottom: 20px;
        }
        .btn-group {
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h1>Manage Movies</h1>

        <!-- Add Movie Button -->
        <a href="add_movie.jsp" class="btn btn-success add-btn">Add New Movie</a>

        <!-- Movie Details Table -->
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Genre</th>
                    <th>Duration</th>
                    <th>Rating</th>
                    <th>Description</th>
                    <th>Image</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Fetch movie data from database and display it -->
                <%
                    String jdbcURL = "jdbc:mysql://localhost:3308/movie"; 
                    String jdbcUsername = "root"; 
                    String jdbcPassword = "12345678"; 
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        // Establish connection
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

                        // Query to fetch all movies
                        String sql = "SELECT * FROM movies";
                        stmt = conn.createStatement();
                        rs = stmt.executeQuery(sql);

                        // Loop through the result set and display movies
                        while (rs.next()) {
                            int id = rs.getInt("movie_id");
                            String title = rs.getString("title");
                            String genre = rs.getString("genre");
                            int duration = rs.getInt("duration");
                            float rating = rs.getFloat("rating");
                            String description = rs.getString("description");
                            String imageUrl = rs.getString("image_url");

                            %>
                            <tr>
                                <td><%= id %></td>
                                <td><%= title %></td>
                                <td><%= genre %></td>
                                <td><%= duration %></td>
                                <td><%= rating %></td>
                                <td><%= description %></td>
                                <td><img src="<%= imageUrl %>" alt="<%= title %>" width="100"></td>
                                <td class="btn-group">
                                    <!-- Update Button -->
                                    <a href="update_movie.jsp?id=<%= id %>" class="btn btn-warning btn-sm">Update</a>
                                    
                                    <!-- Delete Button -->
                                    <a href="delete_movie.jsp?id=<%= id %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this movie?')">Delete</a>
                                </td>
                            </tr>
                            <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                            if (conn != null) conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
