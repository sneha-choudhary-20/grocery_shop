<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login -MyGroceries</title>
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
                        <div class="card-header custom-bg text-white">
                            <h3><center>Login here</center></h3>
                        </div>
                        
                        <div class="card-body">
                            <%@include file="message.jsp" %>
                            <form action="LoginServlet" onsubmit="return validation()" method="POST">
                              <div class="form-group">
                                <label>Email address</label>&nbsp;<label style="color: red;">*</label>
                                <input name="email"  type="email" class="form-control" id="email" placeholder="Enter email" autocomplete="off">
                                <span id="emailid" class="text-danger font-weight-bold"></span>
                              </div>
                             <div class="form-group">
                                <label>Password</label>&nbsp;<label style="color: red;">*</label>
                                <input name="password"  type="password" class="form-control" id="password" placeholder="Enter Password" autocomplete="off">
                                <span id="pass" class="text-danger font-weight-bold"></span>
                             </div>
                                <p class="d-block"> If not registered ?&nbsp;&nbsp;<a href="register.jsp" class="text-center  mb-2">Click here </a></p>
                                <p class="text-center"><a href="forgotPassword.jsp">Forgot Password ?</a></p>
                             <div class="container text-center">
                                <button type="submit" class="btn btn-primary border-0">Submit</button>
                                &nbsp;
                                <button type="reset" class="btn btn-primary border-0">Reset</button>
                             </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--javascripts-->
        <script
           src="https://code.jquery.com/jquery-3.6.0.min.js"
           integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous">
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>
            function validation() {
                var email = document.getElementById('email').value;
                var password = document.getElementById('password').value;
                
                 if(email == "") {
                    document.getElementById('emailid').innerHTML = " * Please fill the email id field";
                    return false;
                }
                
                if(password == "") {
                    document.getElementById('pass').innerHTML = " * Please fill the password field";
                    return false;
                }
            }
            
        </script>
    </body>
</html>
