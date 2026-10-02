package com.littlestar.controler;

import com.littlestar.model.User;
import com.littlestar.util.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet("/user/dashboard")
public class UserDashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        HttpSession s=req.getSession(false);
        User u=s==null?null:(User)s.getAttribute("user");
        if(u==null){resp.sendRedirect(req.getContextPath()+"/");return;}
        List<Map<String,Object>> orders=new ArrayList<>();
        try(Connection c=DBUtil.getConnection();
            PreparedStatement p=c.prepareStatement("SELECT order_id,total_amount,status,created_at FROM orders WHERE user_id=? ORDER BY created_at DESC")){
            p.setInt(1,u.getId());
            try(ResultSet r=p.executeQuery()){while(r.next()){
                Map<String,Object> m=new HashMap<>();m.put("id",r.getInt("order_id"));m.put("total",r.getBigDecimal("total_amount"));
                m.put("status",r.getString("status"));m.put("created",r.getTimestamp("created_at"));orders.add(m);
            }}
            req.setAttribute("orders",orders);req.getRequestDispatcher("/user/dashboard.jsp").forward(req,resp);
        }catch(SQLException e){throw new ServletException(e);}
    }
}
