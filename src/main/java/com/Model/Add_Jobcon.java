package com.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Add_Jobcon {
    private static final String URL = "jdbc:mysql://localhost:3306/ep1";
    private static final String USER = "root";
    private static final String PASSWORD = "Rjchaithu@1610";

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
