<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<jsp:include page="header.jsp" />
<body class="blue lighten-5">
    <div class="container height">
        <div class="row">
            <div class="col s6 offset-s3">
                <div class="card login-container margin1">
                    <div class="card-content">
                        <span class="card-title center-align">Hotel Booking Login</span>
                        <form action="loginProcess.jsp" method="post">
                            <div class="input-field">
                                <input id="username" type="text" name="username" class="validate" required>
                                <label for="username">Username</label>
                            </div>
                            <div class="input-field">
                                <input id="password" type="password" name="password" class="validate" required>
                                <label for="password">Password</label>
                            </div>
                            <div class="center-align">
                                <button class="btn waves-effect waves-light" type="submit">
                                    Login <i class="material-icons right">send</i>
                                </button>
                                <br><br>
                                <a href="register.jsp">New User? Register Here</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>  
  <jsp:include page="footer.jsp" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</body>
</html>