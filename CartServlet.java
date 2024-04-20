package com.grocery.shop.servlets;
import com.grocery.shop.dao.CartDao;
import com.grocery.shop.dao.ProductDao;
import com.grocery.shop.entities.Cart;
import com.grocery.shop.entities.Product;
import com.grocery.shop.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class CartServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int pid=Integer.parseInt(request.getParameter("pid"));
            int uid=Integer.parseInt(request.getParameter("uid"));            
            ProductDao dao=new ProductDao(ConnectionProvider.getConnection());
            Product p=dao.getProductById(pid);          
            Cart c=new Cart();
            c.setPid(pid);
            c.setUid(uid);
            c.setPname(p.getpName());
            c.setPrice(p.getPriceAfterApplyingDiscount());
            c.setTotal_price(p.getPriceAfterApplyingDiscount());          
            CartDao cdao=new CartDao(ConnectionProvider.getConnection());            
            if(cdao.addCart(c))
            {
                //save....
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", " Product Added to Cart Successfully  !!");
                response.sendRedirect("index.jsp");
                return;
            }else
            {
                out.println("Product not added to cart");
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
