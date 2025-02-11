<%-- 
    Document   : dbcon
    Created on : Feb 10, 2025, 1:11:56 PM
    Author     : yurhighness
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*"%>


<%
try{
 Connection con  = null;
       String url ="jdbc:mysql://localhost:3306/";
       String db ="hotelbooking";
       String driver ="com.mysql.cj.jdbc.Driver";
       String username = "root";
       Class.forName(driver).newInstance();
       con = DriverManager.getConnection(url+db,username,"");
       System.out.println("connection successfull");
       }
    
catch(Exception ex){
     System.out.println(ex);
}

%>