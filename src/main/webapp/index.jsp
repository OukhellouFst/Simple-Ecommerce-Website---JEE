<%@page import="com.mycompany.phone_shoop.helper.Helper"%>
<%@page import="com.mycompany.phone_shoop.entities.Category"%>
<%@page import="com.mycompany.phone_shoop.Dao.CategoryDao"%>
<%@page import="com.mycompany.phone_shoop.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.phone_shoop.helper.FactoryProvider"%>
<%@page import="com.mycompany.phone_shoop.Dao.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
                <%
                    String cat=request.getParameter("category");
                    
                    ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> plist = null;
                    if(cat==null||cat.trim().equals("all")) {                    
                        plist=productDao.getAllProducts();
                    }else{
                        int cid =Integer.parseInt(cat.trim());
                        plist=productDao.getAllProductsByCatId(cid);
                    }
                    
                    CategoryDao  cdao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> clist=cdao.getCategories();
                    
                    
                %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="component/common_css_js.jsp" %>
        <title>Home Page</title>
    </head>
    <body>
        <%@include file="component/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-3 mx-1">
                <!-- show categories -->
                <div class="col-md-2">
                    <div class="list-group mt-4">
                        <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                          All Products
                        </a>
                    </div>
                    <% for (Category c: clist) { %>
                        <a href="index.jsp?category=<%=c.getCategoryId()%>" class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>
                    <%}%>
                </div>
                <!-- show products -->
                <div class="col-md-10"> 
                    <div class="row mt-4">
                        <div class="col-md-12">
                            
                            <!-- empty category message -->
                            <%if(plist.size()==0) {%>
                            <div class="alert alert-primary" role="alert">
                            There is no product in this category :(
                            </div>
                            <%}else {%>
                            
                            <div class="card-columns">
                                <!-- Traversing (loop) products -->
                                <%for(Product p:plist){%>
                                <div class="card product-card">
                                    <div class="container text-center mt-2">
                                        <img class="card-img-top" style="max-height: 200px; max-width: 100%; width: auto; " src="img/products/<%= p.getpPhoto()%>" alt="Card image cap">
                                    </div> 
                                    <div class="card-body">
                                        <h5 class="card-title"><%=p.getpName()%></h5>
                                        <p class="card-text"><%=Helper.get10Words(p.getpDesc())%></p>
                                    </div>
                                    <div class="card-footer">
                                        <button class="btn custom-bg text-white mt-2" onclick='add_to_cart(<%=p.getpId()%>,"<%=p.getpName()%>",<%=p.getPriceAfterApplyingDiscount()%>)'> Add to Cart </button>
                                        <button class="btn btn-outline-success mt-2"> <%=p.getPriceAfterApplyingDiscount()%>&#x20AC; - <span class="text-secondary discount-label"><s><%=p.getpPrice()%>&#x20AC;</s> <%=p.getpDiscount()%>% off</span></button>
                                    </div>
                                </div>
                                <% } }%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="component/common_modals.jsp" %>
    </body>
</html>
