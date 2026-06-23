package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        String env = System.getenv("DB_ENV");
        String url, user, password;

        if ("CLOUD".equals(env)) {
            url = System.getenv("DB_URL");
            user = System.getenv("DB_USER");
            password = System.getenv("DB_PASS");
            
            // Semakan keselamatan: Jika salah satu null, beritahu ralat yang jelas
            if (url == null || user == null || password == null) {
                throw new SQLException("Environment variables tidak dijumpai. Sila semak setting Render!");
            }
        } else {
            url = "jdbc:mysql://localhost:3306/univents_db";
            user = "root";
            password = "admin";
        }

        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, user, password);
    }
}