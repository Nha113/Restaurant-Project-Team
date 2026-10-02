package com.littlestar.controler;

import com.littlestar.util.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (!isAdmin(req)) { resp.sendRedirect(req.getContextPath()+"/admin/login"); return; }
        try (Connection c = DBUtil.getConnection()) {
            req.setAttribute("users", count(c, "SELECT COUNT(*) FROM users"));
            req.setAttribute("foods", count(c, "SELECT COUNT(*) FROM foods"));
            req.setAttribute("orders", count(c, "SELECT COUNT(*) FROM orders"));
            req.setAttribute("sales", money(c, "SELECT COALESCE(SUM(total_amount),0) FROM orders WHERE status <> 'Cancelled'"));
            req.setAttribute("pending", count(c, "SELECT COUNT(*) FROM orders WHERE status='Pending'"));
            req.getRequestDispatcher("/admin/dashboard.jsp").forward(req, resp);
        } catch (SQLException e) { throw new ServletException(e); }
    }
    private boolean isAdmin(HttpServletRequest r){ return r.getSession(false)!=null && r.getSession(false).getAttribute("admin")!=null; }
    private long count(Connection c,String q)throws SQLException{try(PreparedStatement p=c.prepareStatement(q);ResultSet r=p.executeQuery()){r.next();return r.getLong(1);}}
    private java.math.BigDecimal money(Connection c,String q)throws SQLException{try(PreparedStatement p=c.prepareStatement(q);ResultSet r=p.executeQuery()){r.next();return r.getBigDecimal(1);}}
}
