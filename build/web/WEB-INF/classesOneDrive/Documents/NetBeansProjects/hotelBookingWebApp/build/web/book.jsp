<%-- 
    Document   : book
    Created on : Feb 10, 2025, 12:14:22 AM
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

<!DOCTYPE html>
<html>

    <jsp:include page="header.jsp" />

<body>

    
    <div class="container">
        <h4 class="center-align">Room Booking Form</h4>
        
        <form action="bookingProcess.jsp" method="post" onsubmit="">
            <!-- User Details -->
            <div class="row">
                <div class="col s12 m6">
                    <div class="card-panel teal lighten-5">
                        <h5>Your Information</h5>
                        <div class="input-field">
                            <input type="text" id="name" name="name" value="" required>
                            <label for="name">Full Name</label>
                        </div>
                        <div class="input-field">
                            <input type="tel" id="phone" name="phone" value="" pattern="[0-9]{10}" required>
                            <label for="phone">Phone Number</label>
                        </div>
                        <div class="input-field">
                            <input type="email" id="email" name="email" value="" required>
                            <label for="email">Email Address</label>
                        </div>
                    </div>
                </div>

                <!-- Booking Details -->
                <div class="col s12 m6">
                    <div class="card-panel teal lighten-5">
                        <h5>Booking Details</h5>
                        
                        <!-- Check-in -->
                        <div class="input-field  sm-margin">
                            <div class="date">
                                 <label for="checkin">Check-in Date</label>
                            <input type="date" id="checkin" name="checkin" required>
                           
                            </div>
                            <div class="date">
                                <label for="checkout">Check-out Date</label>
                              <input type="date" id="checkout" name="checkout" required>
               
                             </div>
                          
                        </div>

                        <!-- Check-out -->
                        <div class="input-field sm-margin">
                            <div class="time-display">Check-in Time:
                                <input type="time" id="time" name="time" required>
                            </div>
                         <br/>
                            <div class="time-display">Check-out Time:
                                  <input type="time" id="time" name="time" required>
                            </div>
                        </div>

                     

                        <!-- Number of Rooms -->
                        <div class="input-field  sm-margin ">
                            <input type="number" id="rooms" name="rooms" min="1" max="10" required>
                            <label for="rooms">Number of Rooms</label>
                                  <!-- Room Type -->
                        <div  class="input-field roomtype ">
                          <p>
                            <label>
                             <label for="rooms">Type of Rooms</label>
                             <input class="with-gap" name="group3" type="radio" checked />
                              <span>AC</span>
                                 </label>
                                  
                             <label>
                                 <input class="with-gap" name="group3" type="radio" checked />
                                  <span> non AC</span>
                            </label>
                          </p>
                           
                        </div>
                        </div>
                        
                        
                        
                     
                        
                    </div>
                </div>
            </div>

            <!-- Price Calculation -->
            <div class="row">
                <div class="col s12">
                    <div class="price-calc">
                        <h5>Price Calculation</h5>
                        <div class="row">
                            <div class="col s4">
                                <p>AC Room Price: ₹5000/night</p>
                                <p>Non-AC Room Price: ₹3000/night</p>
                            </div>
                            <div class="col s4">
                                <p>Number of Nights: <span id="nights">0</span></p>
                                <p>Number of Rooms: <span id="roomCount">0</span></p>
                            </div>
                            <div class="col s4">
                                <p>Subtotal: ₹<span id="subtotal">0</span></p>
                                <p>GST (18%): ₹<span id="gst">0</span></p>
                                <p class="green-text"><strong>Total: ₹<span id="total">0</span></strong></p>
                            </div>
                        </div>
                        <input type="hidden" name="totalprice" id="totalprice">
                    </div>
                </div>
            </div>

            <div class="center-align" style="margin-top: 30px;">
                <button class="btn-large waves-effect waves-light" type="submit">
                    Confirm Booking <i class="material-icons right">check_circle</i>
                </button>
            </div>
            <div class="sm-margin"></div>
        </form>
    </div>
     <jsp:include page="footer.jsp" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
  
  
</body>
</html>
