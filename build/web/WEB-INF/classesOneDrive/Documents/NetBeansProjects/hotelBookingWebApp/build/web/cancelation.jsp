<%-- 
    Document   : cancelation
    Created on : Feb 10, 2025, 7:15:50 PM
    Author     : yurhighness
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:include page="dbcon.jsp" />
<% 
    if(session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    String bookingId = request.getParameter("booking_id");
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Online", "root", "");
        
        // Get booking details first
        PreparedStatement ps = con.prepareStatement(
            "SELECT room_type, no_of_rooms FROM book WHERE booking_id = ?");
        ps.setString(1, bookingId);
        ResultSet rs = ps.executeQuery();
        
        if(rs.next()) {
            String roomType = rs.getString("room_type");
            int rooms = rs.getInt("no_of_rooms");
            
            // Update room availability
            PreparedStatement updateRooms = con.prepareStatement(
                "UPDATE room SET available_rooms = available_rooms + ? WHERE room_type = ?");
            updateRooms.setInt(1, rooms);
            updateRooms.setString(2, roomType);
            updateRooms.executeUpdate();
            
            // Delete booking
            PreparedStatement deleteBooking = con.prepareStatement(
                "DELETE FROM book WHERE booking_id = ?");
            deleteBooking.setString(1, bookingId);
            deleteBooking.executeUpdate();
        }
        
        con.close();
        response.sendRedirect("mybookings.jsp?success=1");
    } catch(Exception e) {
        response.sendRedirect("mybookings.jsp?error=1");
    }
%>