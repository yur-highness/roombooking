<%-- 
    Document   : index
    Created on : Feb 10, 2025, 2:41:04 PM
    Author     : yurhighness
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>

      <jsp:include page="header.jsp" />
       <body>
    <!-- Hero Section -->
    <section id="home" class="section scrollspy">
        <div class="container hero">
            <div class="row ">
                <div class="col s12 m6">
                    <h1 class="white-text">Welcome to Hotel Booking</h1>
                    <p class="flow-text white-text">Find the perfect hotel for your next trip. Book now and enjoy exclusive deals!</p>
                    <a href="book.jsp" class="btn-large waves-effect waves-light  pulse">Book Now</a>
         
                </div>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section id="features" class="section scrollspy">
        <div class="container">
            <h2 class="center-align">Features</h2>
            <div class="row">
                <div class="col s12 m4">
                    <div class="card-panel hoverable">
                        <i class="material-icons large">hotel</i>
                        <h5>Luxurious Rooms</h5>
                        <p>Experience comfort and luxury in our well-appointed rooms.</p>
                    </div>
                </div>
                <div class="col s12 m4">
                    <div class="card-panel hoverable">
                        <i class="material-icons large">restaurant</i>
                        <h5>Fine Dining</h5>
                        <p>Enjoy gourmet meals prepared by our world-class chefs.</p>
                    </div>
                </div>
                <div class="col s12 m4">
                    <div class="card-panel hoverable">
                        <i class="material-icons large">pool</i>
                        <h5>Swimming Pool</h5>
                        <p>Relax and unwind in our sparkling swimming pool.Deep Dive</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Rooms Section -->
    <section id="rooms" class="section scrollspy">
        <div class="container">
            <h2 class="center-align">Our Rooms</h2>
            <div class="row">
                <div class="col s12 m4">
                    <div class="card hoverable">
                        <div class="card-image">
                            <img src="img/adam-winger-VGs8z60yT2c-unsplash.jpg" alt="Room 1">
                            <span class="card-title">Standard Room</span>
                        </div>
                        <div class="card-content">
                            <p>Comfortable and affordable,perfect for short stays.</p>
                        </div>
                        <div class="card-action">
                            <a href="book.jsp" class="btn waves-effect waves-light">Book Now</a>
                        </div>
                    </div>
                </div>
                <div class="col s12 m4">
                    <div class="card hoverable">
                        <div class="card-image">
                            <img src="img/patrick-robert-doyle-AH8zKXqFITA-unsplash.jpg" alt="Room 2">
                            <span class="card-title">Deluxe Room</span>
                        </div>
                        <div class="card-content">
                            <p>Spacious and elegant, ideal for longer stays.Life long experience.  </p>
                        </div>
                        <div class="card-action">
                            <a href="book.jsp" class="btn waves-effect waves-light">Book Now</a>
                        </div>
                    </div>
                </div>
                <div class="col s12 m4">
                    <div class="card hoverable">
                        <div class="card-image">
                            <img src="img/visualsofdana-T5pL6ciEn-I-unsplash.jpg" alt="Room 3">
                            <span class="card-title">Suite</span>
                        </div>
                        <div class="card-content">
                            <p>Luxurious and spacious, perfect for a lavish experience.</p>
                        </div>
                        <div class="card-action">
                            <a href="book.jsp" class="btn waves-effect waves-light">Book Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Testimonials Section -->
    <section id="testimonials" class="section scrollspy">
        <div class="container">
            <h2 class="center-align">What Our Guests Say</h2>
            <div class="row">
                <div class="col s12 m4">
                    <div class="card-panel hoverable">
                        <p>"Amazing experience! The staff was very friendly and the rooms were spotless."</p>
                        <p>- John Doe</p>
                    </div>
                </div>
                <div class="col s12 m4">
                    <div class="card-panel hoverable">
                        <p>"The best hotel I've ever stayed in. Highly recommended!"</p>
                        <p>- Jane Smith</p>
                    </div>
                </div>
                <div class="col s12 m4">
                    <div class="card-panel hoverable">
                        <p>"Great location, excellent service, and delicious food. Will definitely come back!"</p>
                        <p>- Mike Johnson</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section id="contact" class="section scrollspy">
        <div class="container">
            <h2 class="center-align">Contact Us</h2>
            <div class="row">
                <div class="col s12 m6 offset-m3">
                    <form>
                        <div class="input-field">
                            <input id="name" type="text" class="validate">
                            <label for="name">Name</label>
                        </div>
                        <div class="input-field">
                            <input id="email" type="email" class="validate">
                            <label for="email">Email</label>
                        </div>
                        <div class="input-field">
                            <textarea id="message" class="materialize-textarea"></textarea>
                            <label for="message">Message</label>
                        </div>
                        <button class="btn waves-effect waves-light" type="submit">Send</button>
                    </form>
                </div>
            </div>
        </div>
    </section>

   <jsp:include page="footer.jsp" />

    <!-- Materialize JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <!-- Custom JavaScript -->
    <script src="scripts.js"></script>
</body>
</html>
