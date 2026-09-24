package com.staresaurant.servlet;

import com.littlestar.util.DBUtil;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/orders")
public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public OrderServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<OrderData> orderList = new ArrayList<>();

        try (Connection conn = DBUtil.getConnection()) {
            String sql = "SELECT * FROM orders ORDER BY created_at DESC";
            try (PreparedStatement stmt = conn.prepareStatement(sql);
                 ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    OrderData order = new OrderData();
                    order.setId(rs.getInt("order_id"));
                    order.setCustomer_name(rs.getString("customer_name"));
                    order.setPhone(rs.getString("phone"));
                    order.setAddress(rs.getString("address"));
                    order.setNote(rs.getString("note"));
                    order.setTotal_amount(rs.getBigDecimal("total_amount"));
                    order.setStatus(rs.getString("status"));
                    order.setCreated_at(rs.getTimestamp("created_at"));

                    orderList.add(order);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("orders", orderList);
        request.getRequestDispatcher("/orders.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        String idStr = request.getParameter("id");

        if (action != null && idStr != null && !idStr.trim().isEmpty()) {
            try {
                int orderId = Integer.parseInt(idStr.trim());

                try (Connection conn = DBUtil.getConnection()) {
                    if ("delete".equalsIgnoreCase(action)) {
                        try (PreparedStatement stmtItem = conn.prepareStatement("DELETE FROM order_items WHERE order_id = ?")) {
                            stmtItem.setInt(1, orderId);
                            stmtItem.executeUpdate();
                        } catch (Exception ignored) {}

                        String sql = "DELETE FROM orders WHERE order_id = ?";
                        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                            stmt.setInt(1, orderId);
                            stmt.executeUpdate();
                        }
                    } else if ("update".equalsIgnoreCase(action)) {
                        String newStatus = request.getParameter("status");
                        String sql = "UPDATE orders SET status = ? WHERE order_id = ?";
                        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                            stmt.setString(1, newStatus);
                            stmt.setInt(2, orderId);
                            stmt.executeUpdate();
                        }
                    }

                    response.setStatus(HttpServletResponse.SC_OK);
                    response.getWriter().write("Success");
                    return;
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("Error: " + e.getMessage());
                return;
            }
        }

        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        response.getWriter().write("Invalid parameters");
    }

    public static class OrderData {
        private int id;
        private String customer_name;
        private String phone;
        private String address;
        private String note;
        private BigDecimal total_amount;
        private String status;
        private Timestamp created_at;

        public int getId() { return id; }
        public void setId(int id) { this.id = id; }

        public String getCustomer_name() { return customer_name; }
        public void setCustomer_name(String customer_name) { this.customer_name = customer_name; }

        public String getPhone() { return phone; }
        public void setPhone(String phone) { this.phone = phone; }

        public String getAddress() { return address; }
        public void setAddress(String address) { this.address = address; }

        public String getNote() { return note; }
        public void setNote(String note) { this.note = note; }

        public BigDecimal getTotal_amount() { return total_amount; }
        public void setTotal_amount(BigDecimal total_amount) { this.total_amount = total_amount; }

        public String getStatus() { return status; }
        public void setStatus(String status) { this.status = status; }

        public Timestamp getCreated_at() { return created_at; }
        public void setCreated_at(Timestamp created_at) { this.created_at = created_at; }
    }
}