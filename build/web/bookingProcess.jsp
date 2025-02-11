<%-- 
    Document   : bookingProcess
    Created on : Feb 10, 2025, 7:13:08 PM
    Author     : yurhighness
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"  language="java"%>
<%@ page import="java.sql.*, java.text.SimpleDateFormat" %>
<jsp:include page="dbcon.jsp" />
<% 
    // Session validation
    if(session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Get form data
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");
    String checkin = request.getParameter("checkin");
    String checkout = request.getParameter("checkout");
    String roomtype = request.getParameter("roomtype");
    int rooms = Integer.parseInt(request.getParameter("rooms"));
    double totalprice = Double.parseDouble(request.getParameter("totalprice"));

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Online", "root", "");
        
        // Insert booking
        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO book (name, phoneno, email, check_in, check_out, roomtype, noofroom, totalprice, username) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
        
        ps.setString(1, name);
        ps.setString(2, phone);
        ps.setString(3, email);
        ps.setDate(4, Date.valueOf(checkin));
        ps.setDate(5, Date.valueOf(checkout));
        ps.setString(6, roomtype);
        ps.setInt(7, rooms);
        ps.setDouble(8, totalprice);
        ps.setString(9, (String) session.getAttribute("user"));
        
        ps.executeUpdate();
        
        // Update room availability
        PreparedStatement updateRooms = con.prepareStatement(
            "UPDATE room SET available_rooms = available_rooms - ? WHERE room_type = ?");
        updateRooms.setInt(1, rooms);
        updateRooms.setString(2, roomtype);
        updateRooms.executeUpdate();
        
        con.close();
        response.sendRedirect("mybooking.jsp?success=1");
    } catch(Exception e) {
        response.sendRedirect("book.jsp?error=" + e.getMessage());
    }
%>