package com.hpay;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.hpay.util.Dbconnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/userdetails")
public class UserDetails extends HttpServlet  {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String GETUSER="select*from transaction_db";
		String upi="";
		String name="";
		String bank="";
		String balance="";
		String email="";
		try 
			(Connection con=Dbconnection.Dbconnect();
			PreparedStatement stmt=con.prepareStatement(GETUSER)){
			System.out.println("connected user servlet");
			ResultSet res=stmt.executeQuery();
			while(res.next()) {
				upi=res.getString("upiid");
				name=res.getString("name");
				bank=res.getString("bank");
				balance=res.getString("salary");
				email=res.getString("emailid");
			}
			System.out.println(upi);
			

		
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		HttpSession session=req.getSession();
		session.setAttribute("name", name);
		session.setAttribute("bank", bank);
		session.setAttribute("balance", balance);
		session.setAttribute("email", email);
	}

}
