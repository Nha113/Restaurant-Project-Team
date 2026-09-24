package com.littlestar.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {

    // ប្រើឈ្មោះ Database "littlestardb" និង Password "1234" តាមដែលយើងបានពិនិត្យឃើញ
    private static final String URL = "jdbc:mysql://localhost:3306/littlestar_db?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = "1234";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL JDBC Driver Not Found! Make sure mysql-connector-j.jar is in WEB-INF/lib");
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}