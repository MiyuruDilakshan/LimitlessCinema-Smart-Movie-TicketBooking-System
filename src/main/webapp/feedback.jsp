<%-- 
    Document   : feedback
    Created on : Dec 12, 2024, 20:01:54 PM
    Author     : miyuru
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link href="CSS/feedback.css" rel="stylesheet" type="text/css" />
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
                            <img src="nav-footer images/container.png" alt="Search" class="search-icon" />
                        </label>
                        <input type="text" class="search-input" placeholder="Search...">
                    </div>
                    <div class="login-container">
                        <a href="admin_login.jsp" class="login-link">
                            <img src="nav-footer images/login 1.png" alt="Login Icon" class="login-icon" />

                        </a>
                    </div>

                </div>
            </nav>
            <!--end of nav bar-->


            <div class="container1">
                <h1>Feedback</h1>
                 <form id="feedbackForm" action="${pageContext.request.contextPath}/submitFeedback" method="post">
             <!-- Input fields -->
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" id="name" name="name" required>
                        <div class="error" id="nameError"></div>
                    </div>
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" required>
                        <div class="error" id="emailError"></div>
                    </div>
                    <div class="form-group">
                        <label>Rating:</label>
                        <div class="star-rating">
                            <input type="radio" id="star5" name="rating" value="5"><label for="star5">★</label>
                            <input type="radio" id="star4" name="rating" value="4"><label for="star4">★</label>
                            <input type="radio" id="star3" name="rating" value="3"><label for="star3">★</label>
                            <input type="radio" id="star2" name="rating" value="2"><label for="star2">★</label>
                            <input type="radio" id="star1" name="rating" value="1" required><label for="star1">★</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="feedback">Detailed Feedback:</label>
                        <textarea id="feedback" name="feedback" cols="80" rows="5" required></textarea>
                    </div>
                    <button type="submit">Submit Feedback</button>
               </form>

            </div>



            <!--footer-->
            <footer class="footer">
                <!-- Footer Main Section -->
                <div class="footer-container">
                    <div class="footer-left">
                        <a href="homepage.jsp" class="footer-brand">LIMITLESS CINEMA</a>
                    </div>
                    <div class="footer-icons">
                        <a href="#" class="social-icon">
                            <img src="nav-footer images/insta.png" alt="Instagram" />
                        </a>
                        <a href="#" class="social-icon">

                            <img src="nav-footer images/youtube.png" alt="YouTube" />
                        </a>
                        <a href="#" class="social-icon">

                            <img src="nav-footer images/skype.png" alt="Skype" />
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

            
            <script>
                document.getElementById('feedbackForm').addEventListener('submit', function (e) {
                    let valid = true;
                    const name = document.getElementById('name');
                    const email = document.getElementById('email');

                    // Clear previous errors
                    document.getElementById('nameError').textContent = '';
                    document.getElementById('emailError').textContent = '';

                    // Name validation
                    if (name.value.trim() === '') {
                        document.getElementById('nameError').textContent = 'Name is required.';
                        valid = false;
                    }

                    // Email validation
                    if (email.value.trim() === '') {
                        document.getElementById('emailError').textContent = 'Email is required.';
                        valid = false;
                    } else if (!/^\S+@\S+\.\S+$/.test(email.value)) {
                        document.getElementById('emailError').textContent = 'Invalid email format.';
                        valid = false;
                    }

                    if (!valid) e.preventDefault();
                });
            </script>
        </body>

        </html>