<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login - Phone Shoop</title>
        <%@include file="component/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="component/navbar.jsp" %>
        <div class="container mt-4">
            <div class="row">
                <div class="col-md-6 offset-md-4">
                    <div class="card">
                        <div class="card-header custom-bg text-white">
                            <h3 class="text-center">Login here</h3>
                        </div>
                        <div class="card-body">
                            <%@include file="component/message.jsp" %>
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                  <label for="email">Email address</label>
                                  <input type="email" name="email" class="form-control" id="email" aria-describedby="emailHelp" required>
                                  <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                  <label for="password">Password</label>
                                  <input type="password" name="password" class="form-control" id="password" required>
                                </div>
                                <a href="register.jsp" class="text-center d-block">If not registered click here </a>
                                <div class="container text-center mt-3">
                                    <button type="reset" class="btn btn-primary custom-bg border-0">reset</button>
                                    <button type="submit" class="btn btn-primary custom-bg border-0">Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
