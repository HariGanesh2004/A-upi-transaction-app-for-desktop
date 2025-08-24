package com.hpay.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Dbconnection {
		private static String URL="jdbc:mysql://localhost:3306/users";
		private static String USERNAME="root";
		private static String PASSWORD="9942";
		static Connection con=null;
		public static Connection Dbconnect() {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				con=DriverManager.getConnection(URL,USERNAME,PASSWORD);
				System.out.println("connected");
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return con;
		}
}


