package com.littlestar.dao;

import com.littlestar.model.User;
import com.littlestar.util.DBUtil;
import com.littlestar.util.PasswordUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

    public boolean emailExists(String email) throws SQLException {
        String sql = "SELECT id FROM users WHERE email = ?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        }
    }

    public void register(String name, String email, String password) throws SQLException {
        String salt = PasswordUtil.generateSalt();
        String hash = PasswordUtil.hashPassword(password, salt);

        String sql = "INSERT INTO users(name, email, password_hash, password_salt) VALUES(?,?,?,?)";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, hash);
            ps.setString(4, salt);
            ps.executeUpdate();
        }
    }

    public User login(String email, String password) throws SQLException {
        String sql = "SELECT id, name, email, password_hash, password_salt FROM users WHERE email = ?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, email);

            try (ResultSet rs = ps.executeQuery()) {
                if (!rs.next()) {
                    return null;
                }

                String storedHash = rs.getString("password_hash");
                String storedSalt = rs.getString("password_salt");

                if (!PasswordUtil.verifyPassword(password, storedSalt, storedHash)) {
                    return null;
                }

                return new User(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("email")
                );
            }
        }
    }
}