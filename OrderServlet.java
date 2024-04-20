package com.grocery.shop.servlets;
import com.grocery.shop.dao.CartDao;
import com.grocery.shop.dao.OrderDao;
import com.grocery.shop.entities.Cart;
import com.grocery.shop.entities.Order;
import com.grocery.shop.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class OrderServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {           
            int id=Integer.parseInt(request.getParameter("id"));
            String name=request.getParameter("user_name");
            String email=request.getParameter("user_email");
            String phone=request.getParameter("user_phone");
            String address=request.getParameter("user_address");
            String pincode=request.getParameter("pincode");
            String city=request.getParameter("city");
            String state=request.getParameter("state");
            String payment=request.getParameter("paymentType");           
            String fulladdress=address+","+pincode+","+city+","+state;    
           CartDao dao=new CartDao(ConnectionProvider.getConnection());
           List<Cart> olist=dao.getProductByUser(id);           
           if(olist.isEmpty())
           {
              HttpSession httpSession = request.getSession();
              httpSession.setAttribute("message", "Add Item");
              response.sendRedirect("checkout.jsp");
              return;
           }else {              
           OrderDao dao2=new OrderDao(ConnectionProvider.getConnection());
           Order o=null;          
           ArrayList<Order> orderList=new ArrayList<Order>();
           Random r=new Random();
           for(Cart c:olist)
           {
              o = new Order();
              o.setOrder_id("PRODUCT-ORD-00"+ r.nextInt(200));
              o.setName(name);
              o.setEmail(email);
              o.setPhone(phone);
              o.setFulladdress(fulladdress);
              o.setItem_name(c.getPname());
              o.setPrice(c.getPrice());
              o.setPayment(payment);
              orderList.add(o);
           }
           if("noselect".equals(payment)) {
              HttpSession httpSession = request.getSession();
              httpSession.setAttribute("message", "Choose Payment Method");
              response.sendRedirect("checkout.jsp");
              return;  
           }
           else if("Card".equals(payment)){
               boolean f = dao2.saveOrder(orderList);
               if (f) {
                   HttpSession httpSession = request.getSession();
                   httpSession.setAttribute("message", "Please fill the Payment details");
                   response.sendRedirect("payment.jsp");
                   return;
                } else {
                   out.println("Order Failed");
                  }
            } 
           else {             
            boolean f=dao2.saveOrder(orderList);
            if(f)
            {
                response.sendRedirect("order_success.jsp");
            }else
            {
                out.println("Order Failed");
            }    
          }     
        }    
       }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
