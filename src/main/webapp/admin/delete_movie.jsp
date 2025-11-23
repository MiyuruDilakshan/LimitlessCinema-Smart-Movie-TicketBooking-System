<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Movie</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1>Delete Movie</h1>

        <%
            int movieId = Integer.parseInt(request.getParameter("id"));
            String jdbcURL = "jdbc:mysql://localhost:3308/movie";
            String jdbcUsername = "root";
            String jdbcPassword = "12345678";
            Connection conn = null;
            PreparedStatement ps = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

                String sql = "DELETE FROM movies WHERE movie_id = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, movieId);
                int rowsAffected = ps.executeUpdate();

                if (rowsAffected > 0) {
                    response.sendRedirect("movies.jsp");
                } else {
                    out.println("<div class='alert alert-danger'>Failed to delete movie.</div>");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (ps != null) ps.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
