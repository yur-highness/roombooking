<%-- 
    Document   : loginprocessing.jsp
    Created on : Feb 10, 2025, 1:14:27 PM
    Author     : yurhighness
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:include page="dbcon.jsp" />
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelbooking", "root", "");
        
        // Check admin table
        PreparedStatement ps = con.prepareStatement("SELECT * FROM admin WHERE username=? AND password=?");
        ps.setString(1, username);
        ps.setString(2, password);
        ResultSet rs = ps.executeQuery();
        
        if(rs.next()) {
        
            session.setAttribute("admin", username);
            response.sendRedirect("adminDashboad.jsp?name="+username);
            return;
        }

        // Check user table
        ps = con.prepareStatement("SELECT * FROM user_data WHERE username=? AND password=?");
        ps.setString(1, username);
        ps.setString(2, password);
        rs = ps.executeQuery();
    
       
        
        if(rs.next()) {
            session.setAttribute("user", username);
            response.sendRedirect("index.jsp?name="+username);
        } 
        else {
            response.sendRedirect("login.jsp?error=1");
        }
    } catch(Exception e) {
        out.println(e);
    }
%>

