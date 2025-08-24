package com.hpay.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.UUID;

import com.hpay.util.Dbconnection;
import com.hpay.dao.TransactionDAO;
import com.hpay.models.Transaction;

public class TransactionImpl implements TransactionDAO{
//	private static Connection con=Dbconnection.Dbconnect();
	private static String UPDATE="update transaction_db set salary=salary+? where upiid=?";
	private static String GETUSER="Select *from transaction_db where phonenumber=?";
	private static String ADDUSER="insert into transaction_db(name,upiid,phonenumber,upipin,datecreated,emailid,bank)values(?,?,?,?,?,?,?)";
	private static String CHECKUPI="SELECT phonenumber FROM users.transaction_db where upipin=?";
	private static String TRANSACTION_HISTORY="insert into transaction_history(senderupi,receiverupi,amount,phonenumber,timedate"
			+ ",Status,ReferenceId)values(?,?,?,?,?,?,?)";
	

	@Override
	public void addUser(Transaction tran) {
		try (Connection con=Dbconnection.Dbconnect();
			PreparedStatement stmt=con.prepareStatement(ADDUSER);){
			String username=tran.getUsername();
			stmt.setString(1, username);
			String upiid=tran.getSupi();
			stmt.setString(2, upiid);
			String phonenumber=tran.getPhonenumber();
			stmt.setString(3, phonenumber);
			String upipin=tran.getUpipin();
			stmt.setString(4, upipin);
			stmt.setTimestamp(5,new Timestamp(System.currentTimeMillis()));
			String email=tran.getEmail();
			stmt.setString(6, email);
			String bank=tran.getBank();
			stmt.setString(7, bank);
			int res=stmt.executeUpdate();
			System.out.println(res);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	@Override
	public void update(Transaction tran) {
		try(Connection con=Dbconnection.Dbconnect()) {
			
			int salamount=tran.getAmount();
			String senupi= tran.getSupi() ;
			String recupi=tran.getRupi();
			int x=Updatebalance(con, senupi,-salamount);
			int y=Updatebalance(con, recupi,+salamount);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	private static int Updatebalance(Connection con,String tran, int salamount) throws SQLException {
			try(PreparedStatement stmt=con.prepareStatement(UPDATE)){
			stmt.setInt(1, salamount);
			stmt.setString(2, tran);
			int res=stmt.executeUpdate();
			return res;
		
	}
	}

	@Override
	public String Getuser(Transaction tran) {
		String upi="";
		try 
			(Connection con=Dbconnection.Dbconnect();
			PreparedStatement stmt=con.prepareStatement(GETUSER)){
			String phone=tran.getPhonenumber();
			stmt.setString(1,phone);
			ResultSet res=stmt.executeQuery();
			while(res.next()) {
				upi=res.getString("upiid");
			}
			System.out.println(upi);
			return upi;

		
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}


	@Override
	public String checkUpi(Transaction tran) {
		String Phoneno="";
		try {
			Connection con=Dbconnection.Dbconnect();
			PreparedStatement ptmt=con.prepareStatement(CHECKUPI);
			String upipin=tran.getUpipin();
			ptmt.setString(1, upipin);
			ResultSet res=ptmt.executeQuery();
			while(res.next()) {
				 Phoneno=res.getString("phonenumber");
			}
			System.out.println(Phoneno);
			return Phoneno;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}


	@Override
	public String Transaction_History(Transaction tran) {
		String ReferenceId = UUID.randomUUID().toString().replace("-", "").substring(0, 16);
		try {
			Connection con=Dbconnection.Dbconnect();
			PreparedStatement stmt=con.prepareStatement(TRANSACTION_HISTORY);
			String senderupi=tran.getSupi();
			stmt.setString(1, senderupi);
			String receiverupi=tran.getRupi();
			stmt.setString(2,receiverupi);
			int amount=tran.getAmount();
			stmt.setInt(3,amount);
			String phonenumber=tran.getPhonenumber();
			stmt.setString(4,phonenumber);
			stmt.setTimestamp(5,new Timestamp(System.currentTimeMillis()));
			String Status=tran.getStatus();
			stmt.setString(6, Status);
			stmt.setString(7, ReferenceId);
			int res=stmt.executeUpdate();
			System.out.println(res);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ReferenceId;
	}

	

	
}
