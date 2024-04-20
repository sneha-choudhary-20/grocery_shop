<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   User u=(User)session.getAttribute("current-user");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Page</title>
        <!--CSS-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <!--navbar-->
        <% 
           if (u==null || u.getRole().equals("normal")) {
        %>
          <%@include file="navbar.jsp" %>
        <%           
           } else {
        %>
          <%@include file="navbar1.jsp" %>
        <%
           }
        %>
        <!--Slider or Carousel-->
      <div id="demo" class="carousel slide" data-ride="carousel">

          <!-- Indicators -->
          <ul class="carousel-indicators">
              <li data-target="#demo" data-slide-to="0" class="active"></li>
              <li data-target="#demo" data-slide-to="1"></li>
              <li data-target="#demo" data-slide-to="2"></li>
          </ul>

          <!-- The slideshow -->
          <div class="carousel-inner">
              <div class="carousel-item active" data-bs-interval="3000">
                  <img src="img/banner8 (3).jpg" alt="">
              </div>
              <div class="carousel-item" data-bs-interval="3000">
                  <img src="img/banner1 (3).jpg" alt="">
              </div>
              <div class="carousel-item" data-bs-interval="3000">
                  <img src="img/banner6.jpg" alt="">
              </div>
          </div>

          <!-- Left and right controls -->
          <a class="carousel-control-prev" href="#demo" data-slide="prev">
              <span class="carousel-control-prev-icon"></span>
          </a>
          <a class="carousel-control-next" href="#demo" data-slide="next">
              <span class="carousel-control-next-icon"></span>
          </a>

      </div>
       <div class="container">
            <br>
            <br>
            <br>
            <h1 style="font-size: 40px;">About Us</h1>
            <hr style="background: black;">
                
                    <div class="card mt-3">
                        <div class="card-header text-white" style="background: #2874a6;">
                            <h4>Our Focus</h4>
                        </div>
                        
                        <div class="card-body">
                            <p style="font-size: 20px; font-weight: 200;">
                               Welcome to fresh grocery store, your number one source for all things. We're dedicated to giving you the best of our products, with
                               a focus on three characteristics, i.e dependability, customer service and uniqueness.
                               <br>
                               <br>
                               With our website, you can choose from a variety of items which will be delivered to your doorstep as per your convenience.
                               Feel free to shop with our website.
                               <br><br>
                               We offer you convenience of shopping everything that you need for your home - be it fresh fruits & vegetables, rice, dals, dairy and bakery item, beverages from a single virtual store.
                        </div>
                    </div>
                  <br>
                  <div class="card mt-3">
                      <div class="card-header">
                         <p style="font-size: 30px; font-weight: 200;"><strong><font color="blue">Mailto: freshgrocer@gmail.com</font></strong></p>
                         <p style="font-size: 30px; font-weight: 200;"><strong><font color="blue">Contact no: 0251-2765436</font></strong></p>
                      </div>
                  </div>
                </div> 
        <!--javascripts-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        
    </body>
</html>
