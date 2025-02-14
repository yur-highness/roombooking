<%-- 
    Document   : book
    Created on : Feb 10, 2025, 12:14:22 AM
    Author     : yurhighness
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.text.SimpleDateFormat" %>
<jsp:include page="dbcon.jsp" />


<% 
    // Admin session validation
    if(session.getAttribute("admin") == null && session.getAttribute("user") == null ) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<% 
  // Get user details from session
    String userEmail = (String) session.getAttribute("user");
    String userPhone = "";
    String username = "";
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelbooking", "root", "");
        
        PreparedStatement ps = con.prepareStatement("SELECT * FROM user_data WHERE email=?");
        ps.setString(1, userEmail);
        ResultSet rs = ps.executeQuery();
        
        if(rs.next()) {
           userEmail= rs.getString("email");
            userPhone = rs.getString("phone");
            username = rs.getString("username");
        }
        con.close();
    } catch(Exception e) {
        out.println(e);
    }
%>

<!DOCTYPE html>
<html>

    <jsp:include page="header.jsp" />

<body>

    
    <div class="container">
        <h4 class="center-align">Room Booking Form</h4>
        
        <form action="bookingProcess.jsp" method="post" onsubmit="return validateBooking()">
            <!-- User Details -->
            <div class="row">
                <!-- User Details -->
                <div class="col s12 m6">
                    <div class="card-panel teal lighten-5">
                        <h5>Your Information</h5>
                        <div class="input-field">
                            <input name="name" type="text" value="<%= username %>" required>
                            <label>Name</label>
                        </div>
                        <div class="input-field">
                            <input name="phone" type="tel" value="<%= userPhone %>" required>
                            <label>Phone Number</label>
                        </div>
                        <div class="input-field">
                            <input name="email" type="email" value="<%= userEmail %>" required>
                            <label>Email</label>
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
                             <input class="with-gap" name="roomtype" id="room_type" type="radio" checked />
                              <span>AC</span>
                                 </label>
                                  
                             <label>
                                 <input class="with-gap" name="roomtype" id="room_type"  type="radio" checked />
                                  <span>nonAC</span>
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
                                <p>Subtotal: ₹<span id="subtotal" name="subtotal">0</span></p>
                                <input type="hidden" id="baseprice" name="baseprice">
                                <p>GST (18%): ₹<span id="gst" name="gst">0</span></p>
                                  <input type="hidden" id="gst_amount" name="gst_amount">
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
  
   <script>
        // Initialize Materialize components
        document.addEventListener('DOMContentLoaded', function() {
            var elems = document.querySelectorAll('select');
            var instances = M.FormSelect.init(elems);
        });

        // Price calculation function
        function calculatePrice() {
            const checkin = new Date(document.getElementById('checkin').value);
            const checkout = new Date(document.getElementById('checkout').value);
            const roomType = document.querySelector('input[name="roomtype"]:checked').value;
            const numRooms = parseInt(document.getElementById('rooms').value) || 0;
            
            if(checkin && checkout && roomType && numRooms > 0) {
                const timeDiff = checkout.getTime() - checkin.getTime();
                const nights = Math.ceil(timeDiff / (1000 * 3600 * 24));
                const pricePerNight = roomType === 'AC' ? 5000 : 3000;
                const subtotal = pricePerNight * nights * numRooms;
                const gst = subtotal * 0.18;
                const total = subtotal + gst;

                document.getElementById('nights').textContent = nights;
                document.getElementById('roomCount').textContent = numRooms;
                document.getElementById('subtotal').textContent = subtotal.toFixed(2);
                document.getElementById('baseprice').value = subtotal.toFixed(2);
                document.getElementById('gst').textContent = gst.toFixed(2);
                document.getElementById('gst_amount').value = gst.toFixed(2);
                document.getElementById('total').textContent = total.toFixed(2);
                document.getElementById('totalprice').value = total.toFixed(2);
            }
        }

        // Form validation
        function validateBooking() {
            const checkin = document.getElementById('checkin').value;
            const checkout = document.getElementById('checkout').value;
            
            if(!checkin || !checkout) {
                alert('Please select both check-in and check-out dates');
                return false;
            }
            
            if(new Date(checkout) <= new Date(checkin)) {
                alert('Check-out date must be after check-in date');
                return false;
            }
            
            return true;
        }

        // Add event listeners
        document.getElementById('checkin').addEventListener('change', calculatePrice);
        document.getElementById('checkout').addEventListener('change', calculatePrice);
        document.getElementById('room_type').addEventListener('change', calculatePrice);
        document.getElementById('rooms').addEventListener('input', calculatePrice);
    </script>
</body>
</html>
