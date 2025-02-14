<%-- 
    Document   : header
    Created on : Feb 9, 2025, 1:42:45 PM
    Author     : yurhighness
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*, java.text.SimpleDateFormat" %>
<jsp:include page="dbcon.jsp" />




<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Booking</title>
    <!-- Materialize CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" rel="stylesheet">
    <!-- Material Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/styles.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script src="js/script.js"></script>
</head>
<body>

    <nav class="nav-wrapper nav">
        <div class="container">
            <a href="index.jsp" class="brand-logo">Hotel Booking</a>
            <a href="index.jsp" class="sidenav-trigger" data-target="mobile-links">
                <i class="material-icons">menu</i>
            </a>
            <ul class="right hide-on-med-and-down">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="mybooking.jsp">My Booking</a></li>
                <li><a href="book.jsp">Book a Room</a></li>
              
<li>
   <%
    String userEmail = (String) session.getAttribute("user");
     String Admin = (String) session.getAttribute("admin");
%>

<li>
    <% if (userEmail != null) { %>
        Hello, <%= userEmail %>
    <% }
    else if(Admin !=null){ %>
              Hello, <%= Admin %>

  <% }else { %>
        Guest
    <% } %>
</li>
</li>
                
                <li><a href="login.jsp" class="btn waves-effect waves-light">Login</a></li>
                 <li><a href="logout.jsp" class="btn waves-effect waves-light login">Logout</a></li>
                 
 <%
// Admin session validation
if(session.getAttribute("admin") != null && session.getAttribute("admin").equals("admin")) {
%>
    <li><a href="adminDashboad.jsp" class="btn waves-effect waves-light login">Dashboard</a></li>
<%
} else {%>
    <li></li>
<%}
%>

            </ul>
                
        </div>
    </nav>

    <!-- Mobile Navbar -->
    <ul class="sidenav" id="mobile-links">
        <li><a href="index.jsp">Home</a></li>
        <li><a href="mybooking.jsp">My Booking</a></li>
        <li><a href="book.jsp">Book a Room</a></li>
        <li><a href="login.jsp" class="btn waves-effect waves-light login">Login</a></li>
         <li><a href="logout.jsp" class="btn waves-effect waves-light login">Logout</a></li>
    </ul>
    
</body>
</html>
