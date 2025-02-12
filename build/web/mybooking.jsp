<%@page import="java.sql.*, java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="dbcon.jsp" />

<%
    // Check if user is logged in
    if(session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String userEmail = request.getParameter("email");
%>
   <jsp:include page="header.jsp" />
    <div class="container">
        <h4 class="center-align">My Bookings</h4>
        
        <div class="row">
            <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelbooking", "root", "");
                
                PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM booking_data WHERE guest_email = ? ORDER BY checkIn DESC");
                ps.setString(1, userEmail);
                ResultSet rs = ps.executeQuery();
                
                SimpleDateFormat sdf = new SimpleDateFormat("dd MMM yyyy");
                
                while(rs.next()) {
                    String checkIn = rs.getString("checkIn");
                    String checkOut = rs.getString("checkOut");
                    
            %>
            <div class="col s12 m6 l4">
                <div class="card booking-card hoverable">
                    <div class="card-content">
                       
                        <h5><%= rs.getString("room_type") %> Room</h5>
                        
                        <div class="row">
                            <div class="col s6">
                                <p>
                                    <i class="material-icons tiny">date_range</i>
                                    <strong>Check-in:</strong><br>
                                    <%= sdf.format(checkIn) %><br>
                                    <small>12:01 PM</small>
                                </p>
                            </div>
                            <div class="col s6">
                                <p>
                                    <i class="material-icons tiny">date_range</i>
                                    <strong>Check-out:</strong><br>
                                    <%= sdf.format(checkOut) %><br>
                                    <small>11:00 AM</small>
                                </p>
                            </div>
                        </div>
                        
                        <div class="divider"></div>
                        
                        <div class="section">
                            <p>
                                <i class="material-icons tiny">meeting_room</i>
                                Rooms: <%= rs.getInt("no_of_rooms") %>
                            </p>
                          
                            <p class="price-tag">
                                ₹<%= String.format("%.2f", rs.getDouble("total_price")) %>
                            </p>
                        </div>
                    </div>
                    
                    <div class="card-action">
                        
                            <form action="cancelBooking.jsp" method="post">
                                <input type="hidden" name="booking_id" 
                                    value="<%= rs.getInt("booking_id") %>">
                                <button type="submit" class="btn waves-effect waves-light red">
                                    <i class="material-icons left">cancel</i>Cancel
                                </button>
                            </form>
                       
                            <a class="btn disabled">
                                <i class="material-icons left">check_circle</i>Completed
                            </a>
                       
                    </div>
                </div>
            </div>
            <%
                }
                if(rs.next()== false) {
                    out.println("<div class='col s12 center-align'><h5>No bookings found!</h5></div>");
                }
                con.close();
            } catch(Exception e) {
                out.println("<div class='col s12 red-text'>Error: " + e.getMessage() + "</div>");
            }
            %>
        </div>
    </div>

<jsp:include page="footer.jsp" />
