package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        String env = System.getenv("DB_ENV");
        String url, user, password;

        if ("CLOUD".equals(env)) {
            // Mengambil nilai daripada Environment Variables (Render)
            url = System.getenv("DB_URL");
            user = System.getenv("DB_USER");
            password = System.getenv("DB_PASS");
        } else {
            // Local fallback (kekalkan untuk kegunaan laptop anda)
            url = "jdbc:mysql://localhost:3306/univents_db";
            user = "root";
            password = "admin";
        }

        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, user, password);
    }
}
