<%-- 
    Document   : adminDashboad
    Created on : Feb 10, 2025, 1:16:44 AM
    Author     : yurhighness
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.text.SimpleDateFormat" %>
<jsp:include page="dbcon.jsp" />

<% 
    // Admin session validation
    if(session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>




   <jsp:include page="header.jsp" />
<body>
    <!-- Navigation -->
    <div class="dashboard-nav">
        <div class="white-text">
            <h5>Admin Dashboard</h5>
            <ul >
                <li class="white">
                    <a href="#users" class="waves-effect">Users</a>
                </li>
                <br/>
                <li class="white">
                    <a href="#bookings" class=" waves-effect">Bookings</a>
                </li>
                    <br/>
                <li class="white">
                    <a href="#rooms" class=" waves-effect">Room Management</a>
                </li>
                    <br/>
                <li class="white">
                    <a href="logout.jsp" class=" waves-effect">Logout</a>
                </li>
            </ul>
        </div>
    </div>
                           <% 
    // Total Users
    Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelbooking", "root", "");
    Statement stmt1 = con1.createStatement();
    ResultSet rs1= stmt1.executeQuery("SELECT COUNT(*) FROM user_data");
    rs1.next();
    int totalUsers = rs1.getInt(1);
%>

                           <% 
    // Total Revenue
    Connection con4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelbooking", "root", "");
    Statement stmt4 = con4.createStatement();
    ResultSet rs4= stmt4.executeQuery("SELECT sum(total_price) FROM booking_data");
    rs4.next();
    double totalRevenue = rs4.getInt(1);
%>


                           <% 
    // Total Booking
    Connection con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelbooking", "root", "");
    Statement stmt3 = con3.createStatement();
    ResultSet rs3= stmt3.executeQuery("SELECT COUNT(*) FROM booking_data");
    rs3.next();
    int totalBooking = rs3.getInt(1);
%>



  <% 
    Connection con2 = null;
    Statement stmt2 = null;
    ResultSet rs2 = null;
    
 
        // Establish connection
        con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelbooking", "root", "");
        
        // Query to get room data
        String sql = "SELECT total_Ac_rooms, total_NonAc_rooms, available_rooms FROM room LIMIT 1";
        stmt2 = con2.createStatement();
        rs2 = stmt2.executeQuery(sql);
        
        rs2.next() ;
            int totalAC = rs2.getInt("total_Ac_rooms");
            int totalNonAC = rs2.getInt("total_NonAc_rooms");
            int available = rs2.getInt("available_rooms");
    
%>


    
    <!-- Main Content -->
    <div class="main-content">
        <!-- Stats Overview -->
        <div class="row">
            <div class="col s12 m6 l3">
                <div class="card blue darken-1 stats-card">
                    <div class="card-content white-text">
                        <span class="card-title">Total Users
                          <i class="material-icons left">account_circle</i>
                        </span>
                        <h4><%= totalUsers %></h4>
                    </div>
                </div>
            </div>
      
       <div class="row">
            <div class="col s12 m6 l3">
                <div class="card blue darken-1 stats-card">
                    <div class="card-content white-text">
                        <span class="card-title">Total Bookings       
                            <i class="material-icons left">home</i></span>
                        <h4>
                        <%= totalBooking %>
                        </h4>
                    </div>
                </div>
            </div>
              
              
              
            <div class="row">
                <div class="col s12 m6 l3">
                    <div class="card blue darken-1 stats-card">
                        <div class="card-content white-text">
                        <span class="card-title">Total Rooms AC
                          <i class="material-icons left">cast</i></span>
                        </span>
                        <h4>
                          <h4><%= totalAC %></h4>
                        </h4>
                        </div>
                   </div>
                </div>
  
            </div>
            
       
        
          <div class="row">
            <div class="col s12 m6 l3">
                <div class="card blue darken-1 stats-card">
                    <div class="card-content white-text">
                        <span class="card-title">Total Rooms Non AC
                                   <i class="material-icons left">check_box_outline_blank</i></span>
                        </span>
                        <h4>
                        <%= totalNonAC %>
                        </h4>
                    </div>
                </div>
            </div>
              
            <div class="row">
            <div class="col s12 m6 l3">
                <div class="card blue darken-1 stats-card">
                    <div class="card-content white-text">
                        <span class="card-title">Total Revenue
                           <i class="material-icons left">attach_money</i>
                        </span>
                        <h4>
                        <%= totalRevenue %>
                        </h4>
                    </div>
                </div>
                
            </div>
                
                
                <div class="row">
            <div class="col s12 m6 l3">
                <div class="card blue darken-1 stats-card">
                    <div class="card-content white-text">
                        <span class="card-title">Cancellation
                           <i class="material-icons left">error</i>
                        </span>
                        <h4>
                        
                        </h4>
                    </div>
                </div>
                
            </div>
                     
          
        </div>

        <!-- Users Management -->
        <div id="users" class="section">
            <h5>User Management</h5>
            <div class="card data-table">
                <div class="card-content">
                    <div class="row">
                        <div class="col s12">
                            <input type="text" placeholder="Search users..." id="searchUser">
                              <button class="btn waves-effect" type="submit">
                                    search
                                </button>
                        </div>
                    </div>
                    <table class="striped responsive-table">
                        <thead>
                            <tr>
                                <th>Username</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th  >Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                     <% 
                                // Database query for users
                                try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelbooking", "root", "");
                                    Statement stmt = con.createStatement();
                                    ResultSet rs = stmt.executeQuery("SELECT * FROM user_data");
                                    
                                    while(rs.next()) {
                            %>
                            <tr>
                                <td><%= rs.getString("username") %></td>
                                <td><%= rs.getString("email") %></td>
                                <td><%= rs.getString("phone") %></td>
                                <td  >
                                     <p title="delete">
                                    <a class="btn-floating red modal-trigger" href="#deleteModal">
                                        <i class="material-icons">delete</i>
                                    </a>
                                           </p>
                                           <p title="edit" style="padding-top: 15px; ">
                                     <a class="btn-floating red modal-trigger" href="#editModal">
                                      <i class="material-icons">edit</i>
                                    </a>
                                            </p>
                                </td>
                                   <td>
                                   
                                </td>
                            </tr>
                            <%
                                    }
                                    con.close();
                                } catch(Exception e) {
                                    out.println(e);
                                }
                            %>
                            <tr>
                               
                           
                            </tr>
 
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Room Management -->
        <div id="rooms" class="section">
            <h5>Room Management</h5>
            <div class="row">
                <div class="col s12 m3">
                    <div class="card">
                        <div class="card-content">
                            <span class="card-title">AC Rooms</span>
                            <form action="updateRooms.jsp" method="post">
                                <div class="input-field">
                                    <input type="number" name="acRooms" value="<%-- Current AC rooms --%>" required>
                                    <label>Total AC Rooms</label>
                                </div>
                                     <div class="input-field">
                                    <input type="number" name="nonacRooms" value="<%-- Current AC rooms --%>" required>
                                    <label>Total Non_AC Rooms</label>
                                </div>
                                <button class="btn waves-effect" type="submit">
                                    Update
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
              
            </div>
                                    
                                    
           
        </div>
                                    
    </div>
 
        <!-- Booking Section -->
        <div   id="bookings">
              <h5>Booking Management</h5>
        <div class="card-panel" >
            
            <div class="row">
                <div class="col s12 m3">
                    <input type="text" id="search" placeholder="Search bookings...">
                    
                </div>
                <div class="col s12 m3">
                    <select id="statusFilter">
                        <option value="">All Statuses</option>
                        <option value="upcoming">Upcoming</option>
                        <option value="active">Active</option>
                        <option value="completed">Completed</option>
                    </select>
                </div>
                <div class="col s12 m3">
                    <input type="date" id="dateFilter">
                </div>
                <div class="col s12 m3">
                    <select id="roomTypeFilter">
                        <option value="">All Room Types</option>
                        <option value="AC">AC</option>
                        <option value="Non-AC">Non-AC</option>
                    </select>
                </div>
                   <button class="btn waves-effect" type="submit">
                                    search
                                </button>
            </div>
        </div>

        <!-- Bookings Table -->
        <div class="card booking-table">
            <div class="card-content">
                <table class="highlight responsive-table">
                    <thead>
                        <tr>
                            <th>Booking ID</th>
                            <th>Guest Name</th>
                            <th>Room Type</th>
                            <th>Check-In</th>
                            <th>Check-Out</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                
                                        <% 
                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelbooking", "root", "");
                                Statement stmt = con.createStatement();
                                ResultSet rs = stmt.executeQuery("SELECT * FROM booking_data");
                                
                           
                                
                                while(rs.next()) {
                                    String checkIn = rs.getString("checkIn");
                                    String checkOut = rs.getString("checkOut");
//                                    String status = getBookingStatus(checkIn, checkOut);
                        %>
                        <tr class="hoverable-row">
                            <td><%= rs.getInt("booking_id") %></td>
                            <td><%= rs.getString("guest_name") %></td>
                            <td><%= rs.getString("room_type") %></td>
                            <td><%= checkIn %><br><small>12:01 PM</small></td>
                            <td><%= checkOut %><br><small>11:00 AM</small></td>
                            <td>
<!--                                <div class="status-chip ">
                                
                                </div>-->
                            </td>
                            <td>
                                <a class="btn-floating blue modal-trigger" 
                                   href="#detailModal<%= rs.getInt("booking_id") %>">
                                    <i class="material-icons">visibility</i>
                                </a>
                                <a class="btn-floating red modal-trigger" 
                                   href="#deleteModal2<%= rs.getInt("booking_id") %>">
                                    <i class="material-icons">delete</i>
                                </a>
                            </td>
                        </tr>
                        
                        <!-- Detail Modal -->
                        <div id="detailModal<%= rs.getInt("booking_id") %>" class="modal">
                            <div class="modal-content">
                                <h4>Booking Details</h4>
                                <div class="row">
                                    <div class="col s6">
                                        <p><strong>Guest:</strong> <%= rs.getString("guest_name") %></p>
                                        <p><strong>Email:</strong> <%= rs.getString("guest_email") %></p>
                                        <p><strong>Phone:</strong> <%= rs.getString("guest_phone") %></p>
                                    </div>
                                    <div class="col s6">
                                        <p><strong>Rooms:</strong> <%= rs.getInt("num_rooms") %></p>
                                        <p><strong>Total Price:</strong> ₹<%= rs.getDouble("total_price") %></p>
                                        <p><strong>Booking Date:</strong> <%= rs.getDate("booking_time") %></p>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <a href="#!" class="modal-close btn-flat">Close</a>
                            </div>
                        </div>
                        
                      Booking
                        <%
                                }
                                con.close();
                            } catch(Exception e) {
                                out.println(e);
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
        </div>

      <div class="fixed-action-btn">
    <a class="btn-floating btn-large red">
        <i class="large material-icons">file_download</i>
    </a>
    <ul>
        <li><a class="btn-floating green" href="export.jsp?type=csv"><i class="material-icons">grid_on</i></a></li>
        <li><a class="btn-floating blue" href="export.jsp?type=pdf"><i class="material-icons">picture_as_pdf</i></a></li>
    </ul>
</div>
         
        



 <!--Delete booking Confirmation Modal -->
    <div id="deleteModal2" class="modal">
        <div class="modal-content">
            <h4>Confirm Delete</h4>
            <p>Are you sure you want to delete this booking?</p>
        </div>
        <div class="modal-footer">
            <a href="adminDashboad.jsp" class="modal-close btn-flat">Cancel</a>
            <a href="deleteBooking.jsp" class="modal-close btn red">Delete</a>
        </div>
    </div>

    <!--Delete Confirmation Modal -->
    <div id="deleteModal" class="modal">
        <div class="modal-content">
            <h4>Confirm Delete</h4>
            <p>Are you sure you want to delete this user?</p>
        </div>
        <div class="modal-footer">
            <a href="adminDashboad.jsp" class="modal-close btn-flat">Cancel</a>
            <a href="deleteBooking.jsp" class="modal-close btn red">Delete</a>
        </div>
    </div>
    <div class="margin"></div>
         <jsp:include page="footer.jsp" />  
   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Initialize components
            var modals = document.querySelectorAll('.modal');
            M.Modal.init(modals);
            
            // Initialize sidenav for mobile
            var sidenav = document.querySelectorAll('.sidenav');
            M.Sidenav.init(sidenav);

            // Search functionality
            document.getElementById('searchUser').addEventListener('keyup', function() {
                // Implement live search
            });
        });
    </script>
    
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        var elems = document.querySelectorAll('.fixed-action-btn');
        var instances = M.FloatingActionButton.init(elems, {
            hoverEnabled: false
        });
    });
</script>
   
</body>
</html>
