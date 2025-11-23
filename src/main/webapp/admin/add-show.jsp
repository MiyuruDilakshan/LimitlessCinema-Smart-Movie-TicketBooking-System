<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Show</title>
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
    </style>
</head>
<body>
    <div class="container mt-5">
        <h1>Add New Show</h1>

        <%
            // Fetch movie list from database
            String jdbcURL = "jdbc:mysql://localhost:3306/Movie";
            String jdbcUsername = "root";
            String jdbcPassword = "";
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

                // Fetch all movies
                String sql = "SELECT id, title FROM movies";
                ps = conn.prepareStatement(sql);
                rs = ps.executeQuery();
        %>

        <form action="addshow.jsp" method="POST">
            <div class="mb-3">
                <label for="movie_id" class="form-label">Select Movie</label>
                <select class="form-select" id="movie_id" name="movie_id" required>
                    <option value="">-- Select a Movie --</option>
                    <%
                        while (rs.next()) {
                            int movieId = rs.getInt("id");
                            String movieTitle = rs.getString("title");
                    %>
                    <option value="<%= movieId %>"><%= movieTitle %></option>
                    <%
                        }
                    %>
                </select>
            </div>
            <div class="mb-3">
                <label for="show_time" class="form-label">Show Time</label>
                <input type="datetime-local" class="form-control" id="show_time" name="show_time" required>
            </div>
            <div class="mb-3">
                <label for="theatername" class="form-label">Theater Name</label>
                <input type="text" class="form-control" id="theatername" name="theatername" required>
            </div>
            <button type="submit" class="btn btn-success">Add Show</button>
        </form>

        <%
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            }

            // Process form submission
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                int movieId = Integer.parseInt(request.getParameter("movie_id"));
                String showTime = request.getParameter("show_time");
                String theaterName = request.getParameter("theatername");

                try {
                    conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
                    String insertSql = "INSERT INTO shows (movie_id, show_time, theatername) VALUES (?, ?, ?)";
                    ps = conn.prepareStatement(insertSql);
                    ps.setInt(1, movieId);
                    ps.setString(2, showTime);
                    ps.setString(3, theaterName);

                    int result = ps.executeUpdate();
                    if (result > 0) {
                        out.println("<div class='alert alert-success'>Show added successfully!</div>");
                    } else {
                        out.println("<div class='alert alert-danger'>Failed to add show.</div>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<div class='alert alert-danger'>An error occurred while adding the show.</div>");
                } finally {
                    if (ps != null) ps.close();
                    if (conn != null) conn.close();
                }
            }
        %>
    </div>
</body>
</html>
