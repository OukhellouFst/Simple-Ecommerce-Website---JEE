<%@page import="java.util.Map"%>
<%@page import="com.mycompany.phone_shoop.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.phone_shoop.entities.Category"%>
<%@page import="com.mycompany.phone_shoop.helper.FactoryProvider"%>
<%@page import="com.mycompany.phone_shoop.Dao.CategoryDao"%>
<%@page import="com.mycompany.phone_shoop.entities.User"%>
<%
    User user=(User)session.getAttribute("current-user");
    if(user==null)
    {
        session.setAttribute("message", "You are not logged in !! login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if(user.getUserType().equals("normal")){
            session.setAttribute("message", "You are not admin ! Do not access this page ");
            response.sendRedirect("login.jsp");
            return;
        }
    }
    
    
%>

<% 
    CategoryDao catDao=new CategoryDao(FactoryProvider.getFactory());
    List<Category> categories=catDao.getCategories();
    
    // getting count
    Map<String,Long> m=Helper.getCounts(FactoryProvider.getFactory());
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="component/common_css_js.jsp"%>
        <title>Admin</title>
    </head>
    <body>
        <%@include file="component/navbar.jsp" %>
        <div class="container admin">
            <div class="container-fluid mt-3">
                <%@include file="component/message.jsp" %> 
            </div>
            <div class="row mt-3">
                <!-- first col -->
                <div class="col-md-4">
                    <div class="card">
                        <div class="body-card text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid " src="img/man.png" alt="user icon">
                            </div>
                            <h1><%=m.get("userCount")%></h1>
                            <h2 class="text-uppercase text-muted">Users</h2>
                        </div>
                    </div>
                    
                </div>
                <!-- second col -->
                <div class="col-md-4">
                    <div class="card">
                        <div class="body-card text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid" src="img/list.png" alt="user icon">
                            </div>
                            <h1><%=categories.size()%></h1>
                            <h2 class="text-uppercase text-muted">Categories</h2>
                        </div>
                    </div>
                </div>
                <!-- third col -->
                <div class="col-md-4">
                    <div class="card">
                        <div class="body-card text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid" src="img/delivery-box.png" alt="user icon">
                            </div>
                            <h1><%=m.get("productCount")%></h1>
                            <h2 class="text-uppercase text-muted">Products</h2>
                        </div>
                    </div>
                </div>
            </div>
            <!-- second row -->
            <div class="row mt-3">
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="body-card text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid" src="img/add.png" alt="user icon">
                            </div>
                            <p class="mt-2">click here to add new category</p>
                            <h2 class="text-uppercase text-muted">Add Category</h2>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="body-card text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid" src="img/new-product.png" alt="user icon">
                            </div>
                            <p class="mt-2">click here to add new product</p>
                            <h2 class="text-uppercase text-muted">Add Product</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- add category modal -->
            <!-- Modal -->
            <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                  <div class="modal-header custom-bg text-white">
                    <h5 class="modal-title" id="exampleModalLabel">Fill Category details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                      <form action="ProductOperationServlet" method="post">
                          <input type="hidden" name="operation" value="addCategory">
                          <div class="form-group">
                              <input class="form-control" type="text" name="catTitle" placeholder="Enter category title" required>
                          </div>
                          <div class="form-group">
                              <textarea class="form-control" style="height:250px;" placeholder="Enter category description" name="catDescription" required></textarea>
                          </div>
                          <div class="container text-center">
                              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                              <button class="btn btn-outline-success">Add Category</button>
                          </div>
                      </form>
                  </div>
                </div>
              </div>
            </div>
        <!-- end category modal -->
        <!-- add product modal -->
            <!-- Modal -->
            <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                  <div class="modal-header custom-bg text-white">
                    <h5 class="modal-title" id="exampleModalLabel">Product details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                      <!-- form -->
                      <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                          <!-- operation type -->
                          <input type="hidden" name="operation" value="addProduct">
                          <!-- product title -->
                          <div class="form-group">
                              <input class="form-control" type="text" placeholder="Enter title of product" name="pName" required>
                          </div> 
                          <!-- product description -->
                          <div class="form-group">
                              <textarea style="height: 100px;" class="form-control" name="pDesc" placeholder="Enter product description" required></textarea>
                          </div>
                          <!-- product price -->
                          <div class="form-group">
                              <input class="form-control" type="number" placeholder="Enter the price of product" name="pPrice" required>
                          </div>     
                          <!-- product discount -->
                          <div class="form-group">
                              <input class="form-control" type="number" placeholder="Enter product discount" name="pDiscount" required>
                          </div>                          
                          <!-- product quantity -->
                          <div class="form-group">
                              <input class="form-control" type="number" placeholder="Enter the quantity of product" name="pQuantity" required>
                          </div> 
                          
                          <!-- product category -->
                          <div class="form-group">
                              <select name="catId" class="form-control">
                                  <%
                                  for(Category c:categories) {
                                  %>
                                      <option value="<%= c.getCategoryId() %>"><%= c.getCategoryTitle() %></option>
                                   <% } %>
                              </select>
                          </div>
                          
                          <!-- product file -->
                          <div class="form-group">
                              <label for="pPic">Select picture of product</label>
                              <input id="pPic" type="file" name="pPic" required>
                          </div>
                          <div class="container text-center">
                              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                              <button type="submit" class="btn btn-outline-success">Add Product</button>
                          </div>
                      </form>
                      <!-- end form -->
                  </div>
                </div>
              </div>
            </div>
        <!-- end product modal -->
        <%@include  file="component/common_modals.jsp" %>
    </body>
</html>
