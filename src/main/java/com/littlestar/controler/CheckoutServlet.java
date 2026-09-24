package com.littlestar.controler;

import com.littlestar.model.CartItem;
import com.littlestar.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.List;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database Configurations
    private static final String DB_URL = "jdbc:mysql://localhost:3306/littlestar_db";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "1234"; // ត្រូវប្រាកដថាកំណត់ Password MySQL ត្រូវ

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");

        HttpSession session = request.getSession(false);
        User user = session == null ? null : (User) session.getAttribute("user");

        // 1. Check Login Status
        if (user == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED); // 401 Unauthorized
            response.getWriter().write("{\"success\": false, \"message\": \"Please login first\"}");
            return;
        }

        @SuppressWarnings("unchecked")
        List<CartItem> cart = session == null ? null : (List<CartItem>) session.getAttribute("cart");

        // 2. Check Cart Status
        if (cart == null || cart.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400 Bad Request
            response.getWriter().write("{\"success\": false, \"message\": \"Cart is empty\"}");
            return;
        }

        // 3. Read Customer Info from Form
        String fullName = request.getParameter("customer_name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String note = request.getParameter("note");

        // ប្រសិនបើ customer_name ទទេ យកឈ្មោះពី User session ជំនួស
        if (fullName == null || fullName.trim().isEmpty()) {
            fullName = user.getName(); // ឬ user.getUsername()
        }

        // 4. Calculate Total Amount
        BigDecimal total = BigDecimal.ZERO;
        for (CartItem item : cart) {
            if (item.getSubtotal() != null) {
                total = total.add(item.getSubtotal());
            } else if (item.getPrice() != null) {
                total = total.add(item.getPrice().multiply(new BigDecimal(item.getQuantity())));
            }
        }

        // 5. Save Order to Database
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
                
                // កូដ SQL ស្តង់ដារ (គ្មាន user_id ដើម្បីការពារ Error លើ Table order)
                String sql = "INSERT INTO orders (customer_name, phone, address, note, total_amount, status) VALUES (?, ?, ?, ?, ?, 'Pending')";
                
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, fullName);
                    stmt.setString(2, phone);
                    stmt.setString(3, address);
                    stmt.setString(4, note);
                    stmt.setBigDecimal(5, total);
                    stmt.executeUpdate();
                }
            }

            // 6. Clear Cart on Success
            cart.clear();
            session.setAttribute("cart", cart);

            response.setStatus(HttpServletResponse.SC_OK); // 200 OK
            response.getWriter().write("{\"success\": true, \"message\": \"Order placed successfully!\"}");

        } catch (Exception e) {
            e.printStackTrace(); // បង្ហាញ Error លម្អិតក្នុង Eclipse Console
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 500
            response.getWriter().write("{\"success\": false, \"message\": \"" + e.getMessage() + "\"}");
        }
    }
}