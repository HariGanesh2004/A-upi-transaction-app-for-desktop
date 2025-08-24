package com.hpay;

import java.io.IOException;
import java.net.Authenticator.RequestorType;
import java.net.ResponseCache;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.hpay.util.Dbconnection;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/checkid")
public class IdcheckServlet extends HttpServlet {
	private static String GETUSER="Select* from transaction_history where ReferenceId=?";
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String tranid = req.getParameter("txnid");
		System.out.println(tranid);
		String transid="";
		String supi="";
		String rupi="";
		String amount="";
		String phno="";
		String timedate="";
		String status="";
		
		try 
		(Connection con=Dbconnection.Dbconnect();
		PreparedStatement stmt=con.prepareStatement(GETUSER)){
		stmt.setString(1,tranid);
		ResultSet res=stmt.executeQuery();
		while(res.next()) {
			transid=res.getString("ReferenceId");
			supi=res.getString("senderupi");
			rupi=res.getString("receiverupi");
			amount=res.getString("amount");
			phno=res.getString("phonenumber");
			timedate=res.getString("timedate");
			status=res.getString("Status");
			
		}
		

	
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		System.out.println(transid+supi+rupi+amount+phno+timedate+status);
		HttpSession session=req.getSession();
		session.setAttribute("transid",transid);
		session.setAttribute("senupi",supi);
		session.setAttribute("recupi",rupi);
		session.setAttribute("samount",amount);
		session.setAttribute("phno",phno);
		session.setAttribute("stimedate",timedate);
		session.setAttribute("status",status);
		RequestDispatcher rd = req.getRequestDispatcher("checkid.jsp");
        rd.forward(req, resp);
	}
	

}
