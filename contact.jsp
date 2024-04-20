<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Page</title>
        <!--CSS-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body class="back">
        <!--navbar-->
        <%@include file="navbar.jsp" %>
        
        <div class="container">
           <br>
           <h2 class="text-center my-3"><b>Contact Form</b></h2>
           <hr style="background: #000;">
        </div>
        <br>
        
        <div class="container">
            <h5 style="text-align: center;"><%@include file="message.jsp" %></h5>
        </div>
        
        <br>
        <div class="container">
            <form action="ContactServlet" method="POST">
                <div class="form-group">
                        <label>Your Name</label>&nbsp;<label style="color: red;">*</label>
                        <input name="your_name"  style="width: 500px; height: 45px;" type="text" class="form-control" placeholder="Enter your name" autocomplete="off" required>
                </div> 
                <br>
                <div class="form-group">
                        <label>Your Email</label>&nbsp;<label style="color: red;">*</label>
                        <input name="your_email"  style="width: 500px; height: 45px;" type="text" class="form-control" placeholder="Enter your email" autocomplete="off" required>
                </div> 
                <br>
                <div class="form-group">
                        <label>Message</label>&nbsp;<label style="color: red;">*</label>
                        <textarea name="message"  id="message" style="height: 200px; width: 900px;" class="form-control" placeholder="Enter your query here" style="height:200px" autocomplete="off" required></textarea> 
                </div>
                <br>
                 <div class="container">
                        <button type="submit" class="btn btn-primary">Submit</button>
                 </div>
            </form>
        </div>
        <!--javascripts-->
        <script
           src="https://code.jquery.com/jquery-3.6.0.min.js"
           integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous">
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
