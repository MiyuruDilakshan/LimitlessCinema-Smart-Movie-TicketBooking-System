<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="CSS/admin_login.css" rel="stylesheet" type="text/css"/>
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

    <!-- Login form -->
    <div class="Loginpage">
        <form id="loginForm" class="login-form" onsubmit="return validateLogin(event)">
            <h2 class="admin-heading">Admin Login</h2>
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" class="input-field" placeholder="Enter username" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" class="input-field" placeholder="Enter password" required>
            </div>
            <button type="submit" class="login-button">Login</button>
            <p id="error-message" class="error-message"></p>
        </form>
    </div>

    <script>
        // Function to validate the login credentials
        function validateLogin(event) {
            event.preventDefault(); // Prevent form submission
            
            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;
            
            // Hardcoded admin credentials
            const adminUsername = "admin";
            const adminPassword = "1234";
            
            // Check if the entered credentials match
            if (username === adminUsername && password === adminPassword) {
                // Redirect to add_movie.jsp if credentials are correct
                window.location.href = "admin/add_movie.jsp";
            } else {
                // Show error message if credentials are incorrect
                document.getElementById('error-message').innerText = "Invalid username or password";
            }
        }
    </script>
</body>

<!-- Footer -->
<footer class="footer">
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

    <div class="footer-bottom">
        <a href="terms_conditions.jsp" class="footer-link">Terms and Conditions</a>
        <a href="#" class="footer-link">Privacy Policy</a>
        <p>CopyRight&copy; 2024</p>
    </div>
</footer>
<!-- End of Footer -->

</html>
