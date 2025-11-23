# 🎬 Limitless Cinema - Smart Movie Ticket Booking System


<div align="center">

![Limitless Cinema Banner](https://img.shields.io/badge/Limitless%20Cinema-Movie%20Booking%20Platform-E50914?style=for-the-badge)
[![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)](https://www.oracle.com/java/)
[![Jakarta EE](https://img.shields.io/badge/Jakarta%20EE-007396?style=for-the-badge&logo=java&logoColor=white)](https://jakarta.ee/)
[![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![PayPal](https://img.shields.io/badge/PayPal-00457C?style=for-the-badge&logo=paypal&logoColor=white)](https://developer.paypal.com/)

**A comprehensive full-stack web application revolutionizing the cinema experience with seamless booking, payment processing, and administrative management**

[View Demo](#) • [Report Bug](https://github.com/yourusername/MovieTicketBooking/issues) • [Request Feature](https://github.com/yourusername/MovieTicketBooking/issues)

</div>

---

## 🌟 Overview

Limitless Cinema is not just another booking platform—it's a complete cinema management ecosystem built from the ground up. This enterprise-grade application combines robust backend architecture with an intuitive user interface to deliver a seamless movie-going experience. From browsing the latest blockbusters to securing your preferred seats and processing payments, every aspect has been engineered for efficiency and user satisfaction.

### 🎯 The Problem I Solved

Traditional cinema booking systems often suffer from:
- Cumbersome booking processes with multiple redirects
- Lack of real-time seat availability
- Insecure payment gateways
- Poor administrative oversight
- Limited user engagement and feedback mechanisms
- No automated confirmation systems

### 💡 My Solution

A full-stack Java EE web application providing seamless integration of movie browsing, intelligent seat selection, secure payment processing with PayPal, automated email confirmations, and comprehensive admin controls—all unified in one powerful platform.

---

## ✨ Key Features

### 🎥 **Dynamic Movie Catalog**
- Real-time movie listings with detailed information
- Genre-based categorization
- Rating and duration display
- High-quality movie posters and imagery
- Comprehensive cast and crew information
- Movie descriptions and trailers

### 🪑 **Interactive Seat Booking System**
- Visual seat map with real-time availability
- Smart seat selection with instant feedback
- Multiple seat booking capability
- Automatic price calculation
- Row and seat number identification
- Booked seat status indicators

### 💳 **Secure Payment Integration**
- PayPal REST API integration
- Multiple payment method support
- Real-time transaction processing
- Automatic VAT calculation (15%)
- Transaction ID generation and tracking
- Payment status verification

### 📧 **Automated Email Confirmation**
- Jakarta Mail API integration
- Instant booking confirmations
- Detailed ticket information in emails
- Professional HTML email templates
- SMTP secure connection
- Failed payment notifications

### 👨‍💼 **Comprehensive Admin Dashboard**
- **Movie Management**: Add, update, and delete movies
- **Show Management**: Schedule movie showtimes and theaters
- **Feedback Analytics**: View and analyze customer feedback
- **User Management**: Track bookings and user activity
- **Secure Authentication**: Admin login with validation
- **Intuitive Interface**: Bootstrap-powered responsive design

### 💬 **User Feedback System**
- Star rating mechanism
- Detailed feedback submission
- Admin feedback dashboard
- Customer satisfaction tracking
- Database-driven feedback storage

### 🔐 **Robust Database Architecture**
- Optimized MySQL schema
- Relational data integrity
- Efficient query performance
- Transaction management
- Connection pooling
- Prepared statements for SQL injection prevention

---

## 🛠️ Technology Stack

### **Backend**
- **Java** - Core application logic
- **Jakarta Servlet API 5.0** - Request/response handling
- **Jakarta Mail API 2.1** - Email automation
- **Apache Tomcat 10.1** - Application server
- **Maven** - Dependency management and build automation

### **Frontend**
- **JSP (JavaServer Pages)** - Dynamic content generation
- **HTML5 & CSS3** - Modern, responsive UI
- **JavaScript (Vanilla)** - Client-side interactivity
- **Bootstrap 5.2.3** - Responsive design framework
- **Custom CSS** - Tailored styling and animations

### **Database**
- **MySQL 8.0** - Relational database management
- **JDBC Driver** - Database connectivity
- **Custom DB Connection Utility** - Optimized connection handling

### **Payment Gateway**
- **PayPal REST API SDK 1.14.0** - Secure payment processing
- **OAuth 2.0** - Payment authorization
- **Sandbox Environment** - Testing and development

### **Third-Party Integrations**
- **Google Fonts** - Urbanist & Plus Jakarta Sans typography
- **Bootstrap Icons** - UI icon library
- **Jakarta Mail** - SMTP email service
- **PayPal Developer API** - Payment processing

---

## 🏗️ System Architecture

```
┌──────────────────────────────────────────────────────┐
│                  Client Browser                       │
│              (JSP Pages + JavaScript)                 │
└───────────────────┬──────────────────────────────────┘
                    │
                    │ HTTP Requests
                    ▼
┌──────────────────────────────────────────────────────┐
│            Apache Tomcat Server 10.1                  │
│                                                       │
│  ┌─────────────────────────────────────────────┐    │
│  │         Jakarta Servlet Layer                │    │
│  │  ┌──────────────┐  ┌──────────────────┐    │    │
│  │  │ShowMovies    │  │CheckoutServlet   │    │    │
│  │  │Servlet       │  │                  │    │    │
│  │  └──────────────┘  └──────────────────┘    │    │
│  │  ┌──────────────┐  ┌──────────────────┐    │    │
│  │  │Payment       │  │EmailServlet      │    │    │
│  │  │Servlet       │  │                  │    │    │
│  │  └──────────────┘  └──────────────────┘    │    │
│  └─────────────────────────────────────────────┘    │
│                                                       │
│  ┌─────────────────────────────────────────────┐    │
│  │          Business Logic Layer                │    │
│  │  ┌──────────────┐  ┌──────────────────┐    │    │
│  │  │Movie Model   │  │DBConnection1     │    │    │
│  │  └──────────────┘  └──────────────────┘    │    │
│  └─────────────────────────────────────────────┘    │
└───────────────────┬──────────────────────────────────┘
                    │
        ┌───────────┼───────────┐
        │           │           │
        ▼           ▼           ▼
┌──────────┐  ┌──────────┐  ┌──────────┐
│  MySQL   │  │ PayPal   │  │  SMTP    │
│ Database │  │   API    │  │  Server  │
└──────────┘  └──────────┘  └──────────┘
```

---

## 🚀 Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:
- **Java Development Kit (JDK)** 11 or higher
- **Apache Tomcat** 10.1.x
- **MySQL Server** 8.0 or higher
- **Apache Maven** 3.6 or higher
- **Git** (for cloning the repository)
- **IDE** (IntelliJ IDEA, Eclipse, or NetBeans recommended)

### Installation

#### 1️⃣ Clone the Repository

```bash
git clone https://github.com/MiyuruDilakshan/LimitlessCinema-Smart-Movie-TicketBooking-System.git
cd LimitlessCinema-Smart-Movie-TicketBooking-System
```

#### 2️⃣ Database Setup

```sql
-- Create database
CREATE DATABASE movie;
USE movie;

-- Create movies table
CREATE TABLE movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    genre VARCHAR(100),
    duration INT,
    rating FLOAT,
    description TEXT,
    image_url VARCHAR(500),
    actors TEXT,
    directed_by VARCHAR(255),
    produced_by VARCHAR(255),
    written_by VARCHAR(255),
    music_by VARCHAR(255)
);

-- Create shows table
CREATE TABLE shows (
    show_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    show_time DATETIME,
    theater_name VARCHAR(255),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

-- Create orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    show_id INT,
    total_price DOUBLE,
    vat DOUBLE,
    paid_amount DOUBLE,
    name VARCHAR(255),
    mobile VARCHAR(20),
    email VARCHAR(255),
    payment_method VARCHAR(50),
    payment_status VARCHAR(50),
    transaction_id VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (show_id) REFERENCES shows(show_id)
);

-- Create feedback table
CREATE TABLE feedback (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    email VARCHAR(255),
    rating INT,
    detailed_feedback TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

#### 3️⃣ Configure Database Connection

Update database credentials in the following files:
- `src/main/java/Util/DBConnection1.java`
- Servlets (CheckoutServlet, PaymentServlet, ShowMoviesServlet, etc.)

```java
// Database configuration
private static final String DB_URL = "jdbc:mysql://localhost:3308/movie";
private static final String DB_USERNAME = "root";
private static final String DB_PASSWORD = "your_password";
```

#### 4️⃣ Configure Email Service

Update email credentials in `EmailServlet.java`:

```java
Session session = Session.getInstance(props, new jakarta.mail.Authenticator() {
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication("your_email@gmail.com", "your_app_password");
    }
});
```

**Note**: For Gmail, use [App Passwords](https://support.google.com/accounts/answer/185833) instead of your regular password.

#### 5️⃣ Configure PayPal Integration

Update PayPal credentials in `PaymentServlet.java`:

```java
String clientId = "YOUR_PAYPAL_CLIENT_ID";
String clientSecret = "YOUR_PAYPAL_CLIENT_SECRET";
APIContext apiContext = new APIContext(clientId, clientSecret, "sandbox");
```

Get your credentials from [PayPal Developer Dashboard](https://developer.paypal.com/dashboard/).

#### 6️⃣ Build the Project

```bash
# Clean and build with Maven
mvn clean install

# This will create a WAR file in the target directory
# target/MovieTicketBooking.war
```

#### 7️⃣ Deploy to Tomcat

**Option A: Manual Deployment**
```bash
# Copy WAR file to Tomcat webapps directory
cp target/MovieTicketBooking.war /path/to/tomcat/webapps/

# Start Tomcat
cd /path/to/tomcat/bin
./startup.sh  # Linux/Mac
startup.bat   # Windows
```

**Option B: IDE Deployment**
- Configure Tomcat server in your IDE
- Add the project to the server
- Run/Debug the application

#### 8️⃣ Access the Application

Open your browser and navigate to:
```
http://localhost:8080/LimitlessCinema-Smart-Movie-TicketBooking-System/homepage.jsp
```

Admin Panel:
```
http://localhost:8080/LimitlessCinema-Smart-Movie-TicketBooking-System/admin_login.jsp
```

---

## 📂 Project Structure

```
LimitlessCinema-Smart-Movie-TicketBooking-System/
├── pom.xml                          # Maven configuration
├── src/
│   └── main/
│       ├── java/
│       │   ├── model/
│       │   │   └── Movie.java        # Movie entity model
│       │   ├── Servlets/
│       │   │   ├── CheckoutServlet.java
│       │   │   ├── EmailServlet.java
│       │   │   ├── PaymentServlet.java
│       │   │   ├── PaymentSuccessServlet.java
│       │   │   └── ShowMoviesServlet.java
│       │   └── Util/
│       │       └── DBConnection1.java # Database utility
│       └── webapp/
│           ├── aboutus.jsp
│           ├── admin_login.jsp
│           ├── cast.jsp
│           ├── checkout.jsp
│           ├── confirmBooking.jsp
│           ├── feedback.jsp
│           ├── homepage.jsp
│           ├── index.jsp
│           ├── movies.jsp
│           ├── paymentSuccess.jsp
│           ├── admin/
│           │   ├── add_movie.jsp
│           │   ├── add-show.jsp
│           │   ├── admin-feedback.jsp
│           │   ├── delete_movie.jsp
│           │   ├── movies.jsp
│           │   └── update_movie.jsp
│           ├── CSS/
│           │   ├── aboutus.css
│           │   ├── admin_login.css
│           │   ├── adminMovie.css
│           │   ├── cast.css
│           │   ├── checkout.css
│           │   ├── css.css
│           │   ├── feedback.css
│           │   ├── homepage.css
│           │   ├── movies.css
│           │   ├── seatbooking.css
│           │   └── terms_conditions.css
│           ├── JS/
│           │   ├── admin_login.js
│           │   ├── homepage.js
│           │   ├── JS.js
│           │   └── seatbooking.js
│           ├── checkout images/
│           ├── Movie images/
│           ├── nav-footer images/
│           └── seat images/
└── README.md
```

---

## 💻 My Contributions

As the **Lead Full-Stack Developer** on this project, I architected and implemented the entire application from concept to deployment:

### 🏛️ **Architecture & Design**
- Designed scalable MVC architecture using Jakarta Servlets and JSP
- Architected normalized database schema with referential integrity
- Created comprehensive system documentation and ER diagrams
- Implemented RESTful design patterns for API endpoints

### 💻 **Backend Development**
- Developed robust servlet layer handling all business logic
- Implemented secure JDBC connections with prepared statements
- Built custom database connection utility with connection pooling
- Integrated PayPal REST API for payment processing
- Developed automated email notification system using Jakarta Mail
- Implemented transaction management for data consistency

### 🎨 **Frontend Development**
- Built responsive UI with Bootstrap and custom CSS
- Implemented interactive seat selection with vanilla JavaScript
- Developed dynamic JSP pages with JSTL and EL
- Created intuitive admin dashboard with CRUD operations
- Optimized page load times and user experience
- Designed custom typography and visual hierarchy

### 🔒 **Security Implementation**
- Implemented SQL injection prevention using prepared statements
- Configured secure SMTP connections with TLS
- Integrated PayPal OAuth 2.0 authentication
- Implemented admin authentication system
- Secured payment transaction processing

### 🧪 **Testing & Optimization**
- Conducted comprehensive functionality testing
- Performed database query optimization
- Implemented error handling and validation
- Optimized resource management and connection pooling
- Debugged and resolved production issues

### 📧 **Third-Party Integration**
- PayPal payment gateway integration
- Jakarta Mail SMTP email service
- MySQL database integration
- Google Fonts API integration

---

## 🎯 Key Technical Highlights

### **Servlet Architecture**
Implemented a clean separation of concerns with dedicated servlets for each major operation:
- `ShowMoviesServlet`: Fetches and displays movie catalog
- `CheckoutServlet`: Handles booking data processing
- `PaymentServlet`: Processes PayPal transactions
- `EmailServlet`: Sends automated confirmation emails

### **Database Optimization**
- Connection pooling for improved performance
- Prepared statements preventing SQL injection
- Optimized queries with proper indexing
- Transaction management ensuring data integrity

### **Payment Processing**
Integrated complete PayPal payment flow:
1. Order creation with itemized billing
2. Secure payment authorization
3. Payment execution and verification
4. Transaction ID tracking and storage

### **Email Automation**
Implemented professional email confirmations:
- HTML-formatted emails with booking details
- Automatic sending on successful payment
- Error handling for failed deliveries

---

## 🎬 User Flow

### **Customer Journey**
1. **Browse Movies**: View available movies with details
2. **Select Show**: Choose preferred movie and showtime
3. **Book Seats**: Interactive seat selection interface
4. **Checkout**: Enter personal details and review order
5. **Payment**: Secure PayPal payment processing
6. **Confirmation**: Automated email with booking details

### **Admin Operations**
1. **Login**: Secure authentication
2. **Manage Movies**: Add, update, or delete movies
3. **Manage Shows**: Schedule showtimes and theaters
4. **View Feedback**: Analyze customer satisfaction
5. **Track Bookings**: Monitor orders and transactions

---

## 🔮 Future Enhancements

### **Phase 1: Advanced Features**
- User registration and login system
- Booking history and profile management
- QR code ticket generation
- Mobile app version (Android/iOS)

### **Phase 2: AI Integration**
- Movie recommendation engine
- Predictive analytics for popular shows
- Chatbot customer support
- Sentiment analysis on feedback

### **Phase 3: Enhanced Experience**
- Virtual seat preview (3D visualization)
- Food and beverage pre-ordering
- Loyalty rewards program
- Multi-language support

### **Phase 4: Business Intelligence**
- Advanced analytics dashboard
- Revenue forecasting
- Occupancy rate optimization
- Marketing campaign integration

---

## 🐛 Troubleshooting

### Common Issues and Solutions

**Issue**: Database connection fails
```bash
Solution: 
1. Verify MySQL is running
2. Check database credentials
3. Ensure database 'movie' exists
4. Update JDBC URL with correct port
```

**Issue**: Email not sending
```bash
Solution:
1. Enable 'Less secure app access' in Gmail
2. Use App Password instead of regular password
3. Check SMTP settings (port 587, TLS enabled)
4. Verify email credentials
```

**Issue**: PayPal payment fails
```bash
Solution:
1. Verify PayPal credentials (client ID & secret)
2. Ensure sandbox mode is enabled for testing
3. Check API context configuration
4. Review PayPal developer dashboard logs
```

**Issue**: Tomcat deployment error
```bash
Solution:
1. Clean and rebuild with 'mvn clean install'
2. Delete old WAR from webapps directory
3. Check Tomcat logs for specific errors
4. Verify Java version compatibility
```

---

## 📊 Database Schema

### **Movies Table**
| Column | Type | Description |
|--------|------|-------------|
| movie_id | INT (PK) | Unique movie identifier |
| title | VARCHAR(255) | Movie title |
| genre | VARCHAR(100) | Movie genre |
| duration | INT | Runtime in minutes |
| rating | FLOAT | Movie rating |
| description | TEXT | Movie synopsis |
| image_url | VARCHAR(500) | Poster image URL |

### **Orders Table**
| Column | Type | Description |
|--------|------|-------------|
| order_id | INT (PK) | Unique order identifier |
| show_id | INT (FK) | Reference to show |
| total_price | DOUBLE | Base ticket price |
| vat | DOUBLE | 15% VAT amount |
| paid_amount | DOUBLE | Total amount paid |
| name | VARCHAR(255) | Customer name |
| mobile | VARCHAR(20) | Contact number |
| email | VARCHAR(255) | Email address |
| payment_method | VARCHAR(50) | Payment type |
| payment_status | VARCHAR(50) | Transaction status |
| transaction_id | VARCHAR(255) | PayPal transaction ID |

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🔗 Links

**Project Repository**: [https://github.com/MiyuruDilakshan/LimitlessCinema-Smart-Movie-TicketBooking-System](https://github.com/MiyuruDilakshan/LimitlessCinema-Smart-Movie-TicketBooking-System)

**Live Demo**: [Coming Soon](#)

---

## 📞 Contact

- 📧 **Email**: [Miyurudilakshan@gmail.com](mailto:Miyurudilakshan@gmail.com)
- 🌐 **Website**: [miyuru.dev](https://miyuru.dev)
- 💼 **LinkedIn**: [linkedin.com/in/miyurudilakshan](https://www.linkedin.com/in/miyurudilakshan/)
- 🐙 **GitHub**: [github.com/miyurudilakshan](https://github.com/miyurudilakshan)

---

## 🙏 Acknowledgments

- **Jakarta EE Community** for comprehensive enterprise Java specifications
- **PayPal Developer Platform** for robust payment API documentation
- **Bootstrap Team** for the excellent responsive framework
- **MySQL** for reliable database management
- **Apache Tomcat** for powerful servlet container
- **Stack Overflow Community** for technical guidance and solutions

---

<div align="center">

**Built with ☕ and passion for cinema**

*Transforming the movie-going experience, one booking at a time*

⭐ **Star this repository if you found it helpful!** ⭐

</div>
