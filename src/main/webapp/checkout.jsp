<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    // Fetch form data sent from the seat booking page
    String showId = request.getParameter("movieId");
    String totalPrice = request.getParameter("totalPrice");

    // Initialize variables
    double price = 0;
    double vat = 0;
    double paidAmount = 0;

    // Check if the parameters are not null and parse the values
    if (totalPrice != null && !totalPrice.trim().isEmpty()) {
        try {
            price = Double.parseDouble(totalPrice.trim());
            vat = price * 0.15;
            paidAmount = price + vat;
        } catch (NumberFormatException e) {
            // Handle invalid number format gracefully
            price = 0;
            vat = 0;
            paidAmount = 0;
            out.println("<div class='alert alert-danger'>Invalid price format.</div>");
        }
    } else {
        // Handle the error or provide default values if needed
        price = 0;
        vat = 0;
        paidAmount = 0;
    }

    // Null check for showId and seats
    if (showId == null || showId.isEmpty()) {
        showId = "Unknown"; // Provide a default value or handle error
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="CSS/checkout.css" rel="stylesheet" type="text/css"/>
    <link href='https://fonts.googleapis.com/css?family=Urbanist' rel='stylesheet'>
    <link href='https://fonts.googleapis.com/css?family=Plus Jakarta Sans' rel='stylesheet'>
    <title>Limitless Cinema - Checkout</title>
    <style>
        /* Modal and form styles here as per your existing page */
    </style>

    <!-- PayPal JS SDK -->
    <script src="https://www.paypal.com/sdk/js?client-id=AX6Mf94xrIsJnyZW8J-RXM1HhUBDtSrs_kmIX07VrlJvmMSgjKVxhopJb0CF_Zpd0RLrOrzIbszo89qM&currency=LKR"></script>
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
        </div>
    </nav>

    <!-- Checkout Section -->
    <main>
        <section class="checkout-container">
            <!-- Purchase Summary -->
            <div class="purchase-summary">
                <h2>Purchase Summary</h2>
                <p>ADULT Ticket(s): <span>LKR <%= totalPrice != null ? totalPrice : "0" %></span></p>
                <p>VAT Included (15%): <span>LKR <%= String.format("%.2f", vat) %></span></p>
                <p>Paid Amount: <span>LKR <%= String.format("%.2f", paidAmount) %></span></p>
                <hr>
                <h3>Total: <span>LKR <%= String.format("%.2f", paidAmount) %></span></h3>
                <a href="#" class="promo-link" id="promo-link">Have a promo code?</a>
            </div>

            <!-- Payment Form -->
            <form class="payment-form" action="EmailServlet" method="POST" >
                <h2>Select Your Payment Mode</h2>
                <div class="payment-options">
                    <label>
                        <input type="radio" name="payment" value="mastercard" required>
                        <img src="checkout images/visa.png" alt="Visa">
                    </label>
                    <label>
                        <input type="radio" name="payment" value="visa">
                        <img src="checkout images/mastercard.png" alt="Mastercard">
                    </label>
                </div>

                <!-- User Details -->
                <div class="user-details">
                    <label for="name">First & Last Name:</label>
                    <input type="text" id="name" name="name" placeholder="Enter your name" required>

                    <label for="mobile">Mobile Number:</label>
                    <input type="tel" id="mobile" name="mobile" placeholder="Ex: 07XXXXXXXXX" pattern="07[0-9]{8}" required>

                    <label for="email">Email Address:</label>
                    <input type="email" id="email" name="email" placeholder="Enter your email" required>

                    <div id="promo-modal" class="modal">
                        <div class="modal-content">
                            <span class="close-btn" id="close-modal">&times;</span>
                            <h3>Enter Promo Code</h3>
                            <input type="text" id="promo-code" placeholder="Enter your promo code">
                            <button type="button" onclick="applyPromoCode()">Apply</button>
                        </div>
                    </div>

                    <!-- Hidden Fields for Show and Seat Data -->
                    <input type="hidden" name="showId" value="<%= showId %>">
                    <input type="hidden" name="totalPrice" value="<%= String.format("%.2f", paidAmount) %>">
                </div>

                <!-- Action Buttons -->
                <div class="actions">
                    <button type="button" class="back-button" onclick="history.back()">Back</button>
                    <button  type="submit" class="pay-button">Pay Now</button>
                </div>
            </form>

            <!-- PayPal Payment Button -->
            <div id="paypal-button-container">
                <h2>Pay with PayPal</h2>
                <div id="paypal-button"></div>
            </div>
        </section>
    </main>

    <!-- Promo Code Modal -->
    
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

    <!-- JavaScript for Promo Code -->
    <script>
        const modal = document.getElementById("promo-modal");
        const openModalBtn = document.getElementById("promo-link");
        const closeModalBtn = document.getElementById("close-modal");

        openModalBtn.addEventListener("click", function (event) {
            event.preventDefault();
            modal.style.display = "block";
        });

        closeModalBtn.addEventListener("click", function () {
            modal.style.display = "none";
        });

        window.addEventListener("click", function (event) {
            if (event.target === modal) {
                modal.style.display = "none";
            }
        });

        function applyPromoCode() {
            const promoCode = document.getElementById("promo-code").value.trim();
            if (promoCode) {
                alert(`Promo code "${promoCode}" applied!`);
                modal.style.display = "none";
            } else {
                alert("Please enter a promo code.");
            }
        }

        // PayPal Button Configuration
        paypal.Buttons({
            createOrder: function(data, actions) {
                return actions.order.create({
                    purchase_units: [{
                        amount: {
                            value: '<%= String.format("%.2f", paidAmount) %>'
                        }
                    }]
                });
            },
            onApprove: function(data, actions) {
                return actions.order.capture().then(function(details) {
                    alert('Payment successful! ' + details.payer.name.given_name);
                    // You can redirect to another page after successful payment
                    window.location.href = 'confirmBooking.jsp';
                });
            },
            onError: function(err) {
                alert('An error occurred during the payment process. Please try again.');
            }
        }).render('#paypal-button');
    </script>
</body>
</html>
