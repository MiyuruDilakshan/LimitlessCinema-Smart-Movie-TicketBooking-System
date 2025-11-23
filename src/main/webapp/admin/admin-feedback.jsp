<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage User Feedback</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1>Manage User Feedback</h1>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Rating</th>
                    <th>Details</th>
                </tr>
            </thead>
            <tbody>
                <!-- Fetch feedback data from the database and display it here -->
                <%
                    // Initialize database connection variables
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        // Establish database connection (Ensure correct JDBC URL, username, password)
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Movie", "root", "password");
                        stmt = conn.createStatement();
                        rs = stmt.executeQuery("SELECT * FROM feedback");

                        // Loop through result set and display data
                        while (rs.next()) {
                            String name = rs.getString("name");
                            String email = rs.getString("email");
                            int rating = rs.getInt("rating");
                            String details = rs.getString("detailed_feedback");
                %>
                <tr>
                    <td><%= name %></td>
                    <td><%= email %></td>
                    <td><%= rating %></td>
                    <td><%= details %></td>
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
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
