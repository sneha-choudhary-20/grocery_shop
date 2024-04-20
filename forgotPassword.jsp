<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot Password</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body class="back">
        <%@include file="navbar.jsp" %>
        <div class="container">
            <br>
            <br>
            <div class="row">
              <div class="col-md-6 offset-md-3">
                <div class="card mt-3">
                  <div class="card-body">
                   <h3 class="text-center m-3">Your Registered Email</h3>
                   <h5 style="text-align: center;"><%@include file="message.jsp"%> </h5>
                   <form action="forgotPasswordServlet" method="post" onsubmit="return validation()" class="bg-light">
                <br>
                <div class="form-group">
                    <label>Email address</label>&nbsp;<label style="color: red;">*</label>
                    <input name="email" id="email"  type="email" class="form-control"  placeholder="Enter email" autocomplete="off">
                    <span id="emailid" class="text-danger font-weight-bold"></span>
                </div>
                
                <div class="form-group">
                    <label>Set New Password</label>&nbsp;<label style="color: red;">*</label>
                    <input type="password" id="pass" name="pass" class="form-control" placeholder="Enter your new password" autocomplete="off">
                    <span id="password" class="text-danger font-weight-bold"></span>
                </div>
                
                <div class="form-group">
                    <label>Confirm New Password</label>&nbsp;<label style="color: red;">*</label>
                    <input type="password" id="conpass" name="cpass" class="form-control" placeholder="Enter your confirm password" autocomplete="off">
                    <span id="confirmpass" class="text-danger font-weight-bold"></span>
                </div>
                <br>
                <div class="container text-center">
                    <button type="submit" class="btn btn-warning">Save</button>
                    &nbsp;&nbsp;
                    <a href="login.jsp" class="btn btn-secondary">Back</a>
                </div>
            </form> 
                  </div>
                </div>
              </div>
            </div>
        </div>
        <!--javascripts-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>    
        <script>
          function validation() {
              var email = document.getElementById('email').value;
              var pass = document.getElementById('pass').value;
              var conpass = document.getElementById('conpass').value;
              
              if(email=="") {
                  document.getElementById('emailid').innerHTML = " * Please fill the email id field";
                  return false;
              }
              
             if(pass=="") {
                  document.getElementById('password').innerHTML = " * Please fill the password field";
                  return false;
              } 
              
              if((pass.length < 8) || (pass.length >10)) {
                    document.getElementById('password').innerHTML = "* password must be alphanumeric/special characters with minimum 8 to 10 characters long";
                    return false;
              }
              
              if(pass!=conpass) {
                  document.getElementById('confirmpass').innerHTML = "* password are not matching";
                  return false;
              }
              
              if(conpass=="") {
                  document.getElementById('confirmpass').innerHTML = " * Please fill the confirmpassword field";
                  return false;
              }
           
          }
        
        </script>
    </body>
</html>
