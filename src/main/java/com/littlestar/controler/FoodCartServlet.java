package com.littlestar.controler;

import com.littlestar.model.CartItem;
import com.littlestar.util.DBUtil;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.*;

@WebServlet("/food-cart")
public class FoodCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req,HttpServletResponse resp)throws IOException{
        resp.setContentType("application/json;charset=UTF-8");
        String id=req.getParameter("id");
        try(Connection c=DBUtil.getConnection();PreparedStatement p=c.prepareStatement("SELECT name,price FROM foods WHERE id=? AND available=1")){
            p.setInt(1,Integer.parseInt(id));
            try(ResultSet r=p.executeQuery()){
                if(!r.next()){resp.setStatus(404);resp.getWriter().write("{\"success\":false}");return;}
                HttpSession s=req.getSession(true);
                @SuppressWarnings("unchecked") java.util.List<CartItem> cart=(java.util.List<CartItem>)s.getAttribute("cart");
                if(cart==null){cart=new java.util.ArrayList<>();s.setAttribute("cart",cart);}
                String name=r.getString("name");BigDecimal price=r.getBigDecimal("price");
                CartItem found=null;for(CartItem x:cart)if(x.getName().equals(name)){found=x;break;}
                if(found==null)cart.add(new CartItem(name,price,1));else found.setQuantity(found.getQuantity()+1);
                int count=0;for(CartItem x:cart)count+=x.getQuantity();
                resp.getWriter().write("{\"success\":true,\"count\":"+count+"}");
            }
        }catch(Exception e){resp.setStatus(500);resp.getWriter().write("{\"success\":false}");}
    }
}
