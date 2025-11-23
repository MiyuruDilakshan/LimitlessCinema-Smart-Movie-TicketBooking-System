<%-- 
    Document   : homepage
    Created on : Dec 6, 2024, 1:08:54 PM
    Author     : nadee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="CSS/homepage.css" rel="stylesheet" type="text/css"/>
    <link href='https://fonts.googleapis.com/css?family=Urbanist' rel='stylesheet'>
    <link href='https://fonts.googleapis.com/css?family=Plus Jakarta Sans' rel='stylesheet'>
    <title>Limitless Cinema</title>
</head>
<body>
    <!-- navigation bar -->
    <nav class="navbar">
        <div class="container">
            <div class="logo">
               <a href="homepage.jsp">LIMITLESS CINEMA </a>
            </div>
            <ul class="nav-links">
                <li><a href="homepage.jsp">Home</a></li>
                <li><a href="movies.jsp">Movies</a></li>
                 <li><a href="aboutus.jsp">About</a></li>
                <li><a href="feedback.jsp">Feedback</a></li>
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


<br><br><br><br>
    <section class="hero-section">
        <div class="hero-content">
          <h4>Enjoy Your Movie Today</h4>
          <h1>Welcome to Your Cinema Hall of <br>Choice</h1>
          <p>
            Discover a world of cinematic magic at our cinema hall. Enjoy a wide<br>
            selection of blockbuster movies, timeless classics, and exclusive<br>
            screenings on the big screen in stunning HD quality. Immerse<br> yourself in
            the experience and find your next favorite film today!
            
          </p>
          <div class="hero-buttons">
            <a href="#" id="view-button" class="btn btn-primary">View</a>
            <a href="#" id="book-button" class="btn btn-secondary">Book Tickets</a>
          </div>
        </div>
      
        <div class="hero-carousel">
          <div class="carousel-wrapper">
            <div class="carousel-item active" data-title="Movie 1" data-view-link="#view1" data-book-link="#book1">
            
              <img src="Movie images/Top Gun 2022.jpg" alt="Movie 1"/>
            </div>
            <div class="carousel-item" data-title="Movie 2" data-view-link="#view2" data-book-link="#book2">
              <img src="Movie images/Garfield.jpg" alt="Movie 2">
            </div>
            <div class="carousel-item" data-title="Movie 3" data-view-link="#view3" data-book-link="#book3">
              <img src="Movie images/X files.jpg" alt="Movie 3">
            </div>
          </div>
          <div class="carousel-controls">
            <button class="carousel-control prev">&lt;</button>
            <button class="carousel-control next">&gt;</button>
          </div>
        </div>
      </section>
      
    







      <section class="movie-gallery">
        <h2 class="movie-title">COMING SOON</h2>
        <div class="movie-slider">
          <div class="movie-track">
            <div class="movie-item">
              <img src="Movie images/Amaran.jpg" alt="Movie 1">
              <div class="hover-overlay">
                <a href="trailer1-link" class="watch-trailer-btn">Watch Trailer</a>
                <p id="umovie1" class="movie-name">Amaran</p>
                <p class="release-date">In theaters Dec 06, 2024</p>
              </div>
            </div>
            <div class="movie-item">
              <img src="Movie images/Casablanca.jpg" alt="Movie 2">
              <div class="hover-overlay">
                <a href="trailer2-link" class="watch-trailer-btn">Watch Trailer</a>
                <p id="umovie2" class="movie-name">Casablanca</p>
                <p class="release-date">In theaters Dec 06, 2024</p>
              </div>
            </div>
            <div class="movie-item">
              <img src="Movie images/Dark Knight.jpg" alt="Movie 3">
              <div class="hover-overlay">
                <a href="trailer3-link" class="watch-trailer-btn">Watch Trailer</a>
                <p id="umovie3" class="movie-name">Dark Knight</p>
                <p class="release-date">In theaters Dec 06, 2024</p>
              </div>
            </div>
            <div class="movie-item">
              <img src="Movie images/Fighter street.jpg" alt="Movie 4">
              <div class="hover-overlay">
                <a href="trailer4-link" class="watch-trailer-btn">Watch Trailer</a>
                <p id="umovie4" class="movie-name">Fighter street</p>
                <p class="release-date">In theaters Dec 06, 2024</p>
              </div>
            </div>
            <div class="movie-item">
              <img src="Movie images/Garfield.jpg" alt="Movie 5">
              <div class="hover-overlay">
                <a href="https://youtu.be/IeFWNtMo1Fs?si=P0zly32_TOZnf68v" class="watch-trailer-btn">Watch Trailer</a>
                <p id="umovie5" class="movie-name">Garfield</p>
                <p class="release-date">In theaters Dec 06, 2024</p>
              </div>
            </div>
            <div class="movie-item">
              <img src="Movie images/Goodfellas.jpg" alt="Movie 6">
              <div class="hover-overlay">
                <a href="trailer6-link" class="watch-trailer-btn">Watch Trailer</a>
                <p id="umovie6" class="movie-name">Goodfellas</p>
                <p class="release-date">In theaters Dec 06, 2024</p>
              </div>
            </div>
            <div class="movie-item">
              <img src="Movie images/Joker 2024.jpg" alt="Movie 7">
              <div class="hover-overlay">
                <a href="trailer7-link" class="watch-trailer-btn">Watch Trailer</a>
                <p id="umovie7" class="movie-name">Joker 2024</p>
                <p class="release-date">In theaters Dec 06, 2024</p>
              </div>
            </div>
            <div class="movie-item">
              <img src="Movie images/Passport.jpg" alt="Movie 8">
              <div class="hover-overlay">
                <a href="trailer8-link" class="watch-trailer-btn">Watch Trailer</a>
                <p id="umovie8" class="movie-name">Passport</p>
                <p class="release-date">In theaters Dec 06, 2024</p>
              </div>
            </div>
          </div>
        </div>
        <button class="slider-btn left-btn">&lt;</button>
        <button class="slider-btn right-btn">&gt;</button>
      </section>

















    
    <!-- Streaming Section -->
<div class="streaming-section">
    <div class="streaming-content">
        <h2>Experience the thrill of the <br>big screen like never <br>before.</h2>
    </div>
    <div class="streaming-button">
         <a href="movies.jsp" class="btn-red">Browse Movies</a>
    </div>
</div>

    <script src="JS/homepage.js" type="text/javascript"></script>
</body>




<!--footer-->



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
<!--end of footer-->



</html>

