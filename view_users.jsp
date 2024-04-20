<%@page import="java.util.List"%>
<%@page import="com.grocery.shop.dao.UserDao"%>
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
   UserDao dao = new UserDao(ConnectionProvider.getConnection());
   List<User> list=dao.getAllUsers();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin panel- Users Page</title>
         <!--CSS-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">    
    </head>
    <body style="background: #f0f1f2;">
        <!--navbar-->
        <%@include file="navbar1.jsp" %>
        <br>
        
        <div class="container">
            <h5 style="text-align: center;"> <%@include file="message.jsp" %></h5>
        </div>
        
        <br>  
        <div class="container" style="text-align: center;">
             <a href="admin.jsp" class="fa fa-user-circle-o" style="font-size: 70px;"></a>
        </div>
        
        <br>
        <h1><center>List of Users</center></h1>
        
        <br><br>
        <div class="container">
        <table class="table table-bordered table-striped table-hover">
            <thead class="text-center text-white" style="background-color: #2874a6;">
                <tr>
                    <th>ID</th>  
                    <th>Name</th>  
                    <th>Email</th> 
                    <th>Password</th>
                    <th>Phone</th>
                    <th>Address</th>
                    <th>Registration Date</th>
                </tr>
            </thead> 
            <tbody class="text-center">
                <%
                   for(User user: list) { 
                %>
                <tr>
                  <td><%= user.getId()  %></td>
                  <td><%= user.getName() %></td>
                  <td><%= user.getEmail() %></td>
                  <td><%= user.getPassword() %></td>
                  <td><%= user.getPhone() %></td>
                  <td><%= user.getAddress() %></td>
                  <td><%= user.getDateTime() %></td>
                  <% 
                   }
                  %>
                </tr>
            </tbody>
        </table>
        <!--javascripts-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
