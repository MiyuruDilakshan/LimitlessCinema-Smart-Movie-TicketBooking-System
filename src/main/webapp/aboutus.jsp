<%-- 
    Document   : aboutus
    Created on : Dec 6, 2024, 8:30:48 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="CSS/aboutus.css" rel="stylesheet" type="text/css"/>
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
    <section class="about-section">
        <div class="content-container">
            <h1>Limtless Cinemas</h1>
            <p class="description">
                Dedicated toward raising the bar in Sri Lanka’s cinema experience, Limitless aims to provide our patrons with all the flare of old-school movie theaters, coupled with state-of-the-art modernity and comfort, consistent with international standards.
            </p>
            <div class="video-container">
                    <video width="750" height="400" controls>
                        <source src="aboutus video link/Limitless video.mp4" type="video/mp4">
                        Your browser does not support the <code>video</code> tag.
                    </video>
            </video>
            </div>
            <div class="vision-mission">
                <div class="vision">
                    <h2>Vision</h2>
                    <p>To be Sri Lanka's first multi-sensory luxury entertainment company that challenges industry standards by providing creative solutions to customers from all walks of life.</p>
                </div>
                <div class="mission">
                    <h2>Mission</h2>
                    <p>To deliver a spectrum of diversified positive experiences to customers through a portfolio of brands driven by a supportive organizational culture, which aims to maximize the value for all stakeholders.</p>
                </div>
            </div>
        </div>
    </section>
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


