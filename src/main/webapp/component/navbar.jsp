<%@page import="java.util.List"%>
<%@page import="com.mycompany.phone_shoop.entities.Category"%>
<%@page import="com.mycompany.phone_shoop.helper.FactoryProvider"%>
<%@page import="com.mycompany.phone_shoop.Dao.CategoryDao"%>
<%@page import="com.mycompany.phone_shoop.entities.User"%>
<%
  User user1 =(User) session.getAttribute("current-user");
  CategoryDao  cdao2 = new CategoryDao(FactoryProvider.getFactory());
  List<Category> clist1=cdao2.getCategories();
                    
%>

<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
    <div class="container">
      <a class="navbar-brand" href="index.jsp">Phone Shoop</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Categories
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <% for (Category c: clist1) { %>
                <a class="dropdown-item" href="index.jsp?category=<%=c.getCategoryId()%>" class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>
              <%}%>
            </div>
          </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#!" data-toggle='modal' data-target="#cart"><i class="fa fa-cart-plus" style="font-size: 20px;"></i> <span class="cart-items" >( 1 )</span></a>
            </li>
            
            <%if(user1==null) {%>
            
            <li class="nav-item active">
                 <a class="nav-link" href="login.jsp">Login</a>
            </li>
            <li class="nav-item active">
                 <a class="nav-link" href="register.jsp">Register</a>
            </li>  
            
            <%} else {%>
            
            <li class="nav-item active">
                <a class="nav-link" href="<%= user1.getUserType().equals("admin")?"admin.jsp":"normal.jsp"%>"><%=user1.getUserName()%></a>
            </li>   
            <li class="nav-item active">
                 <a class="nav-link" href="LogoutServlet">Logout</a>
            </li> 
            
            <%}%>
            
            
        </ul>

      </div>
    </div>
</nav>