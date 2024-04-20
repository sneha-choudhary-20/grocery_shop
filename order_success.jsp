<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--CSS-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body style="background: #f0f1f2;">
        <!--navbar-->
        <%@include file="navbar.jsp" %>
        <br><br><br>
        <br><br>
        <div class="container text-center mt-3">
            <i class="fa fa-check-circle fa-5x text-success" style="font-size:110px;"></i>
            <h1>Thank You for shopping with us.</h1>
            <h2>Your order has been placed !</h2>
            <br>
            <h4>Within 1-2 Days Your Product will be Delivered In your Address that is provided.</h4>
            <a href="index.jsp" class="btn btn-primary mt-3">Home</a>
            &nbsp;&nbsp;
            <a href="user_order.jsp" class="btn btn-danger mt-3">View Order</a>
        </div>
        
    </body>
</html>
