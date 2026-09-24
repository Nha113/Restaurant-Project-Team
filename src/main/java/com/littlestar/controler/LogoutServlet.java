package com.littlestar.controler;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // យក Session បច្ចុប្បន្ន (ប្រសិនបើមាន)
        HttpSession session = request.getSession(false);
        if (session != null) {
            // លុប Session និងព័ត៌មាន Login/Cart ទាំងអស់ចោល
            session.invalidate();
        }
        
        // បង្វែរទិសដៅទៅកាន់ទំព័រដើម index.jsp វិញ
        response.sendRedirect(request.getContextPath() + "/");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // អនុញ្ញាតឱ្យ Logout តាមរយៈ POST request ដូចគ្នា
        doGet(request, response);
    }
}