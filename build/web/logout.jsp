<%-- 
    Document   : logout.jsp
    Created on : Feb 10, 2025, 3:10:31 PM
    Author     : yurhighness
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Prevent caching of this page
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setHeader("Expires", "0"); // Proxies

    // Invalidate the session
 // Get existing session, don't create a new one
    if (session != null) {
        session.invalidate(); // Completely destroy the session
    }

    // Redirect to the index page
    response.sendRedirect("index.jsp");
%>