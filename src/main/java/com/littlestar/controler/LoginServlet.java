package com.littlestar.controler;

import com.littlestar.dao.UserDAO;
import com.littlestar.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // បើបើកតាម GET request ឱ្យបង្វែរទៅទំព័រដើម index.jsp
        response.sendRedirect(request.getContextPath() + "/");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // ពិនិត្យមើល Input
        if (email == null || password == null || email.trim().isEmpty() || password.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/?loginError=Please+enter+email+and+password");
            return;
        }

        try {
            User user = userDAO.login(email.trim(), password);

            if (user == null) {
                response.sendRedirect(request.getContextPath() + "/?loginError=Incorrect+email+or+password");
                return;
            }

            // រក្សាទុកព័ត៌មាន User ចូលទៅក្នុង Session
            HttpSession session = request.getSession(true);
            session.setAttribute("user", user);

            // Redirect ទៅទំព័រដើមដោយជោគជ័យ
            response.sendRedirect(request.getContextPath() + "/");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/?loginError=Database+or+Server+Error");
        }
    }
}