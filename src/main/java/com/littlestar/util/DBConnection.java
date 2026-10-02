package com.littlestar.util;

import java.sql.Connection;
import java.sql.SQLException;

public class DBConnection {
    public static Connection getConnection() throws SQLException {
        return DBUtil.getConnection();
    }
}
