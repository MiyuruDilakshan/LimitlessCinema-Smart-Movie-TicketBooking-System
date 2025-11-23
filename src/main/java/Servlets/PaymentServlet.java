package Servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import com.paypal.api.payments.*;
import com.paypal.base.rest.*;

public class PaymentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getParameter("orderId");
        String payerId = request.getParameter("payerId");
        String paymentId = request.getParameter("paymentId");

        // Initialize PayPal API credentials (replace with your actual credentials)
        String clientId = "AX6Mf94xrIsJnyZW8J-RXM1HhUBDtSrs_kmIX07VrlJvmMSgjKVxhopJb0CF_Zpd0RLrOrzIbszo89qM";
        String clientSecret = "EF6kOyTVMZN2doKgcgNqkQ7oesD77yfIm8FZ9lPCT7W0HE94VaYLHeqsOyqHAIUi0-ybVlnLeDX8-n1m";
        
        APIContext apiContext = new APIContext(clientId, clientSecret, "sandbox");

        try {
            Payment payment = Payment.get(apiContext, paymentId);
            PaymentExecution paymentExecution = new PaymentExecution();
            paymentExecution.setPayerId(payerId);
            Payment executedPayment = payment.execute(apiContext, paymentExecution);

            // If payment was successful, update the order in the database
            if ("approved".equals(executedPayment.getState())) {
                // Connect to the database and update the order
                Connection conn = null;
                PreparedStatement pstmt = null;
                String updateOrderSQL = "UPDATE orders SET payment_status = ?, transaction_id = ? WHERE order_id = ?";
                try {
					Class.forName("com.mysql.cj.jdbc.Driver");
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
                try {
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/movie", "root", "12345678");
                    pstmt = conn.prepareStatement(updateOrderSQL);
                    pstmt.setString(1, "Completed");
                    pstmt.setString(2, executedPayment.getId());
                    pstmt.setString(3, orderId);

                    int rowsUpdated = pstmt.executeUpdate();
                    if (rowsUpdated > 0) {
                        // Order successfully updated in database
                        response.sendRedirect("confirmBooking.jsp?orderId=" + orderId);
                    } else {
                        // Error updating order
                        request.setAttribute("errorMessage", "Error processing payment. Please try again.");
                        request.getRequestDispatcher("paymentError.jsp").forward(request, response);
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    request.setAttribute("errorMessage", "Database error: " + e.getMessage());
                    request.getRequestDispatcher("paymentError.jsp").forward(request, response);
                } finally {
                    if (pstmt != null)
						try {
							pstmt.close();
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
                    if (conn != null)
						try {
							conn.close();
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
                }
            } else {
                // Payment was not successful
                request.setAttribute("errorMessage", "Payment failed. Please try again.");
                request.getRequestDispatcher("paymentError.jsp").forward(request, response);
            }
        } catch (PayPalRESTException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "PayPal error: " + e.getMessage());
            request.getRequestDispatcher("paymentError.jsp").forward(request, response);
        }
    }
}
