<%@page import="java.util.List"%>
<%@page import="com.grocery.shop.entities.Product"%>
<%@page import="com.grocery.shop.helper.ConnectionProvider"%>
<%@page import="com.grocery.shop.dao.ProductDao"%>
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
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body class="back">
        <%
            for(Product p:list) {
        %>
        <!--navbar-->
        <%@include file="navbar.jsp" %>
        
        <div class="container-fluid">
          <br>

        <div class="row mt-3">
            <div class="col-md-4 offset-md-4">

                <div class="card mt-3">
                    <div class="card-header text-white" style="background: green;">
                        <h3 class="text-center">Update Product</h3>
                    </div>
                <div class="card-body" >
        <form action="EditProductServlet" method="POST">

                <input type="hidden" class="form-control" name="pId" value="<%= p.getpId() %>"/>   

                    <div class="form-group">
                        <label>Product Name :</label>&nbsp;<label style="color: red;">*</label>
                        <input type="text" class="form-control" name="pName" value="<%= p.getpName() %>" autocomplete="off"/>
                    </div>

                    <div class="form-group">
                        <label>Product description :</label>&nbsp;<label style="color: red;">*</label>
                        <textarea style="height: 130px;" class="form-control"  name="pDesc" autocomplete="off"><%= p.getpDesc() %></textarea>          
                    </div>

                    <div class="form-group">
                        <label>Product Price :</label>&nbsp;<label style="color: red;">*</label>
                        <input type="number" class="form-control" name="pPrice" value="<%= p.getpPrice() %>" autocomplete="off"/>
                    </div>

                    <div class="form-group">
                        <label>Product Discount :</label>&nbsp;<label style="color: red;">*</label>
                        <input type="number" class="form-control" name="pdiscount" value="<%= p.getPdiscount() %>" autocomplete="off"/>
                    </div>

                    <div class="form-group">
                        <label>Product quantity :</label>&nbsp;<label style="color: red;">*</label>
                        <input type="number" class="form-control" name="pQuantity" value="<%= p.getpQuantity() %>" autocomplete="off"/>
                    </div>

                    <br>
                      <div class="container text-center">
                        <button type="submit" class="btn btn-primary">Update</button>
                        &nbsp;&nbsp;
                        <a href="view_products.jsp" class="btn btn-secondary">Back</a>
                      </div>
        </form>
               </div>
            </div>
        </div>
    </div>
 </div>
         <% }
        
         %>
    </body>
</html>
