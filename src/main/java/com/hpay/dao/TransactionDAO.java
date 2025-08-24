package com.hpay.dao;

import com.hpay.models.Transaction;


public interface TransactionDAO {
	void update(Transaction tran);
	String Getuser(Transaction tran);
	void addUser(Transaction tran);
	String checkUpi(Transaction tran);
	String Transaction_History(Transaction tran);
	
}
