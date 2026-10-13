package com.wit.shorturl.dao;

import java.sql.*;

// Unit-I + ICA-1: Command line app with raw JDBC.
// Run this first to prove JDBC, then main app uses Hibernate (which uses JDBC inside).
// M1 runs this in viva: java JdbcDemo
public class JdbcDemo {
    public static void main(String[] args) throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection c = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/shortdb?serverTimezone=UTC", "root", "");
             Statement st = c.createStatement()) {
            // CREATE + READ with JDBC
            st.executeUpdate("INSERT IGNORE INTO users(name,pass) VALUES('demo','demo123')");
            ResultSet rs = st.executeQuery("SELECT id,name FROM users");
            while (rs.next()) {
                System.out.println(rs.getInt(1) + " " + rs.getString(2));
            }
            // CRUD with PreparedStatement (safe from SQL injection)
            try (PreparedStatement ps = c.prepareStatement("SELECT COUNT(*) FROM urls")) {
                ResultSet r2 = ps.executeQuery();
                r2.next();
                System.out.println("Total urls: " + r2.getInt(1));
            }
        }
    }
}
