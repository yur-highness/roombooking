<%-- 
    Document   : mybooking
    Created on : Feb 9, 2025, 2:15:20 PM
    Author     : yurhighness
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.text.SimpleDateFormat" %>


<% 
    // Admin session validation
    if(session.getAttribute("admin") == null && session.getAttribute("user") == null ) {
        response.sendRedirect("login.jsp");
        return;
    }
%>



<jsp:include page="header.jsp" />
  

<body>
 
    
    <div class="container ">
        <h4 class="center-align">My Bookings</h4>
        
        <div class="row">
        
            <div class="col s12 m6 l4">
                <div class="card booking-card hoverable">
                    <div class="card-content">
                        <span class="status-badge ">
                           
                        </span>
                        
                        <h5>Room</h5>
                        
                        <div class="row">
                            <div class="col s6">
                                <p>
                                    <i class="material-icons tiny">date_range</i>
                                    <strong>Check-in:</strong><br>
                                  <br>
                                    <small>12:01 PM</small>
                                </p>
                            </div>
                            <div class="col s6">
                                <p>
                                    <i class="material-icons tiny">date_range</i>
                                    <strong>Check-out:</strong><br>
                                  <br>
                                    <small>11:00 AM</small>
                                </p>
                            </div>
                        </div>
                        
                        <div class="divider"></div>
                        
                        <div class="section">
                            <p>
                                <i class="material-icons tiny">meeting_room</i>
                                Rooms: 
                            </p>
                            <p>
                                <i class="material-icons tiny">nights_stay</i>
                                Nights:
                            </p>
                            <p class="price-tag">
                                ₹
                            </p>
                        </div>
                    </div>
                    
                    
                    
                    
                    
                    <div class="card-action">
               
                            <form action="cancelBooking.jsp" method="post">
                                <input type="hidden" name="booking_id" 
                                    value="">
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
            
            <div class="col s12 m6 l4">
                <div class="card booking-card hoverable">
                    <div class="card-content">
                        <span class="status-badge ">
                           
                        </span>
                        
                        <h5>Room</h5>
                        
                        <div class="row">
                            <div class="col s6">
                                <p>
                                    <i class="material-icons tiny">date_range</i>
                                    <strong>Check-in:</strong><br>
                                  <br>
                                    <small>12:01 PM</small>
                                </p>
                            </div>
                            <div class="col s6">
                                <p>
                                    <i class="material-icons tiny">date_range</i>
                                    <strong>Check-out:</strong><br>
                                  <br>
                                    <small>11:00 AM</small>
                                </p>
                            </div>
                        </div>
                        
                        <div class="divider"></div>
                        
                        <div class="section">
                            <p>
                                <i class="material-icons tiny">meeting_room</i>
                                Rooms: 
                            </p>
                            <p>
                                <i class="material-icons tiny">nights_stay</i>
                                Nights:
                            </p>
                            <p class="price-tag">
                                ₹
                            </p>
                        </div>
                    </div>
                    
                    
                    
                    
                    
                    <div class="card-action">
               
                            <form action="cancelBooking.jsp" method="post">
                                <input type="hidden" name="booking_id" 
                                    value="">
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
            
            <div class="col s12 m6 l4">
                <div class="card booking-card hoverable">
                    <div class="card-content">
                        <span class="status-badge ">
                           
                        </span>
                        
                        <h5>Room</h5>
                        
                        <div class="row">
                            <div class="col s6">
                                <p>
                                    <i class="material-icons tiny">date_range</i>
                                    <strong>Check-in:</strong><br>
                                  <br>
                                    <small>12:01 PM</small>
                                </p>
                            </div>
                            <div class="col s6">
                                <p>
                                    <i class="material-icons tiny">date_range</i>
                                    <strong>Check-out:</strong><br>
                                  <br>
                                    <small>11:00 AM</small>
                                </p>
                            </div>
                        </div>
                        
                        <div class="divider"></div>
                        
                        <div class="section">
                            <p>
                                <i class="material-icons tiny">meeting_room</i>
                                Rooms: 
                            </p>
                            <p>
                                <i class="material-icons tiny">nights_stay</i>
                                Nights:
                            </p>
                            <p class="price-tag">
                                ₹
                            </p>
                        </div>
                    </div>
                    
                    
                    
                    
                    
                    <div class="card-action">
               
                            <form action="cancelBooking.jsp" method="post">
                                <input type="hidden" name="booking_id" 
                                    value="">
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
            
        
            <div class="col s12 m6 l4">
                <div class="card booking-card hoverable">
                    <div class="card-content">
                        <span class="status-badge ">
                           
                        </span>
                        
                        <h5>Room</h5>
                        
                        <div class="row">
                            <div class="col s6">
                                <p>
                                    <i class="material-icons tiny">date_range</i>
                                    <strong>Check-in:</strong><br>
                                  <br>
                                    <small>12:01 PM</small>
                                </p>
                            </div>
                            <div class="col s6">
                                <p>
                                    <i class="material-icons tiny">date_range</i>
                                    <strong>Check-out:</strong><br>
                                  <br>
                                    <small>11:00 AM</small>
                                </p>
                            </div>
                        </div>
                        
                        <div class="divider"></div>
                        
                        <div class="section">
                            <p>
                                <i class="material-icons tiny">meeting_room</i>
                                Rooms: 
                            </p>
                            <p>
                                <i class="material-icons tiny">nights_stay</i>
                                Nights:
                            </p>
                            <p class="price-tag">
                                ₹
                            </p>
                        </div>
                    </div>
                    
                    
                    
                    
                    
                    <div class="card-action">
               
                            <form action="cancelBooking.jsp" method="post">
                                <input type="hidden" name="booking_id" 
                                    value="">
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
        
        </div>
        
        </div>
        
    <div class="margin"></div>
         <jsp:include page="footer.jsp" />  
   

    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</body>
</html>