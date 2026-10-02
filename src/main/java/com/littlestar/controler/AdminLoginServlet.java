package com.littlestar.controler;

import com.littlestar.util.DBUtil;
import com.littlestar.util.PasswordUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;

@WebServlet("/admin/login")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession(false) != null && req.getSession(false).getAttribute("admin") != null) {
            resp.sendRedirect(req.getContextPath() + "/admin/dashboard");
        } else {
            req.getRequestDispatcher("/admin/login.jsp").forward(req, resp);
        }
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        req.setCharacterEncoding("UTF-8");
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(
                 "SELECT id, username, password_hash, password_salt FROM admins WHERE username=? AND active=1")) {
            ps.setString(1, username == null ? "" : username.trim());
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next() && PasswordUtil.verifyPassword(password == null ? "" : password,
                        rs.getString("password_salt"), rs.getString("password_hash"))) {
                    HttpSession old = req.getSession(false);
                    if (old != null) old.invalidate();
                    HttpSession session = req.getSession(true);
                    session.setAttribute("admin", rs.getString("username"));
                    session.setAttribute("adminId", rs.getInt("id"));
                    session.setMaxInactiveInterval(30 * 60);
                    resp.sendRedirect(req.getContextPath() + "/admin/dashboard");
                    return;
                }
            }
            resp.sendRedirect(req.getContextPath() + "/admin/login?error=Invalid+username+or+password");
        } catch (SQLException e) {
            throw new IOException("Admin login database error.", e);
        }
    }
}
