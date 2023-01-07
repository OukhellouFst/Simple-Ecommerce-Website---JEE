package com.mycompany.phone_shoop.servlets;

import com.mycompany.phone_shoop.entities.User;
import com.mycompany.phone_shoop.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
          
            try {
                // get the parameters of http.1/post
                String userName = request.getParameter("name");
                String userEmail = request.getParameter("email");
                String userPassword = request.getParameter("password");
                String userPhone = request.getParameter("phone");
                String userAddress = request.getParameter("address");
                
                // validations 
                if(userName.isEmpty()){
                    out.println("Name is blank");
                    return;
                }
                // creating user object to store the data 
                User user =new User(userName, userEmail, userPassword, userPhone,"default.jpg", userAddress,"normal");
                
                // using hibernate and perform a transaction
                Session hibernateSession = FactoryProvider.getFactory().openSession();
                    Transaction tx= hibernateSession.beginTransaction();
                    int userId =(int) hibernateSession.save(user);
                    tx.commit();
                hibernateSession.close();
                
                // create a session with message for registered user
                HttpSession httpSession=request.getSession();
                httpSession.setAttribute("message", "Marhba :) You have successfuly registerd in our website !! Your id : "+userId);
                
                response.sendRedirect("register.jsp");
                
            } catch(Exception e) {
                e.printStackTrace();
            }
            
            
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
