package com.hpay;

import java.io.IOException;

import com.hpay.daoimpl.TransactionImpl;
import com.hpay.models.Transaction;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/callingservlet")
public class LoginServlet extends HttpServlet {
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	String upi=req.getParameter("userupi");
	String phoneno=req.getParameter("phonenumber");
	System.out.println(phoneno);
	HttpSession session=req.getSession();
	session.setAttribute("supi", upi);
	session.setAttribute("phonenumber", phoneno);
	Transaction trans=new Transaction(upi,phoneno);
	TransactionImpl impl=new TransactionImpl();
	String comp=impl.Getuser(trans);
//	System.out.println(comp);
	if(upi.equalsIgnoreCase(comp)) {
		RequestDispatcher rd=req.getRequestDispatcher("transaction.jsp");
		rd.include(req, resp);
	}
}
}
