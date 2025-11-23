package Servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class PaymentSuccessServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getParameter("orderId");

        // Fetch the order details from the database
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String selectOrderSQL = "SELECT * FROM orders WHERE order_id = ?";
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/movie", "root", "12345678");
            pstmt = conn.prepareStatement(selectOrderSQL);
            pstmt.setString(1, orderId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                // Retrieve order details from the result set
                String seats = rs.getString("seats");
                double totalPrice = rs.getDouble("total_price");
                double vat = rs.getDouble("vat");
                double paidAmount = rs.getDouble("paid_amount");
                String name = rs.getString("name");
                String mobile = rs.getString("mobile");
                String email = rs.getString("email");

                // Set order details in request attributes
                request.setAttribute("orderId", orderId);
                request.setAttribute("seats", seats);
                request.setAttribute("totalPrice", totalPrice);
                request.setAttribute("vat", vat);
                request.setAttribute("paidAmount", paidAmount);
                request.setAttribute("name", name);
                request.setAttribute("mobile", mobile);
                request.setAttribute("email", email);

                // Forward to the confirmation page
                request.getRequestDispatcher("confirmBooking.jsp").forward(request, response);
            } else {
                // Order not found
                request.setAttribute("errorMessage", "Order not found.");
                request.getRequestDispatcher("paymentError.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("paymentError.jsp").forward(request, response);
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
