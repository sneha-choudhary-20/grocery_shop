package com.grocery.shop.servlets;
import com.grocery.shop.dao.ContactDao;
import com.grocery.shop.entities.Contact;
import com.grocery.shop.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class ContactServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
             //fetch all contact form data
              String name=request.getParameter("your_name");
              String email=request.getParameter("your_email");
              String message=request.getParameter("message");             
              //create contact object and set all data to that object
              Contact contact=new Contact(name,email,message);             
              // create contactdao object
              ContactDao dao=new ContactDao(ConnectionProvider.getConnection());
              if(dao.saveContact(contact)){
              //save....
               HttpSession httpSession = request.getSession();
               httpSession.setAttribute("message", "Thanks for contacting us  !!   we will be in touch with you very soon.");
               response.sendRedirect("contact.jsp");
               return;
               }
             else
              {
               out.println("Please Put Something");
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
