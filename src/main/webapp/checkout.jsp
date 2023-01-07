<%
    User user=(User)session.getAttribute("current-user");
    if(user==null)
    {
        session.setAttribute("message", "You are not logged in !! Login first to access checkout page");
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include  file="component/common_css_js.jsp" %>
        <title>Checkout</title>
    </head>
    <body>
        <%@include  file="component/navbar.jsp" %>
        <div class="container">
            <div class="row mt-2">
                <div class="col-md-6">
                    <!-- cart -->
                    <div class="cart">
                        <h3 class="text-center mb-4">Your selected Items</h3>
                        <div class="cart-body">
                            
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <!-- form details -->
                    <div class="cart">
                        <h3 class="text-center mb-4">Your Details for Order</h3>
                        <form action="#">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input value="<%=user.getUserEmail()%>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Your Name</label>
                                <input value="<%=user.getUserName()%>" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter your name">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Your Contact</label>
                                <input value="<%=user.getUserPhone()%>" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Contact Number">
                            </div>
                            <div class="form-group">
                                <label for="exampleFormControlTextarea1">Your Shipping address</label>
                                <textarea class="form-control" placeholder="Enter your address for shipping" id="exampleFormControlTextarea1" rows="2"><%=user.getUserAddress()%></textarea>
                            </div>
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Order Now</button>
                                <button class="btn btn-outline-primary">Continue Shopping</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        
        <%@include file="component/common_modals.jsp" %>
    </body>
</html>
 