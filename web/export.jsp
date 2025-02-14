<%-- 
    Document   : export
    Created on : Feb 15, 2025, 12:34:29 AM
    Author     : yurhighness
--%>

<%@page import="java.sql.*, java.io.*, com.itextpdf.text.*, com.itextpdf.text.pdf.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Check authentication
    if(session.getAttribute("user") == null && session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String exportType = request.getParameter("type");
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelbooking", "root", "");
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT * FROM booking_data");

        if("csv".equalsIgnoreCase(exportType)) {
            // CSV Export
            response.setContentType("text/csv");
            response.setHeader("Content-Disposition", "attachment; filename=bookings.csv");
            
            PrintWriter out = response.getWriter();
            // Write CSV Header
            out.println("Booking ID,Guest Name,Email,Phone,Check-in,Check-out,Room Type,Rooms,Total Price");

            while(rs.next()) {
                out.printf("\"%d\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",%d,%.2f%n",
                    rs.getInt("booking_id"),
                    rs.getString("guest_name"),
                    rs.getString("guest_email"),
                    rs.getString("guest_phone"),
                    rs.getDate("checkIn"),
                    rs.getDate("checkOut"),
                    rs.getString("room_type"),
                    rs.getInt("num_rooms"),
                    rs.getDouble("totalprice"));
            }
            out.flush();

        } else if("pdf".equalsIgnoreCase(exportType)) {
            // PDF Export
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=bookings.pdf");

            Document document = new Document();
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();

            // Add Title
            Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18);
            Paragraph title = new Paragraph("Booking Report", titleFont);
            title.setAlignment(Element.ALIGN_CENTER);
            document.add(title);
            document.add(Chunk.NEWLINE);

            // Create PDF Table
            PdfPTable table = new PdfPTable(8);
            table.setWidthPercentage(100);
            
            // Table Headers
            String[] headers = {"ID", "Name", "Email", "Phone", "Check-in", "Check-out", "Room Type", "Total Price"};
            for(String header : headers) {
                table.addCell(new Phrase(header, FontFactory.getFont(FontFactory.HELVETICA_BOLD)));
            }

            // Table Data
            while(rs.next()) {
                table.addCell(String.valueOf(rs.getInt("booking_id")));
                table.addCell(rs.getString("guest_name"));
                table.addCell(rs.getString("guest_email"));
                table.addCell(rs.getString("guest_phone"));
                table.addCell(rs.getDate("checkIn").toString());
                table.addCell(rs.getDate("checkOut").toString());
                table.addCell(rs.getString("room_type"));
                table.addCell(String.format("₹%.2f", rs.getDouble("totalprice")));
            }

            document.add(table);
            document.close();

        } else {
            response.sendRedirect("dashboard.jsp?error=Invalid export type");
        }

    } catch(Exception e) {
        response.sendRedirect("dashboard.jsp?error=Export failed: " + e.getMessage());
    } finally {
        // Clean up resources
        try { if(rs != null) rs.close(); } catch(Exception e) {}
        try { if(stmt != null) stmt.close(); } catch(Exception e) {}
        try { if(conn != null) conn.close(); } catch(Exception e) {}
    }
%>