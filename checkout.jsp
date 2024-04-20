<%@page import="com.grocery.shop.dao.ProductDao"%>
<%@page import="com.grocery.shop.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.grocery.shop.entities.Cart"%>
<%@page import="com.grocery.shop.dao.CartDao"%>
<%@page import="com.grocery.shop.helper.ConnectionProvider"%>
<%

   User u=(User)session.getAttribute("current-user");
    if(u==null)
    {
        session.setAttribute("message", "you are not logged in !! Login first to access checkout page");
        response.sendRedirect("login.jsp");
        return;
    } 

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout Page</title>
        <!--CSS-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body class="back">
        <!--navbar-->
        <%@include file="navbar.jsp" %>
        <br>
        
        <div class="container">
          <h5 style="text-align: center;"><%@include file="message.jsp" %></h5>
        </div>
            <div class="row mt-5">
                <div class="col-md-4 offset-md-2">
                    <!--card-->
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-5">Your Selected Items</h3>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col">Item Name</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%  
                                       CartDao dao = new CartDao(ConnectionProvider.getConnection());
                                       List<Cart> cart = dao.getProductByUser(u.getId());
                                       int total_price=0;
                                       for (Cart c : cart) {
                                          total_price=c.getTotal_price();
                                    %>
                                    <tr>
                                        <td><%= c.getPname() %></td>
                                        <td><%= c.getPrice() %></td>
                                        <td>1</td>
                                        <td>
                                            <a href="RemoveProductCartServlet?pid=<%= c.getPid() %>&&uid=<%= c.getUid() %>&&cid=<%= c.getCid() %>" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure, you want to remove this item?')">Remove</a>
                                        </td>
                                    </tr>
                                    <%
                                     }
                                    %>
                                    <tr>
                                        <td>Total Price :</td>
                                        <td></td>
                                        <td></td>
                                        <td><b><%= total_price %></b></td>
                                    </tr>
                                </tbody>
                            </table>

                        </div>
                    </div>
                    
                </div>
                
                <div class="col-md-4">
                    <!--form details-->
                     <div class="card px-3">
                        <div class="card-body">
                            <h3 class="text-center mb-5">Your Details for Order</h3>
                            <form action="OrderServlet" method="POST">
                                <input type="hidden" value="<%= u.getId() %>" name="id">
                                
                                <div class="form-group">
                                    <label>Your name</label>&nbsp;<label style="color: red;">*</label>
                                    <input  name="user_name" value="<%= u.getName() %>" type="text" class="form-control" id="name"  placeholder="Enter name" required autocomplete="off" readonly>
                                </div>
                                
                                <div class="form-group">
                                    <label>Email address</label>&nbsp;<label style="color: red;">*</label>
                                    <input  name="user_email" value="<%= u.getEmail() %>" type="email" class="form-control" id="exampleInputEmail1"  placeholder="Enter email" required autocomplete="off">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                    
                                <div class="form-group">
                                    <label>Your contact</label>&nbsp;<label style="color: red;">*</label>
                                    <input  name="user_phone" value="<%= u.getPhone() %>" type="text" class="form-control" id="phone"  placeholder="Enter contact number" required autocomplete="off">
                                </div>

                                <div class="form-group">
                                    <label>Your shipping address</label>&nbsp;<label style="color: red;">*</label>
                                    <textarea style="height: 100px;" name="user_address" class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="Enter your address" required autocomplete="off"><%= u.getAddress() %> </textarea>
                                </div>
                                
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label>Pin code</label>&nbsp;<label style="color: red;">*</label>
                                    <input name="pincode" type="number" class="form-control" id="pincode"  placeholder="Enter pincode" required autocomplete="off">
                                </div>
                             
                                <div class="form-group col-md-6">
                                    <label>City</label>&nbsp;<label style="color: red;">*</label>
                                    <input name="city"  type="text" class="form-control" id="city"  placeholder="Enter your city" required autocomplete="off">
                                </div>
                            </div>
                                 
                                <div class="form-group">
                                    <label>State</label>&nbsp;<label style="color: red;">*</label>
                                    <input  name="state" type="text" class="form-control" id="state"  placeholder="Enter your state" required autocomplete="off">
                                </div>
                                
                                <div class="form-group">
                                    <label>Payment Mode</label>&nbsp;<label style="color: red;">*</label>
                                    <select class="form-control" name="paymentType">
                                        <option value="noselect">--Select Payment Mode--</option>
                                        <option value="COD">Cash on Delivery</option>
                                        <option value="Card">Debit/Credit Card</option>
                                    </select>
                                </div>
                                 
                                <br>
                                
                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Order Now</button>
                                    &nbsp;&nbsp;
                                    <a href="index.jsp" class="btn btn-outline-primary">Continue Shopping</a>
                                </div>
                                    
                                    
                            </form>
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
