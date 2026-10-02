package com.littlestar.controler;

import com.littlestar.util.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet("/orders")
public class OrderServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        if(!isAdmin(req)){resp.sendRedirect(req.getContextPath()+"/admin/login");return;}
        List<Map<String,Object>> list=new ArrayList<>();
        try(Connection c=DBUtil.getConnection();
            PreparedStatement p=c.prepareStatement("SELECT * FROM orders ORDER BY created_at DESC");
            ResultSet r=p.executeQuery()){
            while(r.next()){
                Map<String,Object> m=new HashMap<>();
                m.put("id",r.getInt("order_id"));m.put("customer_name",r.getString("customer_name"));
                m.put("phone",r.getString("phone"));m.put("address",r.getString("address"));
                m.put("note",r.getString("note"));m.put("total_amount",r.getBigDecimal("total_amount"));
                m.put("status",r.getString("status"));m.put("created_at",r.getTimestamp("created_at"));
                list.add(m);
            }
            req.setAttribute("orderList",list);
            req.getRequestDispatcher("/orders.jsp").forward(req,resp);
        }catch(SQLException e){throw new ServletException(e);}
    }
    protected void doPost(HttpServletRequest req,HttpServletResponse resp)throws IOException{
        if(!isAdmin(req)){resp.setStatus(401);return;}
        String action=req.getParameter("action");
        try(Connection c=DBUtil.getConnection()){
            if("delete".equals(action)){
                try(PreparedStatement p=c.prepareStatement("DELETE FROM orders WHERE order_id=?")){p.setInt(1,Integer.parseInt(req.getParameter("id")));p.executeUpdate();}
            }else if("update".equals(action)){
                try(PreparedStatement p=c.prepareStatement("UPDATE orders SET status=? WHERE order_id=?")){
                    p.setString(1,req.getParameter("status"));p.setInt(2,Integer.parseInt(req.getParameter("id")));p.executeUpdate();
                }
            }
            resp.setStatus(200);
        }catch(Exception e){resp.setStatus(500);}
    }
    private boolean isAdmin(HttpServletRequest r){return r.getSession(false)!=null&&r.getSession(false).getAttribute("admin")!=null;}
}
