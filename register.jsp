<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <!--CSS-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css">  
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body class="back">
        
        <!--navbar-->
        <%@include file="navbar.jsp" %>  
       
        <div class="container-fluid">
            <br>
           
            <div class="row mt-3">
            <div class="col-md-4 offset-md-4">
                
                <div class="card">
                    <h5 style="text-align: center;">
                      <%@include file="message.jsp" %>
                    </h5>
                    <div class="card-body px-5" >
                        
                        <div class="container text-center">
                            <img src="img/signup.png" style="max-width: 100px;" class="img-fluid" alt="">
                        </div>
                        
                      <h3 class="text-center my-3">Sign up here !!</h3>
                
                      <form action="Registerservlet" onsubmit="return validation()" method="POST">
                  <div class="form-group">
                      <label>Name</label>&nbsp;<label style="color: red;">*</label>
                        <input name="user_name"  type="text" class="form-control" id="name" placeholder="Enter here" aria-describedby="emailHelp" autocomplete="off">
                        <span id="username" class="text-danger font-weight-bold"></span>
                  </div>  
                  <div class="form-group">
                        <label>Email Id</label>&nbsp;<label style="color: red;">*</label>
                        <input name="user_email"  type="text" class="form-control" id="email" placeholder="Enter here" aria-describedby="emailHelp" placeholder="Enter email" autocomplete="off">
                        <span id="emailid" class="text-danger font-weight-bold"></span>
                  </div> 
                  <div class="form-group">
                        <label>Password</label>&nbsp;<label style="color: red;">*</label>
                        <input name="user_password" type="password" class="form-control" id="password" placeholder="Enter here" aria-describedby="emailHelp" autocomplete="off">
                        <span id="pass" class="text-danger font-weight-bold"></span>
                  </div> 
                  <div class="form-group">
                        <label>Phone no</label>&nbsp;<label style="color: red;">*</label>
                        <input name="user_phone"  type="number" class="form-control" id="phone" placeholder="Enter here" aria-describedby="emailHelp" autocomplete="off">
                        <span id="phoneno" class="text-danger font-weight-bold"></span>
                  </div> 
                  <div class="form-group">
                        <label>Address</label>&nbsp;<label style="color: red;">*</label>
                        <textarea name="user_address" style="height:100px;" class="form-control" id="address" placeholder="Enter your address" autocomplete="off"></textarea>
                        <span id="add" class="text-danger font-weight-bold"></span>
                  </div> 
                    <br>
                    <div class="container text-center">
                        <button type="submit" class="btn btn-primary">Submit</button>
                        &nbsp;
                        <button type="reset" class="btn btn-primary">Reset</button>
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
                var name = document.getElementById('name').value;
                var email = document.getElementById('email').value;
                var password = document.getElementById('password').value;
                var phone = document.getElementById('phone').value;
                var address = document.getElementById('address').value;
        
               if(name == "") {
                    document.getElementById('username').innerHTML = "* Please fill the username field";
                    return false;
                }
               
               if(!name.match(/^[a-zA-Z\s]*$/)) {
                  document.getElementById('username').innerHTML = " * only characters and spaces are allowed";
                  return false; 
               }
               
                if(email == "") {
                    document.getElementById('emailid').innerHTML = " * Please fill the email id field";
                    return false;
                }
                
                if(!email.match(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/)) {
                    document.getElementById('emailid').innerHTML = " * Please include an '@' in the email address";
                    return false;
                }
                
                if(password == "") {
                    document.getElementById('pass').innerHTML = " * Please fill the password field";
                    return false;
                }
                
                if((password.length < 8) || (password.length >10)) {
                    document.getElementById('pass').innerHTML = "* password must be alphanumeric/special characters with minimum 8 to 10 characters long";
                    return false;
                }
                
                if(phone == "") {
                    document.getElementById('phoneno').innerHTML = "* Please fill the mobile no field";
                    return false;
                }
               
                if(phone.length!=10) {
                    document.getElementById('phoneno').innerHTML = "* Mobile no must be 10 digits only";
                    return false;
                }
                     
                if(address == "") {
                    document.getElementById('add').innerHTML = "* Please fill the address field";
                    return false;
                }   
        }
        </script>
    </body>
</html>
