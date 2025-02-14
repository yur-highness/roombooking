<%-- 
    Document   : cancelation
    Created on : Feb 10, 2025, 7:15:50 PM
    Author     : yurhighness
--%>

<%@page import="java.net.URLEncoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:include page="dbcon.jsp" />
<% 
    // Session validation
    if(session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    String bookingId = request.getParameter("booking_id");
    if(bookingId == null || bookingId.isEmpty()) {
        response.sendRedirect("mybooking.jsp?error=Invalid booking ID");
        return;
    }

    Connection con = null;
    PreparedStatement ps = null;
    PreparedStatement updateRooms = null;
    PreparedStatement deleteBooking = null;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelbooking", "root", "");
        con.setAutoCommit(false); // Start transaction

        // 1. Get booking details
        ps = con.prepareStatement(
            "SELECT num_rooms, room_type FROM booking_data WHERE booking_id = ?");
        ps.setInt(1, Integer.parseInt(bookingId));
        ResultSet rs = ps.executeQuery();
        
        if(!rs.next()) {
            response.sendRedirect("mybooking.jsp?error=Booking not found");
            return;
        }
        
        int rooms = rs.getInt("num_rooms");


        // 2. Update room availability
        updateRooms = con.prepareStatement(
            "UPDATE room SET available_rooms = available_rooms + ? WHERE available_rooms >= ?");
        updateRooms.setInt(1, rooms);
        updateRooms.setInt(2, rooms);
        int roomsUpdated = updateRooms.executeUpdate();

        if(roomsUpdated == 0) {
            con.rollback();
            response.sendRedirect("mybooking.jsp?error=Room update failed");
            return;
        }

        // 3. Delete booking
        deleteBooking = con.prepareStatement(
            "DELETE FROM booking_data WHERE booking_id = ?");
        deleteBooking.setInt(1, Integer.parseInt(bookingId));
        int bookingsDeleted = deleteBooking.executeUpdate();

        if(bookingsDeleted == 0) {
            con.rollback();
            response.sendRedirect("mybooking.jsp?error=Cancellation failed");
            return;
        }

        con.commit(); // Commit transaction
        response.sendRedirect("mybooking.jsp?success=Booking cancelled successfully");
        
    } catch(NumberFormatException e) {
        try { if(con != null) con.rollback(); } catch(SQLException ex) {}
        response.sendRedirect("mybooking.jsp?error=Invalid booking ID format");
    } catch(SQLException | ClassNotFoundException e) {
        try { if(con != null) con.rollback(); } catch(SQLException ex) {}
        response.sendRedirect("mybooking.jsp?error=" + URLEncoder.encode(e.getMessage(), "UTF-8"));
    } finally {
        try { if(ps != null) ps.close(); } catch(SQLException e) {}
        try { if(updateRooms != null) updateRooms.close(); } catch(SQLException e) {}
        try { if(deleteBooking != null) deleteBooking.close(); } catch(SQLException e) {}
        try { if(con != null) con.close(); } catch(SQLException e) {}
    }
%>