<%-- 
    Document   : updateRooms
    Created on : Feb 14, 2025, 8:26:51 PM
    Author     : yurhighness
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="dbcon.jsp" />
<%@ page import="java.sql.*" %>



<% 
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String acRoomsParam = request.getParameter("acRooms");
    String nonacRoomsParam = request.getParameter("nonacRooms");

    // Debugging statements
    System.out.println("acRoomsParam: " + acRoomsParam);
    System.out.println("nonacRoomsParam: " + nonacRoomsParam);

    if (acRoomsParam == null || nonacRoomsParam == null) {
        response.sendRedirect("errorPage.jsp?error=Missing parameter");
        return;
    }

    try {
        int totalAcRooms = Integer.parseInt(acRoomsParam);
        int totalnonRooms = Integer.parseInt(nonacRoomsParam);

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelbooking", "root", "");

        PreparedStatement ps = con.prepareStatement(
            "UPDATE room SET total_Ac_rooms = total_Ac_rooms + ?, available_rooms = available_rooms + ? ");
        ps.setInt(1, totalAcRooms);
        ps.setInt(2, totalAcRooms); // Reset available rooms
        ps.executeUpdate();

        PreparedStatement ps5 = con.prepareStatement(
            "UPDATE room SET total_NonAc_rooms = total_NonAc_rooms + ?, available_rooms = available_rooms + ? ");
        ps5.setInt(1, totalnonRooms);
        ps5.setInt(2, totalnonRooms); // Reset available rooms
        ps5.executeUpdate();

        con.close();
        response.sendRedirect("adminDashboad.jsp?success=1");
    } catch (NumberFormatException e) {
        response.sendRedirect("errorPage.jsp?error=Invalid number format");
    } catch (Exception e) {
        response.sendRedirect("errorPage.jsp?error=" + e.getMessage());
    } 
%>
