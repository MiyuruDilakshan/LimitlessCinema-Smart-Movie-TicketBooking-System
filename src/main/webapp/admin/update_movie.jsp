<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Movie</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1>Update Movie</h1>

        <%
            int movieId = Integer.parseInt(request.getParameter("id"));
            String jdbcURL = "jdbc:mysql://localhost:3308/movie";
            String jdbcUsername = "root";
            String jdbcPassword = "12345678";
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            String title = "", genre = "", description = "", imageUrl = "";
            int duration = 0;
            float rating = 0;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

                String sql = "SELECT * FROM movies WHERE movie_id = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, movieId);
                rs = ps.executeQuery();

                if (rs.next()) {
                    title = rs.getString("title");
                    genre = rs.getString("genre");
                    duration = rs.getInt("duration");
                    rating = rs.getFloat("rating");
                    description = rs.getString("description");
                    imageUrl = rs.getString("image_url");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>

        <form action="update_movies.jsp" method="POST">
            <input type="hidden" name="id" value="<%= movieId %>">
            <div class="mb-3">
                <label for="title" class="form-label">Title</label>
                <input type="text" class="form-control" id="title" name="title" value="<%= title %>" required>
            </div>
            <div class="mb-3">
                <label for="genre" class="form-label">Genre</label>
                <input type="text" class="form-control" id="genre" name="genre" value="<%= genre %>" required>
            </div>
            <div class="mb-3">
                <label for="duration" class="form-label">Duration</label>
                <input type="number" class="form-control" id="duration" name="duration" value="<%= duration %>" required>
            </div>
            <div class="mb-3">
                <label for="rating" class="form-label">Rating</label>
                <input type="number" class="form-control" id="rating" name="rating" value="<%= rating %>" step="0.1" required>
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea class="form-control" id="description" name="description" rows="3" required><%= description %></textarea>
            </div>
            <div class="mb-3">
                <label for="imageUrl" class="form-label">Image URL</label>
                <input type="text" class="form-control" id="imageUrl" name="imageUrl" value="<%= imageUrl %>" required>
            </div>
            <button type="submit" class="btn btn-primary">Update Movie</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
