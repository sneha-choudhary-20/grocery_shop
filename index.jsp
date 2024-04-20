<%@page import="com.grocery.shop.entities.Cart"%>
<%@page import="com.grocery.shop.dao.CartDao"%>
<%@page import="java.util.List"%>
<%@page import="com.grocery.shop.helper.Helper"%>
<%@page import="com.grocery.shop.entities.Category"%>
<%@page import="com.grocery.shop.dao.CategoryDao"%>
<%@page import="com.grocery.shop.entities.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.grocery.shop.dao.ProductDao"%>
<%@page import="com.grocery.shop.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   User u=(User)session.getAttribute("current-user");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <!--CSS-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <!--navbar-->
        <% 
           if (u==null || u.getRole().equals("normal")) {
        %>
          <%@include file="navbar.jsp" %>
        <%           
           } else {
        %>
          <%@include file="navbar1.jsp" %>
        <%
           }
        %>
      <!--Slider or Carousel-->
      <div id="demo" class="carousel slide" data-ride="carousel">

          <!-- Indicators -->
          <ul class="carousel-indicators">
              <li data-target="#demo" data-slide-to="0" class="active"></li>
              <li data-target="#demo" data-slide-to="1"></li>
              <li data-target="#demo" data-slide-to="2"></li>
              <li data-target="#demo" data-slide-to="3"></li>
          </ul>

          <!-- The slideshow -->
          <div class="carousel-inner">
              <div class="carousel-item active" data-bs-interval="3000">
                  <img src="img/banner3 (4).jpg" alt="">
                  <div class="carousel-caption">
                    <h3 class="display-4" style="font-family: serif; font-variant: small-caps; letter-spacing: 10px;"><svg xmlns="http://www.w3.org/2000/svg" width="70" height="70" fill="currentColor" class="bi bi-cart4" viewBox="0 0 16 16">
                        <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
                        </svg>&nbsp;<b>Welcome to Fresh Grocer</b></h3>
                  </div>
              </div>
              <div class="carousel-item" data-bs-interval="3000">
                  <img src="img/banner8 (3).jpg" alt="">
              </div>
              <div class="carousel-item" data-bs-interval="3000">
                  <img src="img/banner1 (3).jpg" alt="">
              </div>
              <div class="carousel-item" data-bs-interval="3000">
                  <img src="img/banner6.jpg" alt="">
              </div>
          </div>

          <!-- Left and right controls -->
          <a class="carousel-control-prev" href="#demo" data-slide="prev">
              <span class="carousel-control-prev-icon"></span>
          </a>
          <a class="carousel-control-next" href="#demo" data-slide="next">
              <span class="carousel-control-next-icon"></span>
          </a>
      </div>
        <br>
        
        <h5 style="text-align: center;"><%@include file="message.jsp"%>  </h5>
    <div class="container-fluid">
        <div class="row mt-3 mx-2">
            
            
            <%
                String cat=request.getParameter("category");
                ProductDao dao=new ProductDao(ConnectionProvider.getConnection());
                List<Product> list=null;
                if (cat==null || cat.trim().equals("all"))
                {
                    list=dao.getAllProducts();
                } else
                {
                    int catId=Integer.parseInt(cat.trim());
                    list=dao.getProductByCatId(catId);
                }

                CategoryDao cdao=new CategoryDao(ConnectionProvider.getConnection());
                ArrayList<Category> clist=dao.getAllCategory();
                
             %>
            
            <!--show categories-->
            <div class="col-md-2">
                
                
                <div class="list-group mt-4">

                    <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                        All Products
                    </a>
              
                <%
                    
                   for(Category c:clist)
                   {
                      
                %>
                       
                       
                <a href="index.jsp?category=<%= c.getcId() %>" class="list-group-item list-group-item-action"><%= c.getcTitle() %></a>
                 
                 <%
                     }
                    
                 %>
                 
                </div>
            </div>
            
            <!--show products-->
            <div class="col-md-8">
            
                <div class="row mt-4">
                    
                    <div class="col-md-12">
                        <div class="card-columns">
                            <%      
                                    for (Product p : list) {
                                 
                            %>
                               
                            <!-- product card-->
                            <div class="card product-card div">
                                
                                <div class="container text-center">
                                    <img src="img/<%= p.getpPhoto() %>" style="max-height: 200px; max-width: 200px; width: auto;" class="card-img-top m-2" alt="..." onclick="window.location='show_products.jsp?pId=<%= p.getpId() %>'" >
                                </div>
                                
                                <div class="card-body">
                                    <h3 class="card-title"><%= p.getpName() %></h3>
                                    <p class="card-text">
                                        <%= Helper.get10Words(p.getpDesc()) %>
                                        <a href="show_products.jsp?pId=<%= p.getpId() %>" class="btn btn-primary btn-sm">More.</a>
                                     </p>
                                </div>
                               
                                <div class="card-footer text-center" style="background: #e2e2e2;">
                                   
                                    <% 
                                      if(u==null) {
                                    %>
                                       <a href="login.jsp" class="btn custom-bg text-white" style="font-size: 20px;">Add to Cart</a>
                                    <%
                                    } else {
                                    %>
                                       <a href="CartServlet?pid=<%=p.getpId()%>&&uid=<%=u.getId()%>"  class="btn custom-bg text-white" style="font-size: 20px;">Add to Cart</a>
                                    <%
                                    }
                                    %>
                                      &nbsp;&nbsp;
                                      <button class="btn text-grey" style="font-size: 20px;"> &#8377; <%= p.getPriceAfterApplyingDiscount() %>/- <span class="text-secondary discount-label"> &#8377; <%= p.getpPrice() %> , <%= p.getPdiscount() %>% off </span></button> 
                                </div>
                                
                            </div>
                            
                            <%  }
                            if(list.size()==0)
                            {
                               out.println("<h2>No item in this category</h2>");
                            }
                            %>

                        </div>
                       
                    </div> 
                   
                </div>
             
            </div>
           
        </div>
    </div>              
    
        <!--javascripts-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
