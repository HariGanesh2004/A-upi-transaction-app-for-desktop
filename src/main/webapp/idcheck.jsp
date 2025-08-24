<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>HPay - Check Transaction</title>
  <style>
    body {
      margin: 0;
      font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(135deg, #43e97b, #38f9d7);
      display: flex;
      align-items: center;
      justify-content: center;
      min-height: 100vh;
    }
    .container {
      background: #fff;
      padding: 25px;
      border-radius: 15px;
      text-align: center;
      width: 420px;
      box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
      animation: fadeIn 0.6s ease-in-out;
    }
    .logo img {
      width: 60px;
      margin-bottom: 10px;
    }
    h2 {
      margin-bottom: 8px;
      color: #222;
    }
    p {
      color: #555;
      font-size: 0.9rem;
      margin-bottom: 18px;
    }
    .form-group {
      margin-bottom: 15px;
      text-align: left;
    }
    .form-group label {
      display: block;
      font-weight: 500;
      margin-bottom: 6px;
      color: #222;
    }
    .form-group input {
      width: 100%;
      padding: 10px;
      border: 1px solid #ddd;
      border-radius: 8px;
      background: #f6f8fa;
      font-size: 0.95rem;
      transition: border 0.3s, box-shadow 0.3s;
    }
    .form-group input:focus {
      border-color: #43e97b;
      box-shadow: 0 0 0 2px #43e97b33;
      outline: none;
    }
    .btn {
      width: 100%;
      background: linear-gradient(90deg, #43e97b, #38f9d7);
      color: #fff;
      padding: 12px;
      border-radius: 8px;
      border: none;
      font-weight: 600;
      cursor: pointer;
      transition: 0.3s;
      margin-bottom: 15px;
    }
    .btn:hover {
      background: linear-gradient(90deg, #38f9d7, #43e97b);
      transform: scale(1.03);
    }
    .transaction-details {
      text-align: left;
      background: #f9f9f9;
      padding: 15px;
      border-radius: 10px;
      display: none;
      border: 1px solid #ddd;
    }
    .transaction-details h3 {
      margin-bottom: 10px;
      font-size: 1rem;
      color: #222;
    }
    .transaction-details p {
      margin: 6px 0;
      font-size: 0.9rem;
      color: #333;
    }
    .back-link {
      margin-top: 15px;
      display: block;
      font-size: 0.9rem;
      color: #43e97b;
      text-decoration: none;
    }
    .back-link:hover {
      text-decoration: underline;
    }
    @keyframes fadeIn {
      from {opacity: 0; transform: translateY(20px);}
      to {opacity: 1; transform: translateY(0);}
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="logo">
      <img src="images/h-pay.png" alt="HPay Logo">
    </div>
    <h2>Check Transaction</h2>
    <p>Enter the Transaction ID and Receiver UPI to view details.</p>
    
    <form action="checkid" method="post" ">
      <div class="form-group">
        <label for="txnid">Transaction ID</label>
        <input type="text" id="txnid" name="txnid" placeholder="Enter Transaction ID" required>
      </div>
      <div class="form-group">
        <label for="receiver">Receiver UPI</label>
        <input type="text" id="receiver" name="receiver" placeholder="receiver@bank" required>
      </div>
      <button type="submit" class="btn">Check Transaction</button>
    </form>
    
    <div class="transaction-details">
     
	  <h3>Transaction Details</h3>
	  <p><strong>Transaction ID:</strong> ${sessionScope.transid}</p>
	  <p><strong>Sender UPI:</strong> ${sessionScope.senupi}</p>
	  <p><strong>Receiver UPI:</strong> ${sessionScope.recupi}</p>
	  <p><strong>Amount:</strong> ${sessionScope.samount}</p>
	  <p><strong>Phone Number:</strong> ${sessionScope.phno}</p>
	  <p><strong>Date & Time:</strong> ${sessionScope.stimedate}</p>
	  <p><strong>Status:</strong> ${sessionScope.status}</p>
	</div>
    
    <a href="login page.html" class="back-link">← Back to Login</a>
  </div>

  <script>
   
  </script>
</body>
</html>
