package Servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class CheckoutServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve data from the form
        String showId = request.getParameter("showId");
      
        String totalPrice = request.getParameter("totalPrice");
        String name = request.getParameter("name");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String paymentMethod = request.getParameter("payment");
        
        // Parse total price for calculations
        double price = Double.parseDouble(totalPrice);
        double vat = price * 0.15;
        double paidAmount = price + vat;

        // Save the order to the database (example using MySQL)
        Connection conn = null;
        PreparedStatement pstmt = null;
        String insertOrderSQL = "INSERT INTO orders (show_id, total_price, vat, paid_amount, name, mobile, email, payment_method) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        try {
            // Database connection setup (replace with your own database connection details)
            String dbUrl = "jdbc:mysql://localhost:3308/movie";
            String dbUser = "root";
            String dbPassword = "12345678";
            conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
            
            pstmt = conn.prepareStatement(insertOrderSQL);
            pstmt.setString(1, showId);
          
            pstmt.setDouble(3, price);
            pstmt.setDouble(4, vat);
            pstmt.setDouble(5, paidAmount);
            pstmt.setString(6, name);
            pstmt.setString(7, mobile);
            pstmt.setString(8, email);
            pstmt.setString(9, paymentMethod);
            
            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                // Successful order insertion
                // Redirect user to the payment page (or handle PayPal integration)
                response.sendRedirect("movies.jsp?orderId=" + showId);
            } else {
                // Order not saved, handle error
                request.setAttribute("errorMessage", "There was an error processing your order.");
                request.getRequestDispatcher("seatbooking.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("seatbooking.jsp").forward(request, response);
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
