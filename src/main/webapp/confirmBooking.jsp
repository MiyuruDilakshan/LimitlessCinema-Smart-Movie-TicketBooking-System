<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="CSS/checkout.css" rel="stylesheet" type="text/css"/>
    <title>Booking Confirmation</title>
    <style>
        /* Styles remain the same */
    </style>
</head>
<body>
    <%
        String jdbcURL = "jdbc:mysql://localhost:3308/movie";
        String jdbcUsername = "root";
        String jdbcPassword = "12345678";

        String showId = request.getParameter("showId");
        String totalPrice = request.getParameter("totalPrice");
        String vat = request.getParameter("vat");
        String paidAmount = request.getParameter("paidAmount");
        String name = request.getParameter("name");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String paymentMethod = request.getParameter("payment");
        String transactionId = request.getParameter("transactionId");
        String paymentStatus = "Pending";

        if (showId == null || name == null || email == null) {
    %>
            <div class="container">
                <h1 style="color: red;">Invalid Input!</h1>
                <p>Please provide all required details and try again.</p>
                <a href="checkout.jsp" class="button" style="background-color: #dc3545;">Back to Checkout</a>
            </div>
    <%
        } else {
            try (Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword)) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn.setAutoCommit(false);

                try (PreparedStatement ps = conn.prepareStatement("INSERT INTO orders (show_id, total_price, vat, paid_amount, name, mobile, email, payment_method, payment_status, transaction_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)")) {
                    ps.setInt(1, Integer.parseInt(showId));
                    ps.setDouble(2, Double.parseDouble(totalPrice));
                    ps.setDouble(3, Double.parseDouble(vat));
                    ps.setDouble(4, Double.parseDouble(paidAmount));
                    ps.setString(5, name);
                    ps.setString(6, mobile);
                    ps.setString(7, email);
                    ps.setString(8, paymentMethod);
                    ps.setString(9, paymentStatus);
                    ps.setString(10, transactionId);

                    int result = ps.executeUpdate();

                    if (result > 0) {
                        conn.commit();
    %>
                        <div class="container">
                            <h1>Booking Confirmed!</h1>
                            <p>Details have been sent to <%= email %>.</p>
                            <a href="homepage.jsp" class="button">Back to Home</a>
                        </div>
    <%
                    } else {
                        conn.rollback();
    %>
                        <div class="container">
                            <h1 style="color: red;">Booking Failed!</h1>
                            <p>There was an issue processing your booking. Please try again later.</p>
                            <a href="checkout.jsp" class="button" style="background-color: #dc3545;">Back to Checkout</a>
                        </div>
    <%
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
    %>
                <div class="container">
                    <h1 style="color: red;">Error Occurred!</h1>
                    <p>Database error: Unable to process your request at the moment.</p>
                    <a href="checkout.jsp" class="button" style="background-color: #dc3545;">Back to Checkout</a>
                </div>
    <%
            } catch (Exception e) {
                e.printStackTrace();
    %>
                <div class="container">
                    <h1 style="color: red;">Error Occurred!</h1>
                    <p>An unexpected error occurred. Please try again later.</p>
                    <a href="checkout.jsp" class="button" style="background-color: #dc3545;">Back to Checkout</a>
                </div>
    <%
            }
        }
    %>
</body>
</html>
