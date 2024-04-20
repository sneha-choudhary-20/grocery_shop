<%@page import="com.grocery.shop.entities.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.grocery.shop.dao.OrderDao"%>
<%@page import="com.grocery.shop.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product- Order Page</title>
         <!--CSS-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body style="background: #f0f1f2;">
        <!--navbar-->
        <%@include file="navbar.jsp" %>
        <br>
        <br>
        <div class="container" style="text-align: center;">
           <a href="index.jsp" class="fa fa-user-circle-o" style="font-size: 70px;"></a>
        </div>
        <br>
        <div class="container p-1">
            <h3 class="text-center text-primary"> Your Order</h3>
            <br>
            <table class="table table-striped mt-3">
                <thead class="custom-bg text-white">
                    <tr>
                        <th scope="col">Order Id</th>
                        <th scope="col">Name</th>
                        <th scope="col">Product Name</th>
                        <th scope="col">Price</th>
                        <th scope="col">Payment Type</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                       User u=(User)session.getAttribute("current-user");
                       OrderDao dao=new OrderDao(ConnectionProvider.getConnection());
                       List<Order> olist=dao.getProduct(u.getEmail());
                       for(Order o:olist) {
                    %>
                       <tr>
                           <th scope="row"><%= o.getOrder_id() %></th>
                           <td><%= o.getName() %></td>
                           <td><%= o.getItem_name() %></td>
                           <td><%= o.getPrice() %></td>
                           <td><%= o.getPayment() %></td>
                       </tr>
                       <%
                       }
                       %>
                </tbody>
            </table>
        </div>
        
    </body>
</html>
