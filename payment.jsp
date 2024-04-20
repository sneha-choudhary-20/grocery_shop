<%@page import="com.grocery.shop.entities.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.grocery.shop.dao.CartDao"%>
<%@page import="com.grocery.shop.helper.ConnectionProvider"%>
<%
  User u=(User)session.getAttribute("current-user");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Page</title>
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
          <h5 style="text-align: center;"> <%@include file="message.jsp" %> </h5>
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
                                </tr>
                            </thead>
                            <tbody>
                                <%  
                                    CartDao dao = new CartDao(ConnectionProvider.getConnection());
                                    List<Cart> cart = dao.getProductByUser(u.getId());
                                    int total_price = 0;
                                    for (Cart c : cart) {
                                    total_price = c.getTotal_price();
                                %>
                                <tr>
                                    <td><%= c.getPname()%></td>
                                    <td><%= c.getPrice()%></td>
                                    <td>1</td>
                                </tr>
                                <%
                                    }
                                %>
                                <tr>
                                    <td>Total Price :</td>
                                    <td></td>
                                    <td><b><%= total_price%></b></td>
                                </tr>
                            </tbody>
                        </table>

                    </div>
                </div>

            </div>
            
        <div class="col-md-4">
           <!-- payment details-->
           <div class="card px-3">
               <div class="card-body">
                   <h3 class="text-center mb-5">Payment Details</h3>
                   <form action="order_success.jsp"  method="POST" onsubmit="return validation()">
                       <div>
                           <div class='icons' data-value="credit"><i class="fa fa-cc-visa" style="font-size: 50px; color: #1c84c6;"></i> <i class="fa fa-cc-amex" style="font-size: 50px; color: #ed5565"></i> <i class="fa fa-cc-paypal" style="font-size: 50px; color: blue;"></i> <i class="fa fa-cc-discover" style="font-size: 50px; color: lightsalmon;"></i>  </div>
                       </div> 
                       
                       <br>
                        <div class="form-group">
                            <label >Card Number</label>&nbsp;<label style="color: red;">*</label>
                            <input type="number" name="card_no" class="form-control" placeholder="Enter card number" style="width: 500px; height: 45px;" required>
                        </div>
                          
                       <div class="form-group">
                            <label>Card Holder Name</label>&nbsp;<label style="color: red;">*</label>
                            <input type="text" name="card_name" class="form-control" placeholder="Enter card holder name" style="width: 500px; height: 45px;" required>
                       </div> 
                       
                        <div class="form-group">
                            <label for="inputState">Payment Type</label>&nbsp;<label style="color: red;">*</label>
                            <select id="inputState" class="form-control" style="width: 500px; height: 45px;" required>
                              <option selected disabled value="">Choose...</option>
                              <option>Credit</option>
                              <option>Debit</option>
                           </select>
                        </div>
                        
                        <div class="form-group">
                           <label>Expiration Date</label>&nbsp;<label style="color: red;">*</label>
                           <div class="col-sm-10 form-inline"> 
                               <select class="form-control" required>
                                <option value="">00</option>
                                <option value="01">01</option>
                                <option value="01">02</option>
                                <option value="01">03</option>
                                <option value="01">04</option>
                                <option value="01">05</option>
                                <option value="01">06</option>
                                <option value="01">07</option>
                                <option value="01">08</option>
                                <option value="01">09</option>
                                <option value="01">10</option>
                                <option value="01">11</option>
                                <option value="01">12</option>
                            </select>
                            
                            &nbsp;&nbsp;
                            <span class="divider">
                                <select class="form-control" required>
                                    <option value="">2021</option>
                                    <option value="01">2022</option>
                                    <option value="01">2023</option>
                                    <option value="01">2024</option>
                                    <option value="01">2025</option>
                                    <option value="01">2026</option>
                                    <option value="01">2027</option>
                                    <option value="01">2028</option>
                                    <option value="01">2029</option>
                                    <option value="01">2030</option>
                                    <option value="01">2031</option>
                                    <option value="01">2032</option>
                                    <option value="01">2033</option>
                                </select>
                            </span>
                           </div>
                        </div>
                      
                         <div class="form-group">
                           <label>CVV No.</label>&nbsp;<label style="color: red;">*</label>
                           <input type="number" name="cvv" class="form-control" placeholder="Enter CVV no" style="width: 500px; height: 45px;" required> 
                         </div>  
                      
                       <br>
                        <div class="container text-center">
                           <button type="submit" class="btn btn-primary" style="height: 45px; width: 100px;">Submit</button>
                           &nbsp;&nbsp;
                           <a href="checkout.jsp" class="btn btn-outline-primary">Go to Checkout</a>
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
