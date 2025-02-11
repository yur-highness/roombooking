<%-- 
    Document   : adminDashboad
    Created on : Feb 10, 2025, 1:16:44 AM
    Author     : yurhighness
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
                        <h4>
                        
                        </h4>
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
                        
                        </h4>
                    </div>
                </div>
                
            </div>
                
                
                <div class="row">
            <div class="col s12 m6 l3">
                <div class="card blue darken-1 stats-card">
                    <div class="card-content white-text">
                        <span class="card-title">Cancelation
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
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                     
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                             
                                   <td>
                                    <a class="btn-floating red modal-trigger" href="#deleteModal">
                                        <i class="material-icons">delete</i>
                                    </a>
                                </td>
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
                                <button class="btn waves-effect" type="submit">
                                    Update
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
              
            </div>
                                    
                                    
             <div class="row">
                <div class="col s12 m3">
                    <div class="card">
                        <div class="card-content">
                            <span class="card-title">Non AC Rooms</span>
                            <form action="updateRooms.jsp" method="post">
                                <div class="input-field">
                                    <input type="number" name="acRooms" value="<%-- Current AC rooms --%>" required>
                                    <label>Total AC Rooms</label>
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
                
                        <tr class="hoverable-row">
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><br><small></small></td>
                            <td><br><small></small></td>
                            <td>
                                <div class="status-chip ">
                                    
                                </div>
                            </td>
                            <td>
                                <a class="btn-floating blue modal-trigger" 
                                   href="#detailModal">
                                    <i class="material-icons">visibility</i>
                                </a>
                                <a class="btn-floating red modal-trigger" 
                                   href="#deleteModal">
                                    <i class="material-icons">delete</i>
                                </a>
                            </td>
                        </tr>
                        
                        <!-- Detail Modal -->
                        <div id="detailModal" class="modal">
                            <div class="modal-content">
                                <h4>Booking Details</h4>
                                <div class="row">
                                    <div class="col s6">
                                        <p><strong>Guest:</strong> </p>
                                        <p><strong>Email:</strong> </p>
                                        <p><strong>Phone:</strong> </p>
                                    </div>
                                    <div class="col s6">
                                        <p><strong>Rooms:</strong></p>
                                        <p><strong>Total Price:</strong> </p>
                                        <p><strong>Booking Date:</strong> </p>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <a href="#!" class="modal-close btn-flat">Close</a>
                            </div>
                        </div>
                        
                        <!-- Delete Modal -->
                        <div id="deleteModal" class="modal">
                            <div class="modal-content">
                                <h4>Confirm Delete</h4>
                                <p>Are you sure you want to delete this booking?</p>
                            </div>
                            <div class="modal-footer">
                                <form action="deleteBooking.jsp" method="post">
                                    <input type="hidden" name="booking_id" 
                                           value="">
                                    <button type="submit" class="btn red">Delete</button>
                                </form>
                            </div>
                        </div>
                     
                    </tbody>
                </table>
            </div>
        </div>
        </div>

      
         
        





    <!-- Delete Confirmation Modal -->
    <div id="deleteModal" class="modal">
        <div class="modal-content">
            <h4>Confirm Delete</h4>
            <p>Are you sure you want to delete this user?</p>
        </div>
        <div class="modal-footer">
            <a href="#!" class="modal-close btn-flat">Cancel</a>
            <a href="#!" class="modal-close btn red">Delete</a>
        </div>
    </div>
    <div class="margin"></div>
         <jsp:include page="footer.jsp" />  
   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
   
</body>
</html>
