package com.littlestar.controler;

import com.littlestar.model.CartItem;
import com.littlestar.model.User;
import com.littlestar.util.DBUtil;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.*;
import java.util.List;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json;charset=UTF-8");
        HttpSession session = request.getSession(false);
        User user = session == null ? null : (User) session.getAttribute("user");
        if (user == null) {
            response.setStatus(401);
            response.getWriter().write("{\"success\":false,\"message\":\"Please login first\"}");
            return;
        }
        @SuppressWarnings("unchecked")
        List<CartItem> cart = session == null ? null : (List<CartItem>) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
            response.setStatus(400);
            response.getWriter().write("{\"success\":false,\"message\":\"Cart is empty\"}");
            return;
        }

        String name = trim(request.getParameter("customer_name")); 
        if (name.isEmpty()) name = user.getName();
        
        String phone = trim(request.getParameter("phone"));
        String address = trim(request.getParameter("address"));
        String note = trim(request.getParameter("note"));
        
        if (phone.isEmpty() || address.isEmpty()) {
            response.setStatus(400);
            response.getWriter().write("{\"success\":false,\"message\":\"Phone and address are required\"}");
            return;
        }

        BigDecimal total = BigDecimal.ZERO;
        for (CartItem item : cart) {
            total = total.add(item.getSubtotal());
        }

        try (Connection c = DBUtil.getConnection()) {
            c.setAutoCommit(false);
            try {
                int orderId;
                // Insert into orders table
                try (PreparedStatement p = c.prepareStatement(
                    "INSERT INTO orders(user_id, customer_name, phone, address, note, total_amount, status) VALUES(?,?,?,?,?,?,'Pending')",
                    Statement.RETURN_GENERATED_KEYS)) {
                    
                    p.setInt(1, user.getId());
                    p.setString(2, name);
                    p.setString(3, phone);
                    p.setString(4, address);
                    p.setString(5, note);
                    p.setBigDecimal(6, total);
                    p.executeUpdate();
                    
                    try (ResultSet r = p.getGeneratedKeys()) {
                        if (!r.next()) throw new SQLException("Could not create order");
                        orderId = r.getInt(1);
                    }
                }

                // Insert into order_items table
                try (PreparedStatement p = c.prepareStatement(
                    "INSERT INTO order_items(order_id, food_name, price, quantity, subtotal) VALUES(?,?,?,?,?)")) {
                    for (CartItem item : cart) {
                        p.setInt(1, orderId);
                        p.setString(2, item.getName());
                        p.setBigDecimal(3, item.getPrice());
                        p.setInt(4, item.getQuantity());
                        p.setBigDecimal(5, item.getSubtotal());
                        p.addBatch();
                    }
                    p.executeBatch();
                }

                c.commit();
                cart.clear();
                response.getWriter().write("{\"success\":true,\"message\":\"Order placed successfully!\",\"orderId\":" + orderId + "}");
            } catch (Exception e) {
                c.rollback();
                throw e;
            }
        } catch (Exception e) {
            e.printStackTrace(); // បោះពុម្ព Error ពេញលេញចូលក្នុង Eclipse Console
            response.setStatus(500);
            String errorMsg = e.getMessage() != null ? e.getMessage() : e.toString();
            response.getWriter().write("{\"success\":false,\"message\":\"ERROR: " + escape(errorMsg) + "\"}");
        }
    }

    private String trim(String s) { 
        return s == null ? "" : s.trim(); 
    }
    
    private String escape(String s) { 
        return s == null ? "Server error" : s.replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", " "); 
    }
}