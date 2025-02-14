<%-- 
    Document   : deleteBooking
    Created on : Feb 14, 2025, 8:48:49 PM
    Author     : yurhighness
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="dbcon.jsp" />
<%
    if(session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String bookingIdParam = request.getParameter("booking_id");
    if(bookingIdParam == null || !bookingIdParam.matches("\\d+")) {
        response.sendRedirect("mybookings.jsp?error=Invalid booking ID");
        return;
    }
    
    int bookingId = Integer.parseInt(bookingIdParam);
    Connection conn = null;
    PreparedStatement ps = null;
    
    PreparedStatement updateRooms = null;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelbooking", "root", "");
        conn.setAutoCommit(false);
        

        
        // 1. Get booking details
        ps = conn.prepareStatement(
            "SELECT num_rooms, room_type FROM booking_data WHERE booking_id = ?");
        ps.setInt(1, bookingId);
        ResultSet rs = ps.executeQuery();
        
        if(!rs.next()) {
            response.sendRedirect("mybookings.jsp?error=Booking not found");
            return;
        }
        
        int rooms = rs.getInt("num_rooms");
 
     
        
        // 2. Update room availability
        updateRooms = conn.prepareStatement(
            "UPDATE room SET available_rooms = available_rooms + ?");
        updateRooms.setInt(1, rooms);
        
        updateRooms.executeUpdate();
        
        // 3. Delete booking
        ps = conn.prepareStatement(
            "DELETE FROM booking_data WHERE booking_id = ?");
        ps.setInt(1, bookingId);
        ps.executeUpdate();
        
        conn.commit();
        response.sendRedirect("adminDashboad.jsp?success=Booking cancelled successfully");
        
    } catch(Exception e) {
        try { if(conn != null) conn.rollback(); } catch(Exception ex) {}
        response.sendRedirect("adminDashboad.jsp?error=" + java.net.URLEncoder.encode(e.getMessage(), "UTF-8"));
    } finally {
        try { if(ps != null) ps.close(); } catch(Exception e) {}
        try { if(updateRooms != null) updateRooms.close(); } catch(Exception e) {}
        try { if(conn != null) conn.close(); } catch(Exception e) {}
    }
%>