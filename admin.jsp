<%@page import="com.grocery.shop.entities.Cart"%>
<%@page import="com.grocery.shop.dao.CartDao"%>
<%@page import="com.grocery.shop.dao.UserDao"%>
<%@page import="java.util.List"%>
<%@page import="com.grocery.shop.entities.Product"%>
<%@page import="com.grocery.shop.dao.ProductDao"%>
<%@page import="com.grocery.shop.entities.Category"%>
<%@page import="java.util.ArrayList"%>
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
     ProductDao dao=new ProductDao(ConnectionProvider.getConnection());
     ArrayList<Category> list=dao.getAllCategory();
     
     List<Product> Arraylist=dao.getAllProducts();
 %>
 
<%
     UserDao user=new UserDao(ConnectionProvider.getConnection());
     List<User> Arraylist1=user.getAllUsers(); 
%>
 
 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <!--CSS-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body class="back">
        <!--navbar-->
        <%@include file="navbar1.jsp" %>
        
        <div class="container">
            <h5 style="text-align: center;"> <%@include file="message.jsp" %></h5>
        </div>
        
        <div class="container admin">
           <!--first row-->
           <div class="row mt-3">
               <!--first col-->
               <div class="col-md-4">
                   <div onclick="window.location='view_users.jsp'" class="card" data-toggle="tooltip" data-placement="left" title="Number of users in this website">
                       <div class="card-body text-center">
                           <div class="container">
                               <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/team.png" alt="user_icon">
                           </div>
                           
                           <h1><%= Arraylist1.size() %></h1>
                           <h1 class="text-uppercase text-muted">Users</h1>
                       </div>
                   </div>
               </div>
               
               <!--second col-->
               <div class="col-md-4">
                   <div onclick="window.location='view_category.jsp'" class="card" data-toggle="tooltip" data-placement="bottom" title="Total categories">
                       <div class="card-body text-center">
                           <div class="container">
                               <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/list.png" alt="category_icon">
                           </div>
                           <h1><%= list.size() %></h1>
                           <h1 class="text-uppercase text-muted">Categories</h1>
                       </div>
                   </div>
                 </div> 
               
               <!--third col-->
               <div class="col-md-4">
                   <div class="card" data-toggle="tooltip" data-placement="right" title="Total no of products">
                       <div class="card-body text-center">
                           <div class="container">
                               <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/box.png" alt="products_icon">
                           </div>
                           <h1><%= Arraylist.size() %></h1>
                           <h1 class="text-uppercase text-muted">Products</h1>
                       </div>
                   </div>
              </div> 
           </div>
        
        <!--second row : first col-->
        <div class="row mt-3">
            <div class="col-md-6">
                <div  class="card" data-toggle="modal" data-target="#add-category-modal">
                       <div class="card-body text-center">
                           <div class="container">
                               <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/web.png" alt="addcategory_icon">
                           </div>
                           <p class="mt-2">Click here to add new category</p>
                           <h1 class="text-uppercase text-muted">Add Category</h1>
                           
                       </div>
                </div>
            </div>
            
            <!--second row : second col-->
            <div class="col-md-6">
                <div class="card" data-toggle="modal" data-target="#add-product-modal">
                       <div class="card-body text-center">
                           <div class="container">
                               <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/plus.png" alt="addproduct_icon">
                           </div>
                           <p class="mt-2">Click here to add new product</p>
                           <h1 class="text-uppercase text-muted">Add Product</h1>
                       </div> 
                </div>  
            </div>
        </div>
        
        <!-- third row: first col-->
        <div class="row mt-3">
           <div class="col-md-6">
               <div onclick="window.location='view_products.jsp'" class="card" data-toggle="tooltip" data-placement="left" title="Click here to view all products">
                       <div class="card-body text-center">
                           <div class="container">
                               <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/view.png" alt="viewproducts_icon">
                           </div>
                           <p class="mt-2">Click here to view all the products</p>
                           <h1 class="text-uppercase text-muted">View Products</h1>
                       </div>
                </div>
            </div> 
        
        
        <!--third row: second col-->
            <div class="col-md-6">
                <div onclick="window.location='view_orders.jsp'" class="card" data-toggle="tooltip" data-placement="right" title="Click here to view all orders">
                    <div class="card-body text-center">
                        <div class="container">
                            <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/research.png" alt="vieworders_icon">
                        </div>
                        <p class="mt-2">Click here to view all the orders</p>
                        <h1 class="text-uppercase text-muted">View Orders</h1>
                    </div>
                </div>
            </div> 
        
        </div>
      </div>
    
        <!--add category modal-->

        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg">
                        <h5 class="modal-title text-white" id="exampleModalLongTitle">Fill Category Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="AddCategoryServlet" method="POST">
                            
                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required autocomplete="off"/> &nbsp;<label style="color: red;">*</label>
                            </div>
                            
                            <div class="form-group">
                                <textarea style="height: 150px;" class="form-control" placeholder="Enter category description" name="catDesc" required autocomplete="off"></textarea> &nbsp;<label style="color: red;">*</label>          
                            </div>
                            
                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-success">Add Category</button>
                                &nbsp;&nbsp;
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                          
                        </form>
                            
                    </div>
                </div>
            </div>
        </div>
        <!--End add category modal-->
        
        
        <!-- add product modal-->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg">
                        <h5 class="modal-title text-white" id="exampleModalLongTitle">Product Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="AddProductServlet" method="POST" enctype="multipart/form-data">
                            
                            <div class="form-group">
                                <input type="text" class="form-control" name="pName" placeholder="Enter product title" required autocomplete="off"/>&nbsp;<label style="color: red;">*</label>
                            </div>
                            
                            <div class="form-group">
                                <textarea style="height: 150px;" class="form-control" placeholder="Enter product description" name="pDesc" required autocomplete="off"></textarea> &nbsp;<label style="color: red;">*</label>         
                            </div>
                            
                             <div class="form-group">
                                <input type="number" class="form-control" name="pPrice" placeholder="Enter product price" required autocomplete="off"/>&nbsp;<label style="color: red;">*</label>
                            </div>
                            
                             <div class="form-group">
                                <input type="number" class="form-control" name="pdiscount" placeholder="Enter product discount" required autocomplete="off"/>&nbsp;<label style="color: red;">*</label>
                            </div>
                            
                             <div class="form-group">
                                <input type="number" class="form-control" name="pQuantity" placeholder="Enter product quantity" required autocomplete="off"/>&nbsp;<label style="color: red;">*</label>
                            </div>
                            
                            
                            <div class="form-group">
                                 <select name="cid" class="form-control" required>
                                     <option selected disabled value="">---Select Category---</option>
                                     
                                     <% 
                            
                                         for(Category category:list) {
                                     %>
                               
                                     <option value="<%= category.getcId() %>"> <%=category.getcTitle() %> </option>
                                     
                                     <% 
                                      }
                                     %>
                                 </select> 
                            </div>
                            
                             <div class="form-group">
                                <label for="pPic">Select Picture of product</label>&nbsp;<label style="color: red;">*</label>
                                <br>
                                <input type="file" id="pPic" name="pPic" required/>
                            </div>
                            
                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-success">Add Product</button>
                                &nbsp;&nbsp;
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                         
                        </form>
                            
                    </div>
                </div>
            </div>
        </div>
        <!--End add product modal-->
        
        <!--javascripts-->
        <script
           src="https://code.jquery.com/jquery-3.6.0.min.js"
           integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous">
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        
        <script>
            $(function () {
                 $('[data-toggle="tooltip"]').tooltip()
            })
        </script>
    </body>
</html>
