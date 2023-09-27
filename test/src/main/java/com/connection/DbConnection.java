package com.connection;

import java.sql.*;

public class DbConnection {

	public static Connection con;

	public static Connection getConn() {
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");

			con =DriverManager.getConnection("jdbc:mysql://localhost:3306/truecaller", "root", "####");

			return con;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
}
