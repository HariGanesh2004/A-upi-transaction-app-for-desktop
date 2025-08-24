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


@WebServlet("/registerservlet")
public class RegisterServlet extends HttpServlet {
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	String Username=req.getParameter("username");
	String upiid=req.getParameter("upiid");
	String phoneno=req.getParameter("phonenumber");
	String upipin=req.getParameter("newpin");
	String email=req.getParameter("email");
	String bank=req.getParameter("bank");
	System.out.println(Username+" "+upiid+" "+phoneno+" "+upipin+" "+bank+" "+email);
	Transaction trans=new Transaction(Username,upiid,email,bank,phoneno,upipin);
	TransactionImpl impl=new TransactionImpl();
	impl.addUser(trans);
	RequestDispatcher rd=req.getRequestDispatcher("registersuccess.html");
	rd.forward(req, resp);
}
}
