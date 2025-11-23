<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
  
    String movieIdParam = request.getParameter("movieId");
    int movieId = Integer.parseInt(movieIdParam);

  
    String jdbcURL = "jdbc:mysql://localhost:3306/Movie";
    String jdbcUsername = "root";
    String jdbcPassword = "password";

  
    String title = "";
    String genre = "";
    int duration = 0;
    float rating = 0.0f;
    String description = "";
    String imageUrl = "";
    String actors = "";
    String directedBy = "";
    String producedBy = "";
    String writtenBy = "";
    String musicBy = "";

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
  
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

   
        String sql = "SELECT title, genre, duration, rating, description, image_url, actors, directed_by, produced_by, written_by, music_by FROM movies WHERE id = ?";
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
            actors = rs.getString("actors");
            directedBy = rs.getString("directed_by");
            producedBy = rs.getString("produced_by");
            writtenBy = rs.getString("written_by");
            musicBy = rs.getString("music_by");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
        if (ps != null) try { ps.close(); } catch (SQLException ignore) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="CSS/cast.css" rel="stylesheet" type="text/css"/>
    <link href='https://fonts.googleapis.com/css?family=Urbanist' rel='stylesheet'>
    <link href='https://fonts.googleapis.com/css?family=Plus Jakarta Sans' rel='stylesheet'>
    <title><%= title %> - Limitless Cinema</title>
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
                <li><a href="#">Feedback</a></li>
            </ul>
            <div class="search-container">
                <input type="checkbox" id="search-toggle" class="search-toggle">
                <label for="search-toggle" class="search-label">
                     <img src="nav-footer images/container.png" alt="Search" class="search-icon"/>
                </label>
                <input type="text" class="search-input" placeholder="Search...">
            </div>
            <div class="login-container">
                <a href="admin_login.jsp" class="login-link">
                    <img src="nav-footer images/login 1.png" alt="Login Icon" class="login-icon"/>
                </a>
            </div>
        </div>
    </nav>
    <!--end of nav bar-->
    
    <!-- Main container -->
    <div class="container2">
        <!-- Background overlay -->
        <img class="background-image2" src="<%= imageUrl %>" alt="<%= title %> Background">
        
        <!-- Content section -->
        <div class="content2">
            <h1 class="title2"><%= title %></h1>
            <div class="subtitle2">NOW SHOWING AT LIMITLESS</div>
            <div class="details2">
                <span class="duration2"><%= duration %> MIN</span>
                <span class="rating2">IMDB RATING <span class="rating-star">★</span> <%= rating %>/10</span>
            </div>
        </div>
    </div>
          
    <!-- Main container with fixed dimensions -->
    <div class="container1">
        <!-- Left section: Story Line -->
        <div class="storyline">
            <h2>Story Line</h2>
            <p><%= description %></p>
            <div class="genres">
                <p><strong>Genres:</strong> <%= genre %></p>
            </div>
            <!-- Button to buy tickets -->
            <div class="buy-ticket">
               <a href="tickets.jsp" class="button-link">
                   <button>Buy Tickets</button>
               </a>
            </div>
        </div>
  
        <div class="cast-team">
            <!-- Cast details -->
            <div class="cast">
                <h2>Cast</h2>
                <ul>
                    <li><strong>Actors:</strong> <%= actors %></li>
                </ul>
            </div>
            <!-- Team details -->
            <div class="team">
                <h2>Team</h2>
                <p><strong>Directed by:</strong> <%= directedBy %></p>
                <p><strong>Produced by:</strong> <%= producedBy %></p>
                <p><strong>Written by:</strong> <%= writtenBy %></p>
                <p><strong>Music by:</strong> <%= musicBy %></p>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="footer-container">
            <div class="footer-left">
                <a href="homepage.jsp" class="footer-brand">LIMITLESS CINEMA</a>
            </div>
            <div class="footer-icons">
                <a href="#" class="social-icon"><img src="nav-footer images/insta.png" alt="Instagram"/></a>
                <a href="#" class="social-icon"><img src="nav-footer images/youtube.png" alt="YouTube"/></a>
                <a href="#" class="social-icon"><img src="nav-footer images/skype.png" alt="Skype"/></a>
            </div>
        </div>
        <div class="footer-bottom">
            <a href="terms_conditions.jsp" class="footer-link">Terms and Conditions</a>
            <a href="#" class="footer-link">Privacy Policy</a>
            <p>CopyRight&copy; 2024</p>
        </div>
    </footer>
</body>
</html>
