package com.hpay;

import java.io.IOException;
import java.io.PrintWriter;

import org.apache.catalina.connector.Response;

import com.hpay.daoimpl.TransactionImpl;
import com.hpay.models.Transaction;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/transactionservlet")
public class TransactionServlet extends HttpServlet {
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String supi = req.getParameter("senderUpi");
		String rupi = req.getParameter("receiverUpi");
		int amount = Integer.parseInt(req.getParameter("amount"));
		String upipin=req.getParameter("upiPin");
		System.out.println(upipin);
		HttpSession session=req.getSession();
		session.setAttribute("amount", amount);
		session.setAttribute("rupi", rupi);
		String phonenumber=(String)session.getAttribute("phonenumber");
		Transaction trancs=new Transaction(upipin);
		TransactionImpl impll=new TransactionImpl();
		String phoneno=(impll.checkUpi(trancs));
		System.out.println(supi+" "+rupi+" "+amount+" "+upipin+" "+phoneno+" "+phonenumber);
		PrintWriter out=resp.getWriter();
		if(phoneno.equals(phonenumber)) {
			resp.sendRedirect("Transaction-sucess.jsp");
			out.println("register Sucessfull");
			Transaction trans=new Transaction(supi,rupi,amount);
			TransactionImpl impl=new TransactionImpl();
			impl.update(trans);
			Transaction tran_his=new Transaction(supi,rupi,amount,phonenumber,"Success");
			TransactionImpl imple=new TransactionImpl();
			String id=imple.Transaction_History(tran_his);
			session.setAttribute("rid", id);
			
		}
		
		else {
			out.println("upi pin you entered is incorrect");
			resp.sendRedirect("transaction_fail.jsp");
			Transaction tran_his=new Transaction(supi,rupi,amount,phonenumber,"Failed");
			TransactionImpl imple=new TransactionImpl();
			String rid=imple.Transaction_History(tran_his);
			session.setAttribute("rid", rid);
		}
		
		
}
}
