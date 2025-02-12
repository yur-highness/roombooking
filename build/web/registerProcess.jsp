<%-- 
    Document   : registerProcess
    Created on : Feb 11, 2025, 12:18:44 AM
    Author     : yurhighness
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<jsp:include page="dbcon.jsp" />

<%
    // Retrieve form data
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");

    // Database connection details
    String dbURL = "jdbc:mysql://localhost:3306/hotelbooking"; // Replace with your database name
    String dbUser = "root"; // Replace with your database username
    String dbPassword = ""; // Replace with your database password

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Load the JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish the database connection
        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        // Check if the username or email already exists
        String checkUserSQL = "SELECT * FROM user_data WHERE username = ? OR email = ?";
        pstmt = conn.prepareStatement(checkUserSQL);
        pstmt.setString(1, username);
        pstmt.setString(2, email);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            // User already exists
            response.sendRedirect("registration.jsp?error=User already exists with this username or email.");
            
        } else {
            // Insert the new user into the database
            String insertSQL = "INSERT INTO user_data (username, password, email, phone, registration_date) VALUES (?, ?, ?, ?, NOW())";
            pstmt = conn.prepareStatement(insertSQL);
            pstmt.setString(1, username);
            pstmt.setString(2, password); // In a real application, hash the password before storing
            pstmt.setString(3, email);
            pstmt.setString(4, phone);

            int rowsInserted = pstmt.executeUpdate();

            if (rowsInserted > 0) {
                // Registration successful
                response.sendRedirect("login.jsp?success=Registration successful. Please login.");
            } else {
                // Registration failed
                response.sendRedirect("register.jsp?error=Registration failed. Please try again.");
            }
        }
    } catch (Exception e) {
        // Handle errors
        e.printStackTrace();
        response.sendRedirect("register.jsp?error=An error occurred: " + e.getMessage());
    } finally {
        // Close database resources
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>