package com.hpay.models;

import java.sql.Timestamp;

public class Transaction {
	private String username;
	private String supi;
	private String rupi;
	private String email;
	private String bank;
	private String phonenumber;
	private int amount;
	private String upipin;
	private Timestamp transaction_time;
	private String Status;
	
	
	
	public Transaction(String username, String supi, String email, String bank, String phonenumber,
			int amount, String upipin, Timestamp transaction_time, String status) {
		super();
		this.username = username;
		this.supi = supi;
		this.email = email;
		this.bank = bank;
		this.phonenumber = phonenumber;
		this.amount = amount;
		this.upipin = upipin;
		this.transaction_time = transaction_time;
		Status = status;
	}


	public Transaction(String upipin) {
		super();
		this.upipin = upipin;
	}


	public Transaction(String supi, String phonenumber) {
		super();
		this.supi = supi;
		this.phonenumber = phonenumber;
	}


	public Transaction(String supi, String rupi, int amount) {
		super();
		this.supi = supi;
		this.rupi = rupi;
		this.amount = amount;
	}


	public Transaction(String username, String supi, String phonenumber, String upipin) {
		super();
		this.username = username;
		this.supi = supi;
		this.phonenumber = phonenumber;
		this.upipin = upipin;
	}


	public Transaction(String username, String supi, String rupi, String phonenumber, int amount, String upipin) {
		super();
		this.username = username;
		this.supi = supi;
		this.rupi = rupi;
		this.phonenumber = phonenumber;
		this.amount = amount;
		this.upipin = upipin;
	}


	

	public Transaction(String username, String supi, String email, String bank, String phonenumber, String upipin) {
		super();
		this.username = username;
		this.supi = supi;
		this.email = email;
		this.bank = bank;
		this.phonenumber = phonenumber;
		this.upipin = upipin;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getSupi() {
		return supi;
	}


	public void setSupi(String supi) {
		this.supi = supi;
	}


	public String getRupi() {
		return rupi;
	}


	public void setRupi(String rupi) {
		this.rupi = rupi;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getBank() {
		return bank;
	}


	public void setBank(String bank) {
		this.bank = bank;
	}


	public String getPhonenumber() {
		return phonenumber;
	}


	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}


	public int getAmount() {
		return amount;
	}


	public void setAmount(int amount) {
		this.amount = amount;
	}


	public String getUpipin() {
		return upipin;
	}


	public void setUpipin(String upipin) {
		this.upipin = upipin;
	}


	public Timestamp getTransaction_time() {
		return transaction_time;
	}


	public void setTransaction_time(Timestamp transaction_time) {
		this.transaction_time = transaction_time;
	}


	public String getStatus() {
		return Status;
	}


	public void setStatus(String status) {
		Status = status;
	}


	public Transaction(String supi, String rupi,  int amount,String phonenumber, String status) {
		super();
		this.supi = supi;
		this.rupi = rupi;
		this.phonenumber = phonenumber;
		this.amount = amount;
		this.Status = status;
	}


	

	


	
	
	
	
	
	

}
