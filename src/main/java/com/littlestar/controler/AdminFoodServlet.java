package com.littlestar.controler;

import com.littlestar.model.Food;
import com.littlestar.util.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.*;
import java.util.*;

@WebServlet("/admin/foods")
public class AdminFoodServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (!isAdmin(req)) { resp.sendRedirect(req.getContextPath()+"/admin/login"); return; }
        String action=req.getParameter("action");
        try(Connection c=DBUtil.getConnection()){
            if("delete".equals(action)){
                int id=Integer.parseInt(req.getParameter("id"));
                try(PreparedStatement p=c.prepareStatement("DELETE FROM foods WHERE id=?")){p.setInt(1,id);p.executeUpdate();}
                resp.sendRedirect(req.getContextPath()+"/admin/foods?msg=Food+deleted"); return;
            }
            List<Food> foods=new ArrayList<>();
            try(PreparedStatement p=c.prepareStatement("SELECT * FROM foods ORDER BY id DESC");ResultSet r=p.executeQuery()){
                while(r.next()) foods.add(map(r));
            }
            req.setAttribute("foods",foods);
            req.getRequestDispatcher("/admin/foods.jsp").forward(req,resp);
        }catch(Exception e){throw new ServletException(e);}
    }

    protected void doPost(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        if(!isAdmin(req)){resp.sendRedirect(req.getContextPath()+"/admin/login");return;}
        req.setCharacterEncoding("UTF-8");
        String id=req.getParameter("id"), name=req.getParameter("name"), desc=req.getParameter("description");
        String price=req.getParameter("price"), image=req.getParameter("image_url"), cat=req.getParameter("category");
        boolean available="on".equals(req.getParameter("available")) || "true".equals(req.getParameter("available"));
        try(Connection c=DBUtil.getConnection()){
            if(id==null||id.isBlank()){
                try(PreparedStatement p=c.prepareStatement("INSERT INTO foods(name,description,price,image_url,category,available) VALUES(?,?,?,?,?,?)")){
                    p.setString(1,name);p.setString(2,desc);p.setBigDecimal(3,new BigDecimal(price));p.setString(4,image);p.setString(5,cat);p.setBoolean(6,available);p.executeUpdate();
                }
            }else{
                try(PreparedStatement p=c.prepareStatement("UPDATE foods SET name=?,description=?,price=?,image_url=?,category=?,available=? WHERE id=?")){
                    p.setString(1,name);p.setString(2,desc);p.setBigDecimal(3,new BigDecimal(price));p.setString(4,image);p.setString(5,cat);p.setBoolean(6,available);p.setInt(7,Integer.parseInt(id));p.executeUpdate();
                }
            }
            resp.sendRedirect(req.getContextPath()+"/admin/foods?msg=Saved+successfully");
        }catch(Exception e){throw new ServletException(e);}
    }
    private boolean isAdmin(HttpServletRequest r){return r.getSession(false)!=null&&r.getSession(false).getAttribute("admin")!=null;}
    private Food map(ResultSet r)throws SQLException{return new Food(r.getInt("id"),r.getString("name"),r.getString("description"),r.getBigDecimal("price"),r.getString("image_url"),r.getString("category"),r.getBoolean("available"));}
}
