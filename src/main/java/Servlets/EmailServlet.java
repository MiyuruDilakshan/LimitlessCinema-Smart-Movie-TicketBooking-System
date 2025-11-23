package Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.mail.*;
import jakarta.mail.internet.*;
import java.io.IOException;
import java.util.Properties;



public class EmailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form data
        String name = request.getParameter("name");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String showId = request.getParameter("showId");
        String totalPrice = request.getParameter("totalPrice");
    
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // Create a session with your email details
        Session session = Session.getInstance(props, new jakarta.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("javaproject433@gmail.com", "nwrc bngm kpsw nflo");
            }
        });

        try {
            // Create the email message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("javaproject433@gmail.com"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject("Payment Confirmation - Limitless Cinema");

            // Set the email content
            String emailContent = "<h3>Payment Confirmation</h3>"
                    + "<p>Name: " + name + "</p>"
                    + "<p>Mobile: " + mobile + "</p>"
                    + "<p>Email: " + email + "</p>"
                    + "<p>Show ID: " + showId + "</p>"
                    + "<p>Total Price: " + totalPrice + " LKR</p>"
                    + "<p>Thank you for your purchase!</p>";

            message.setContent(emailContent, "text/html");

            // Send the email
            Transport.send(message);
            response.sendRedirect("paymentSuccess.jsp"); // Redirect to success page
        } catch (MessagingException e) {
            e.printStackTrace();
            response.sendRedirect("paymentFailure.jsp"); // Redirect to failure page
        }
    }
}

