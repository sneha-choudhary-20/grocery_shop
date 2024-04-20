package com.grocery.shop.servlets;

import com.grocery.shop.dao.UserDao;
import com.grocery.shop.entities.User;
import com.grocery.shop.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //fetch username and password from request
            String userEmail=request.getParameter("email");
            String userPassword=request.getParameter("password");
            
            UserDao dao=new UserDao(ConnectionProvider.getConnection());
            User u=dao.getUserByEmailAndPassword(userEmail, userPassword);
            
            HttpSession httpSession = request.getSession();
            
            if(u==null)
            {
                // login error..
                httpSession.setAttribute("message","<h5><b> Invalid Details !! Try with another one </b></h5>");
                response.sendRedirect("login.jsp");
                return;     
            }
            else
            {
                //login success.....
                httpSession.setAttribute("current-user", u);
                if (u.getRole().equals("admin"))
                {
                    //admin:- admin.jsp
                    response.sendRedirect("admin.jsp");
                } 
                 else if(u.getRole().equals("normal"))
                {
                    //normal:- normal.jsp
                    httpSession.setAttribute("message","<h5>Welcome "+u.getName() + " !!</h5>");
                    response.sendRedirect("index.jsp");
                }
                else 
                {
                    out.println("We have not identified user type");
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
