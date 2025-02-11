<%-- 
    Document   : registration
    Created on : Feb 9, 2025, 1:30:21 PM
    Author     : yurhighness
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="header.jsp" />
<body class="blue lighten-5">
    <div class="container  center">
        <div class="row">
            <div class="col s6 offset-s3">
                <div class="card margin">
                    <div class="card-content">
                        <span class="card-title">User Registration</span>
                        <form action="registerProcess.jsp" method="post">
                            <div class="input-field">
                                <input id="username" type="text" name="username" required>
                                <label for="username">Username</label>
                            </div>
                            <div class="input-field">
                                <input id="password" type="password" name="password" required>
                                <label for="password">Password</label>
                            </div>
                            <div class="input-field">
                                <input id="email" type="email" name="email" required class="validate" >
                                <label for="email">Email</label>
                            </div>
                            <div class="input-field">
                                <input id="phone" type="tel" name="phone" required>
                                <label for="phone">Phone Number</label>
                            </div>
                            <button class="btn waves-effect waves-light" type="submit">
                                Register 
                            </button>
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