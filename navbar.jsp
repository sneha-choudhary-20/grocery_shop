<%@page import="com.grocery.shop.entities.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.grocery.shop.dao.CartDao"%>
<%@page import="com.grocery.shop.helper.ConnectionProvider"%>
<%@page import="com.grocery.shop.entities.User"%>
<%
    User u1=(User)session.getAttribute("current-user"); 

%>

<%
  CartDao dao2=new CartDao(ConnectionProvider.getConnection());
  ArrayList<Cart> list2=dao2.getAllCart();    
%>

<nav class="navbar navbar-expand-lg navbar-dark nav">
    <a class="navbar-brand" href="index.jsp"> <span class="fa fa-asterisk fa-lg"> </span>&nbsp;Fresh Grocer </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="about.jsp">AboutUs</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="feedback.jsp">Feedback</a>
      </li>
      <li class="nav-item active">
          <a class="nav-link" href="contact.jsp">Contact us</a>
      </li>  
      </ul>
    <ul class="navbar-nav ml-auto">
         
        <%
                  if(u1==null) {
                      
        %>
           
            <li class="nav-item active">
              <a class="nav-link" href="checkout.jsp"><i class="fa fa-cart-plus" style="font-size: 20px;"></i>&nbsp;<span class="ml-0" style="font-size: 15px;">( 0 ) </span></a>
            </li>  
            <li class="nav-item active">
                <a class="nav-link" href="login.jsp">Login</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="register.jsp">Registration</a>
            </li>
            
            <%                } else {

            %>
            
            <li class="nav-item active">
              <a class="nav-link" href="checkout.jsp"><i class="fa fa-cart-plus" style="font-size: 20px;"></i>&nbsp;<span class="ml-0" style="font-size: 15px;"> ( <%= list2.size() %> )</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="<%= u1.getRole().equals("admin")?"admin.jsp":"index.jsp" %>"><%= u1.getName() %></a>
            </li>
            <li class="nav-item active">
               <a class="nav-link" href="LogoutServlet">Logout</a>
            </li>  
            
            <%   }
        
            %>
        
    </ul>
  </div>
</nav>
