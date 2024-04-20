<%

   User u=(User)session.getAttribute("current-user");
    if(u==null)
    {
        session.setAttribute("message", "you are not logged in !! Login first to access feedback page");
        response.sendRedirect("login.jsp");
        return;
    } 

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback Page</title>
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
          <h2 class="text-center my-3"><b>Feedback Form</b></h2>
          <hr style="background: #000;">
        </div>
        <br>
        
        <div class="container">
            <h5 style="text-align: center;"><%@include file="message.jsp" %></h5>
        </div>
        
        <br>
        <div class="container">
            <form action="FeedbackServlet" method="POST">
                <div class="form-group">
                        <label>Your Name</label>&nbsp;<label style="color: red;">*</label>
                        <input name="your_name" style="width: 500px; height: 45px;" type="text" class="form-control" value="<%= u.getName() %>" autocomplete="off" required>
                </div> 
                <br>
                <div class="form-group">
                        <label>Your Email</label>&nbsp;<label style="color: red;">*</label>
                        <input name="your_email" style="width: 500px; height: 45px;" type="text" class="form-control" placeholder="Enter your email" autocomplete="off" required>
                </div> 
                <br>
                <div class="form-group">
                    <label for="rate">Rate Our Website</label>&nbsp;<label style="color: red;">*</label>
                    <br>
                    <input type="radio" id="rate" name="rate" value="5"  required> 5 
                    <input type="radio"  name="rate" style="margin-left: 20px;" value="4" required> 4
                    <input type="radio"  name="rate" style="margin-left: 20px;" value="3" required> 3
                    <input type="radio"  name="rate" style="margin-left: 20px;" value="2" required> 2
                    <input type="radio"  name="rate" style="margin-left: 20px;" value="1" required> 1
                </div>
                <br>
                <div class="form-group">
                        <label>Your Feedback</label>&nbsp;<label style="color: red;">*</label>
                        <textarea name="feedback" style="height: 200px; width: 900px;" class="form-control" placeholder="Write something.." autocomplete="off" required></textarea> 
                </div>
                <br>
                <div class="form-group">
                        <label>Suggestion</label>
                        <textarea name="suggestion" style="height: 200px; width: 900px;" class="form-control" placeholder="Write something.." autocomplete="off"></textarea> 
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
