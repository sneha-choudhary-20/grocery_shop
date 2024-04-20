<%@page import="com.grocery.shop.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.grocery.shop.entities.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.grocery.shop.entities.Category"%>
<%@page import="com.grocery.shop.dao.ProductDao"%>
<%@page import="com.grocery.shop.helper.ConnectionProvider"%>
<%@page import="com.grocery.shop.entities.User"%>
<%
    
    User u=(User)session.getAttribute("current-user");
    if(u==null)
    {
        session.setAttribute("message", "you are not logged in !! Login first");
        response.sendRedirect("login.jsp");
        return;
    }
    else
    {
        if(u.getRole().equals("normal"))
        {
           session.setAttribute("message", "you are not admin ! Do not access this page");
           response.sendRedirect("login.jsp");
           return; 
        }
    }
      
    
 %>
 
 
<%
     ProductDao dao = new ProductDao(ConnectionProvider.getConnection());
     List<Product> list = dao.getAllProducts();
 %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel-Products page</title>
        <!--CSS-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body style="background: #f0f1f2;">
        
        <!--navbar-->
        <%@include file="navbar1.jsp" %>
        <br>
        
        <div class="container">
            <h5 style="text-align: center;"> <%@include file="message.jsp" %></h5>
        </div>
        
        <br>  
        <div class="container" style="text-align: center;">
             <a href="admin.jsp" class="fa fa-user-circle-o" style="font-size: 70px;"></a>
        </div>
        
        <br>
            <h1><center>List of Products</center></h1>
           
        <br><br>
        <div class="container">
        <table class="table table-bordered table-striped table-hover">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>  
                    <th>Name</th>  
                    <th>Description</th>  
                    <th>Image</th>
                    <th>Price</th>
                    <th>Discount</th>  
                    <th>Quantity</th>  
                    <th class="text-center">Action1</th>
                    <th class="text-center">Action2</th>
                </tr>
            </thead> 
            <tbody>
                <%
                   for(Product p: list) { 
                %>
                <tr>
                    <td><%= p.getpId() %></td>  
                    <td><%= p.getpName() %></td>
                    <td><%= p.getpDesc() %></td>
                    <td><img src="img/<%= p.getpPhoto() %>" style="width:80px; height:80px;"></td>
                    <td><%= p.getpPrice() %></td>
                    <td><%= p.getPdiscount() %></td>
                    <td><%= p.getpQuantity() %></td>
                    <td> 
                        <a href="edit_product.jsp?pId=<%= p.getpId() %>" class="btn btn-primary">Update</a>
                    </td>
                    <td>
                        <a href="DeleteProductServlet?pId=<%= p.getpId() %>" class="btn btn-danger" onclick="return confirm('Are you sure, you want to delete this item?')">Delete</a>
                    </td>
                </tr>
                <%
                   }
                %>
            </tbody>
        </table>
        </div>
       
        <!--javascripts-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        
    </body>
</html>
