<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.io.*, java.util.List" %>
<%@ page import="model.Movie" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="CSS/movies.css" rel="stylesheet" type="text/css"/>
    <link href='https://fonts.googleapis.com/css?family=Urbanist' rel='stylesheet'>
    <link href='https://fonts.googleapis.com/css?family=Plus Jakarta Sans' rel='stylesheet'>
    <title>Limitless Cinema</title>
</head>
<body>
    <!-- navigation bar -->
    <nav class="navbar">
        <div class="container">
            <div class="logo">
                <a href="homepage.jsp">LIMITLESS CINEMA</a>
            </div>
            <ul class="nav-links">
                <li><a href="homepage.jsp">Home</a></li>
                <li><a href="movies.jsp">Movies</a></li>
                <li><a href="aboutus.jsp">About</a></li>
                <li><a href="feedback.jsp">Feedback</a></li>
            </ul>
        </div>
    </nav>
    <!--end of nav bar-->

    <br><br><br>

    <!-- Movie Shows Display -->
    <div class="row">
        <% 
            // Database connection
            String url = "jdbc:mysql://localhost:3308/movie"; // Change to your database name
            String username = "root"; // Change to your DB username
            String password = "12345678"; // Change to your DB password
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                // Establishing connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(url, username, password);

                // Query to get all movies
                String sql = "SELECT * FROM movies";
                stmt = con.createStatement();
                rs = stmt.executeQuery(sql);

                // Loop through result set and display movie details
                while(rs.next()) {
                    String movieId = rs.getString("movie_id");
                    String title = rs.getString("title");
                    String genre = rs.getString("genre");
                    int duration = rs.getInt("duration");
                    float rating = rs.getFloat("rating");
                    String description = rs.getString("description");
                    String imageUrl = rs.getString("image_url");
        %>
            <div class="column">
                <img style="width:200px;" src="<%= imageUrl %>" alt="<%= title %>">
                <h3><%= title %></h3>
                <p><strong>Genre:</strong> <%= genre %></p>
                <p><strong>Duration:</strong> <%= duration %> mins</p>
                <p><strong>Rating:</strong> <%= rating %></p>
                <p><strong>Description:</strong> <%= description %></p>
                
                <!-- Updated Book Seat button with movie details in URL -->
                <a href="seatbooking.jsp?movieId=<%= movieId %>&title=<%= title %>&genre=<%= genre %>&duration=<%= duration %>&rating=<%= rating %>&description=<%= description %>&imageUrl=<%= imageUrl %>" class="btn btn-primary">Book Seat</a>
            </div>
        <% 
                } 
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (con != null) con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </div>
<footer class="footer">
    <!-- Footer Main Section -->
    <div class="footer-container">
        <div class="footer-left">
            <a href="homepage.jsp" class="footer-brand">LIMITLESS CINEMA</a>
        </div>
        <div class="footer-icons">
            <a href="#" class="social-icon">
                 <img src="nav-footer images/insta.png" alt="Instagram"/>
            </a>
            <a href="#" class="social-icon">
                
                <img src="nav-footer images/youtube.png" alt="YouTube"/>
            </a>
            <a href="#" class="social-icon">
               
                <img src="nav-footer images/skype.png" alt="Skype"/>
            </a>
        </div>
    </div>

    <!-- Footer Bottom Section -->
    <div class="footer-bottom">
        
        <a href="terms_conditions.jsp" class="footer-link">Terms and Conditions</a>
        <a href="#" class="footer-link">Privacy Policy</a>
        <p>CopyRight&copy; 2024</p>
    </div>
</footer>
    <script src="JS/homepage.js" type="text/javascript"></script>
</body>
</html>
