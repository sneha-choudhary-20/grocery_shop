package com.grocery.shop.servlets;
import com.grocery.shop.dao.ProductDao;
import com.grocery.shop.entities.Product;
import com.grocery.shop.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class EditProductServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int pId=Integer.parseInt(request.getParameter("pId"));
            String pName = request.getParameter("pName");
            String pDesc = request.getParameter("pDesc");
            int pPrice = Integer.parseInt(request.getParameter("pPrice"));
            int pdiscount = Integer.parseInt(request.getParameter("pdiscount"));
            int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));          
            //create product object and set all data to that object
            Product p=new Product();
            p.setpId(pId);
            p.setpName(pName);
            p.setpDesc(pDesc);
            p.setpPrice(pPrice);
            p.setPdiscount(pdiscount);
            p.setpQuantity(pQuantity);          
            //create productdao object
            ProductDao dao=new ProductDao(ConnectionProvider.getConnection());           
            if(dao.updateProduct(p))
            {
               //save....
               HttpSession httpSession = request.getSession();
               httpSession.setAttribute("message", " Product Updated Successfully...");
               response.sendRedirect("view_products.jsp");
               return;
            }
            else
            {
                out.println("error"); 
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
