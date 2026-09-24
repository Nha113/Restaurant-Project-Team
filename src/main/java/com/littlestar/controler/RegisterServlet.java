package com.littlestar.controler;

import com.littlestar.dao.UserDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (name == null || email == null || password == null ||
                name.isBlank() || email.isBlank() || password.isBlank()) {
            response.sendRedirect(request.getContextPath() + "/?registerError=Please+fill+all+fields");
            return;
        }

        if (password.length() < 6) {
            response.sendRedirect(request.getContextPath() + "/?registerError=Password+must+be+at+least+6+characters");
            return;
        }

        try {
            String cleanEmail = email.trim().toLowerCase();

            if (userDAO.emailExists(cleanEmail)) {
                response.sendRedirect(request.getContextPath() + "/?registerError=Email+already+exists");
                return;
            }

            userDAO.register(name.trim(), cleanEmail, password);
            response.sendRedirect(request.getContextPath() + "/?registerSuccess=Account+created+successfully");
        } catch (Exception e) {
            throw new ServletException("Unable to register user.", e);
        }
    }
}