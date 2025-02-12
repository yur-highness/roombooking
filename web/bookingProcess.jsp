<%-- 
    Document   : bookingProcess
    Created on : Feb 10, 2025, 7:13:08 PM
    Author     : yurhighness
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
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
    double totalprice = 0.0;
    double baseprice = 0.0;
    double gst = 0.0;

    try {
        totalprice = Double.parseDouble(request.getParameter("totalprice"));
        baseprice = Double.parseDouble(request.getParameter("baseprice"));
        gst = Double.parseDouble(request.getParameter("gst_amount"));
    } catch (NumberFormatException | NullPointerException e) {
        response.sendRedirect("book.jsp?error=Invalid input format");
        return;
    }

    Connection con = null;
    PreparedStatement ps = null;
    PreparedStatement updateRooms = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelbooking", "root", "");
        con.setAutoCommit(false); // Start transaction

        // 1. Insert booking
        
        
        String insertSQL = "INSERT INTO booking_data " +
            "(guest_name, guest_phone, guest_email, checkIn, checkOut, " +
            "room_type, num_rooms, base_price, gst_amount, total_price) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        ps = con.prepareStatement(insertSQL);
        ps.setString(1, name);
        ps.setString(2, phone);
        ps.setString(3, email);
        ps.setString(4, checkin);
        ps.setString(5, checkout);
        ps.setString(6, roomtype);
        ps.setInt(7, rooms);
        ps.setDouble(8, baseprice);
        ps.setDouble(9, gst);
        ps.setDouble(10, totalprice);
        
        int rowsInserted = ps.executeUpdate();
        
        if(rowsInserted == 0) {
            con.rollback();
            response.sendRedirect("book.jsp?error=Booking failed");
            return;
        }

        // 2. Update room availability
        String updateSQL = "UPDATE room SET available_rooms = available_rooms - ?, " +
        "total_Ac_rooms = CASE WHEN ? = 'AC' THEN total_Ac_rooms - ? ELSE total_Ac_rooms END, " +
        "total_nonAc_rooms = CASE WHEN ? = 'non AC' THEN total_nonAc_rooms - ? ELSE total_nonAc_rooms END " +
        "WHERE available_rooms >= ?";
        
      
        updateRooms = con.prepareStatement(updateSQL);
        updateRooms.setInt(1, rooms);  // Deducting rooms from available_rooms
        updateRooms.setString(2, roomtype);  // Checking if it's an AC room
        updateRooms.setInt(3, rooms);  // Deducting rooms from AC count if applicable
        updateRooms.setString(4, roomtype);  // Checking if it's a Non-AC room
        updateRooms.setInt(5, rooms);  // Deducting rooms from Non-AC count if applicable
        updateRooms.setInt(6, rooms);  // Ensuring enough rooms are available

        int roomsUpdated = updateRooms.executeUpdate();
        
        if(roomsUpdated == 0) {
            con.rollback();
            response.sendRedirect("book.jsp?error=Not enough rooms available");
            return;
        }

        con.commit(); // Commit transaction
        response.sendRedirect("mybooking.jsp?success=1");
        
    } catch(SQLException | ClassNotFoundException e) {
        try { if(con != null) con.rollback(); } catch(SQLException ex) {}
        response.sendRedirect("book.jsp?error=" + e.getMessage());
        e.printStackTrace();
    } finally {
        try { if(ps != null) ps.close(); } catch(SQLException e) {}
        try { if(updateRooms != null) updateRooms.close(); } catch(SQLException e) {}
        try { if(con != null) con.close(); } catch(SQLException e) {}
    }
%>