package com.littlestar.dao;

import com.littlestar.model.User;
import com.littlestar.util.DBUtil;
import com.littlestar.util.PasswordUtil;
import java.sql.*;

public class UserDAO {
    public boolean emailExists(String email)throws SQLException{
        try(Connection c=DBUtil.getConnection();PreparedStatement p=c.prepareStatement("SELECT id FROM users WHERE email=?")){
            p.setString(1,email);try(ResultSet r=p.executeQuery()){return r.next();}
        }
    }
    public void register(String name,String email,String password)throws SQLException{
        String salt=PasswordUtil.generateSalt(),hash=PasswordUtil.hashPassword(password,salt);
        try(Connection c=DBUtil.getConnection();PreparedStatement p=c.prepareStatement("INSERT INTO users(name,email,password_hash,password_salt) VALUES(?,?,?,?)")){
            p.setString(1,name);p.setString(2,email);p.setString(3,hash);p.setString(4,salt);p.executeUpdate();
        }
    }
    public User login(String email,String password)throws SQLException{
        try(Connection c=DBUtil.getConnection();PreparedStatement p=c.prepareStatement("SELECT id,name,email,password_hash,password_salt FROM users WHERE email=?")){
            p.setString(1,email);try(ResultSet r=p.executeQuery()){if(!r.next())return null;
                if(!PasswordUtil.verifyPassword(password,r.getString("password_salt"),r.getString("password_hash")))return null;
                return new User(r.getInt("id"),r.getString("name"),r.getString("email"));
            }
        }
    }
}
