/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


document.getElementById("loginForm").addEventListener("submit", function(event) {
    event.preventDefault(); // Prevent form submission

    // Hardcoded correct credentials
    const correctUsername = "admin";
    const correctPassword = "123";

    // Get user input
    const username = document.getElementById("username").value;
    const password = document.getElementById("password").value;

    // Error message element
    const errorMessage = document.getElementById("error-message");

    // Validation logic
    if (username === correctUsername && password === correctPassword) {
        window.location.href = "admin/dashboard.jsp"; // Redirect to another page
    } else {
        errorMessage.style.display = "block";
        errorMessage.textContent = "Invalid username or password.";
    }
});
