package com.littlestar.controler;
import com.littlestar.util.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet("/admin/users")
public class AdminUsersServlet extends HttpServlet {
 protected void doGet(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
  if(req.getSession(false)==null||req.getSession(false).getAttribute("admin")==null){resp.sendRedirect(req.getContextPath()+"/admin/login");return;}
  List<Map<String,Object>> users=new ArrayList<>();
  try(Connection c=DBUtil.getConnection();PreparedStatement p=c.prepareStatement("SELECT id,name,email,created_at FROM users ORDER BY created_at DESC");ResultSet r=p.executeQuery()){
   while(r.next()){Map<String,Object>m=new HashMap<>();m.put("id",r.getInt(1));m.put("name",r.getString(2));m.put("email",r.getString(3));m.put("created",r.getTimestamp(4));users.add(m);}
   req.setAttribute("users",users);req.getRequestDispatcher("/admin/users.jsp").forward(req,resp);
  }catch(SQLException e){throw new ServletException(e);}
 }
}
