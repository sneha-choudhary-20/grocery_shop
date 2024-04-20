<%@page import="java.util.List"%>
<%@page import="com.grocery.shop.entities.Product"%>
<%@page import="com.grocery.shop.helper.ConnectionProvider"%>
<%@page import="com.grocery.shop.dao.ProductDao"%>
<%
   User u=(User)session.getAttribute("current-user");
%>

<%
   ProductDao dao=new ProductDao(ConnectionProvider.getConnection());
   int pId=Integer.parseInt(request.getParameter("pId"));
   List<Product> list=null;
   if(pId==0) {
       list=dao.getProductBypId(pId);
   }else
   {
       list=dao.getAllProducts();
       list=dao.getProductBypId(pId);
  
   }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show Products Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body class="back">
        <%
            for(Product p:list) {
        %>
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
        <!--main content of body-->
        <div class="container">
            <div class="row my-4">
                <div class="col-md-8 offset-md-2">
                    <div class="card">
                        <div class="card-header text-center text-white" style="background:#2874a6;">
                            <h3><%= p.getpName() %></h3>
                        </div>
                        
                        <div class="card-body text-center">
                            <img src="img/<%= p.getpPhoto() %>" style="max-height: 200px; max-width: 300px; width: auto;" class="card-img-top my-2" alt="...">
                            <br>
                            <br>
                            <p style="font-size:20px; font-weight: 100; text-align: left;"><%= p.getpDesc() %></p>
                            
                            <br>
                            <br>
                        </div>
                           
                            <div class="card-footer text-center" style="background:#2874a6;">
                                <% 
                                    if(u==null) {
                                %>
                                    <a href="login.jsp" class="btn custom-bg text-white" style="font-size: 20px;">Add to Cart</a>
                                <%
                                } else {
                                %>
                                    <a href="CartServlet?pid=<%=p.getpId()%>&&uid=<%=u.getId()%>" class="btn custom-bg text-white" style="font-size: 20px;">Add to Cart</a>
                                <%
                                }
                                %>
                                    &nbsp;&nbsp;
                                <button class="btn text-grey" style="font-size: 20px;"> &#8377; <%= p.getPriceAfterApplyingDiscount() %>/- <span class="text-secondary discount-label"> &#8377; <%= p.getpPrice() %> , <%= p.getPdiscount() %>% off </span></button> 
                            </div>
                    </div>
                </div>
            </div>
        </div>
        
        <% }
        %>
             
        <!--javascripts-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
       
    </body>
</html>
