<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="component/common_css_js.jsp" %>
        <title>New User</title>
    </head>
    <body>
        <%@include file="component/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-5">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <%@include file="component/message.jsp" %>
                        <div class="card-body px-4">                        
                            <h3 class="text-center my-2">Sign Up here :)</h3>
                            <form action="RegisterServlet" method="post">
                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <input type="text" name="name" class="form-control" id="name" placeholder="Enter your name" aria-describedby="username">
                                </div>
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="email" name="email" class="form-control" id="email" placeholder="urEmail@gmail.com" aria-describedby="useremail">
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" name="password" class="form-control" id="password" placeholder="Enter password ****" aria-describedby="userpassword">
                                </div>
                                <div class="form-group">
                                    <label for="phone">Phone Numer</label>
                                    <input type="number" name="phone" class="form-control" id="phone" placeholder="Enter your phone number" aria-describedby="userphonenumber">
                                </div>
                                <div class="form-group">
                                    <label for="address">Address</label>
                                    <textarea name="address" class="form-control" placeholder="Enter your Address"></textarea>
                                </div>
                                <div class="container text-center">
                                    <button class="btn btn-outline-warning">Reset</button>
                                    <button class="btn btn-outline-success">Register</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
