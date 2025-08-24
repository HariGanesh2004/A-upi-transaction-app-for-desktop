<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.hpay.util.Dbconnection" %>
<%@ page import="java.sql.* " %>
<%@ page import="com.hpay.UserDetails" %>
<%
String senderupi=(String)session.getAttribute("supi");
String GETUSER="select*from transaction_db where upiid=?";
String upi="";
String name="";
String bank="";
String balance="";
String email="";
try 
	(Connection con=Dbconnection.Dbconnect();
	PreparedStatement stmt=con.prepareStatement(GETUSER)){
	stmt.setString(1,senderupi);
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
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HPay - Money Transfer</title>
    <style>
        body {
            min-height: 100vh;
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(120deg, #2980b9 0%, #6dd5fa 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            overflow-y: auto;
        }
        .animated-bg {
            position: fixed;
            top: 0; left: 0; width: 100vw; height: 100vh;
            z-index: 0;
            overflow: hidden;
        }
        .circle {
            position: absolute;
            border-radius: 50%;
            opacity: 0.13;
            animation: float 8s ease-in-out infinite alternate;
        }
        .circle1 { width: 220px; height: 220px; background: #fff; left: 5vw; top: 10vh; animation-delay: 0s;}
        .circle2 { width: 140px; height: 140px; background: #2980b9; right: 8vw; top: 18vh; animation-delay: 2s;}
        .circle3 { width: 90px; height: 90px; background: #6dd5fa; left: 50vw; bottom: 8vh; animation-delay: 1s;}
        @keyframes float {
            0% { transform: translateY(0);}
            100% { transform: translateY(-30px);}
        }
        .logout-btn-container {
            position: fixed;
            top: 32px;
            right: 48px;
            z-index: 10;
        }
        .logout-btn {
            background: #2980b9;
            color: #fff;
            border: none;
            border-radius: 10px;
            padding: 10px 26px;
            font-size: 1.08rem;
            font-weight: 600;
            cursor: pointer;
            box-shadow: 0 2px 8px rgba(41,128,185,0.10);
            transition: background 0.2s, transform 0.2s;
        }
        .logout-btn:hover {
            background: #1c5980;
            transform: scale(1.04);
        }
        .transaction-card {
            padding: 0;
            width: 600px;
            max-width: 98vw;
            background: #fff;
            border-radius: 24px;
            box-shadow: 0 8px 32px rgba(41,128,185,0.18);
            border: 1.5px solid #e3e3e3;
            margin: 80px auto 0 auto;
            position: relative;
            z-index: 1;
        }
        .transaction-flex {
            display: flex;
            gap: 0;
            align-items: stretch;
            min-height: 100%;
        }
        .user-details {
            background: linear-gradient(135deg,#f6f8fa 80%,#e3f2fd 100%);
            border-radius: 24px 0 0 24px;
            box-shadow: 0 1px 4px rgba(41,128,185,0.04);
            padding: 32px 18px;
            min-width: 100px;
            max-width: auto;
            text-align: left;
            flex-shrink: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .user-details-title {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 1.15rem;
            font-weight: 700;
            color: #2980b9;
            margin-bottom: 18px;
        }
        .user-logo {
            width: 38px;
            height: 38px;
            border-radius: 50%;
            background: #e0e7ff;
            object-fit: cover;
            border: 2px solid #2980b9;
        }
        .user-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 18px;
        }
        .user-label {
            font-weight: 600;
            color: #2980b9;
            font-size: 1rem;
        }
        .user-value {
            color: #222;
            font-size: 1rem;
            word-break: break-all;
            margin-left: 8px;
        }
        .user-history-link {
            margin-top: 10px;
        }
        .user-history-link a {
            color: #2980b9;
            font-weight: 600;
            text-decoration: none;
            transition: text-decoration 0.2s;
        }
        .user-history-link a:hover {
            text-decoration: underline;
        }
        .transaction-main {
            flex: 1;
            padding: 32px 22px 22px 22px;
            text-align: center;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .logo {
            margin-bottom: 12px;
        }
        .logo img {
            width: 60px;
            height: 60px;
            border-radius: 14px;
            box-shadow: 0 2px 12px rgba(41,128,185,0.10);
        }
        .page-title {
            font-size: 1.7rem;
            font-weight: 700;
            color: #2980b9;
            margin-bottom: 4px;
            letter-spacing: 0.5px;
        }
        .page-subtitle {
            color: #6c757d;
            font-size: 1.08rem;
            margin-bottom: 18px;
        }
        .transfer-icon {
            margin-bottom: 10px;
            display: flex;
            justify-content: center;
        }
        .form-group {
            margin-bottom: 14px;
            text-align: left;
        }
        .form-group label {
            display: block;
            color: #222;
            font-weight: 500;
            margin-bottom: 4px;
            font-size: 0.98rem;
        }
        .input-wrapper {
            position: relative;
        }
        .input-wrapper input {
            width: 100%;
            box-sizing: border-box;
            padding: 10px 36px 10px 12px;
            border: 1.5px solid #e3e3e3;
            border-radius: 8px;
            font-size: 1rem;
            background: #f6f8fa;
            transition: border 0.2s, box-shadow 0.2s;
            box-shadow: 0 1px 4px rgba(41,128,185,0.03);
            display: block;
        }
        .input-wrapper input:focus {
            border-color: #2980b9;
            box-shadow: 0 0 0 2px #2980b933;
            outline: none;
        }
        .input-icon {
            position: absolute;
            right: 12px;
            top: 50%;
            transform: translateY(-50%);
            width: 22px;
            height: 22px;
            color: #2980b9;
            opacity: 0.85;
        }
        .amount-section {
            margin-bottom: 14px;
            text-align: left;
        }
        .amount-label {
            font-weight: 500;
            color: #222;
            margin-bottom: 4px;
            font-size: 0.98rem;
        }
        .submit-section {
            margin-top: 10px;
        }
        .submit-btn {
            width: 100%;
            padding: 12px 0;
            background: linear-gradient(90deg, #2980b9 0%, #6dd5fa 100%);
            color: #fff;
            border: none;
            border-radius: 8px;
            font-size: 1.08rem;
            font-weight: 600;
            cursor: pointer;
            box-shadow: 0 2px 8px rgba(41,128,185,0.10);
            transition: background 0.2s, transform 0.2s;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }
        .submit-btn:hover {
            background: linear-gradient(90deg, #6dd5fa 0%, #2980b9 100%);
            transform: translateY(-1px) scale(1.01);
        }
        .security-info {
            margin-top: 18px;
            font-size: 0.95rem;
            color: #6c757d;
        }
        .security-badge {
            display: inline-block;
            background: #e0e7ff;
            color: #2980b9;
            border-radius: 6px;
            padding: 4px 10px;
            font-size: 0.88rem;
            font-weight: 500;
            margin-bottom: 6px;
        }
        .help-text a {
            color: #2980b9;
            text-decoration: none;
            font-weight: 500;
            margin: 0 6px;
        }
        .help-text a:hover {
            text-decoration: underline;
        }
        @media (max-width: 700px) {
            .logout-btn-container {
                top: 12px;
                right: 12px;
            }
            .transaction-card {
                width: 98vw;
                border-radius: 18px;
                margin-top: 60px;
            }
            .transaction-flex {
                flex-direction: column;
                align-items: stretch;
            }
            .user-details {
                border-radius: 18px 18px 0 0;
                max-width: 100%;
                min-width: 0;
                margin-bottom: 0;
                padding: 18px 18px;
            }
            .transaction-main {
                padding: 18px 12px 12px 12px;
            }
        }
        @media (max-width: 480px) {
            .transaction-card {
                width: 98vw;
                padding: 16px 4vw 12px 4vw;
                border-radius: 14px;
            }
            .logo img {
                width: 38px;
                height: 38px;
                border-radius: 8px;
            }
            .page-title {
                font-size: 1.1rem;
            }
            .submit-btn {
                font-size: 1rem;
                padding: 10px 0;
            }
        }
    </style>
</head>
<body>
    <div class="animated-bg">
        <div class="circle circle1"></div>
        <div class="circle circle2"></div>
        <div class="circle circle3"></div>
    </div>
    <div class="logout-btn-container">
        <form action="login page.html" method="post" style="margin:0;">
            <button type="submit" class="logout-btn">Logout</button>
        </form>
    </div>
    <div class="transaction-card" style="backdrop-filter: blur(12px); background: rgba(255,255,255,0.75); border-radius: 32px; box-shadow: 0 12px 40px rgba(60,60,120,0.15); border: 1.5px solid #e3e3e3;">
        <div class="transaction-flex">
            <div class="user-details">
                <div class="user-details-title">
                    <!-- Feather user icon -->
                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" stroke="#4f46e5" fill="none" stroke-width="2" viewBox="0 0 24 24">
                        <circle cx="12" cy="8" r="4"/>
                        <path d="M2 20c0-4 8-6 10-6s10 2 10 6"/>
                    </svg>
                    <span>User Details</span>
                </div >
                <div class="user-row"><span class="user-label">Name:</span><span class="user-value"><%= name %></span></div>
                <div class="user-row"><span class="user-label">E-Mail:</span><span class="user-value"><%=email %></span></div>
                <div class="user-row"><span class="user-label">UPI ID:</span><span class="user-value"><%= session.getAttribute("supi") %></span></div>
                <div class="user-row"><span class="user-label">Balance:</span><span class="user-value">&#8377; <%= balance %></span></div>
                <div class="user-row"><span class="user-label">Phone:</span><span class="user-value"><%= session.getAttribute("phonenumber") %></span></div>
                <div class="user-row"><span class="user-label">Bank:</span><span class="user-value"><%= bank %></span></div>
                <div class="user-history-link">
                    <a href="TransactionHistory.jsp">View Transaction History</a>
                </div>
            </div>
            <div class="transaction-main">
                <div class="logo">
                    <img src="images/h-pay.png" alt="H-Pay Logo" style="box-shadow:0 4px 16px rgba(79,70,229,0.12);">
                </div>
                <div class="page-title" style="color:#4f46e5;">Money Transfer</div>
                <div class="page-subtitle">Send money securely to anyone, anywhere</div>
                <div class="transfer-icon">
                    <!-- Feather arrow-right-circle icon -->
                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" stroke="#4f46e5" fill="none" stroke-width="2" viewBox="0 0 24 24">
                        <circle cx="12" cy="12" r="10"/>
                        <path d="M8 12h8M14 8l4 4-4 4"/>
                    </svg>
                </div>
                <form action="transactionservlet" method="post" id="transferForm" autocomplete="off">
                    <div class="form-group">
                        <label for="senderUpi">Sender UPI</label>
                        <div class="input-wrapper">
                            <input 
                                type="text" 
                                id="senderUpi"
                                value="<%= senderupi %>" readonly
                                name="senderUpi" 
                                required
                                style="border-radius:16px;"
                            >
                            <span class="input-icon">
                                <!-- Feather credit-card icon -->
                                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" stroke="#4f46e5" fill="none" stroke-width="2" viewBox="0 0 24 24">
                                    <rect x="2" y="7" width="20" height="10" rx="2"/>
                                    <line x1="2" y1="11" x2="22" y2="11"/>
                                </svg>
                            </span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="receiverUpi">Receiver UPI</label>
                        <div class="input-wrapper">
                            <input 
                                type="text" 
                                id="receiverUpi"
                                name="receiverUpi" 
                                placeholder="Enter receiver's UPI ID (e.g., user@bank)"
                                required
                                style="border-radius:16px;"
                            >
                            <span class="input-icon">
                                <!-- Feather credit-card icon -->
                                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" stroke="#4f46e5" fill="none" stroke-width="2" viewBox="0 0 24 24">
                                    <rect x="2" y="7" width="20" height="10" rx="2"/>
                                    <line x1="2" y1="11" x2="22" y2="11"/>
                                </svg>
                            </span>
                        </div>
                    </div>
                    <div class="amount-section">
                        <div class="amount-label">Transfer Amount</div>
                        <div class="input-wrapper">
                            <input 
                                type="number" 
                                id="amount"
                                name="amount" 
                                class="amount-input"
                                placeholder="0.00"
                                min="0.01"
                                step="0.01"
                                required
                                style="border-radius:16px;"
                            >
                            <span class="input-icon">
                                <!-- Feather dollar-sign icon -->
                                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" stroke="#4f46e5" fill="none" stroke-width="2" viewBox="0 0 24 24">
                                    <line x1="12" y1="1" x2="12" y2="23"/>
                                    <path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"/>
                                </svg>
                            </span>
                        </div>
                    </div>
                    <div class="submit-section">
                        <button type="submit" class="submit-btn" id="submitBtn" style="background:linear-gradient(90deg,#4f46e5 0%,#6366f1 100%); border-radius:16px;">
                            <span>
                                <!-- Feather send icon -->
                                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" stroke="#fff" fill="none" stroke-width="2" viewBox="0 0 24 24">
                                    <line x1="22" y1="2" x2="11" y2="13"/>
                                    <polygon points="22 2 15 22 11 13 2 9 22 2"/>
                                </svg>
                            </span>
                            Transfer Money
                        </button>
                    </div>
                </form>
                <div class="security-info">
                    <div class="security-badge" style="background:#eef2ff; color:#4f46e5;">256-bit SSL Encrypted Transfer</div>
                    <div class="help-text">
                        Need help? <a href="support.html">Contact Support</a> 
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal for UPI PIN -->
    <div id="upiPinModal" style="display:none; position:fixed; z-index:10000; left:0; top:0; width:100vw; height:100vh; background:rgba(0,0,0,0.4); align-items:center; justify-content:center;">
        <div style="background:white; padding:30px 25px; border-radius:15px; box-shadow:0 8px 32px rgba(0,0,0,0.2); max-width:320px; margin:auto; text-align:center;">
            <h3 style="margin-bottom:18px;">Enter UPI PIN</h3>
            <input type="password" id="upiPinInput" maxlength="6" minlength="4" pattern="\d*" style="padding:12px 16px; font-size:1.1rem; border-radius:8px; border:1.5px solid #2980b9; width:90%; margin-bottom:18px;" placeholder="UPI PIN" autofocus>
            <div>
                <button id="upiPinConfirmBtn" style="background:#2980b9; color:white; border:none; border-radius:8px; padding:10px 24px; font-weight:600; font-size:1rem; cursor:pointer;">Confirm</button>
                <button id="upiPinCancelBtn" style="background:#eee; color:#333; border:none; border-radius:8px; padding:10px 18px; font-size:1rem; margin-left:10px; cursor:pointer;">Cancel</button>
            </div>
            <div id="upiPinError" style="color:red; font-size:0.95rem; margin-top:10px; display:none;"></div>
        </div>
    </div>
    <!-- Loading Modal -->
    <div id="loadingModal" style="display:none; position:fixed; z-index:10001; left:0; top:0; width:100vw; height:100vh; background:rgba(0,0,0,0.35); align-items:center; justify-content:center;">
        <div style="background:rgba(255,255,255,0.95); padding:32px 28px; border-radius:18px; box-shadow:0 8px 32px rgba(0,0,0,0.18); max-width:320px; margin:auto; text-align:center;">
            <!-- Spinner SVG -->
            <svg width="48" height="48" viewBox="0 0 50 50" style="margin-bottom:18px;">
                <circle cx="25" cy="25" r="20" fill="none" stroke="#4f46e5" stroke-width="5" stroke-linecap="round" stroke-dasharray="31.4 31.4" stroke-dashoffset="0">
                    <animateTransform attributeName="transform" type="rotate" from="0 25 25" to="360 25 25" dur="1s" repeatCount="indefinite"/>
                </circle>
            </svg>
            <div style="font-size:1.15rem; color:#4f46e5; font-weight:600;">Processing Transaction...</div>
            <div style="color:#666; font-size:0.98rem; margin-top:8px;">Please wait while we complete your payment.</div>
        </div>
    </div>
    <script>
        // Input focus animations
        const inputs = document.querySelectorAll('input');
        inputs.forEach(input => {
            input.addEventListener('focus', function() {
                this.parentElement.classList.add('focused');
            });
            input.addEventListener('blur', function() {
                this.parentElement.classList.remove('focused');
            });
        });
        // Amount input formatting
        const amountInput = document.getElementById('amount');
        amountInput.addEventListener('input', function() {
            if (this.value) {
                const value = parseFloat(this.value);
                if (!isNaN(value)) {
                    this.style.color = value > 0 ? '#2980b9' : '#333';
                }
            }
        });
        const transferForm = document.getElementById('transferForm');
        const upiPinModal = document.getElementById('upiPinModal');
        const upiPinInput = document.getElementById('upiPinInput');
        const upiPinConfirmBtn = document.getElementById('upiPinConfirmBtn');
        const upiPinCancelBtn = document.getElementById('upiPinCancelBtn');
        const upiPinError = document.getElementById('upiPinError');
        let pendingFormSubmit = false;
        transferForm.addEventListener('submit', function(e) {
            if (!pendingFormSubmit) {
                e.preventDefault();
                upiPinInput.value = '';
                upiPinError.style.display = 'none';
                upiPinModal.style.display = 'flex';
                upiPinInput.focus();
            } else {
                pendingFormSubmit = false;
            }
        });
        upiPinConfirmBtn.onclick = function() {
            const pin = upiPinInput.value.trim();
            if (!/^\d{4,6}$/.test(pin)) {
                upiPinError.textContent = "Please enter a valid 4-6 digit UPI PIN.";
                upiPinError.style.display = 'block';
                upiPinInput.focus();
                return;
            }
            let hidden = document.getElementById('upiPinHidden');
            if (!hidden) {
                hidden = document.createElement('input');
                hidden.type = 'hidden';
                hidden.name = 'upiPin';
                hidden.id = 'upiPinHidden';
                transferForm.appendChild(hidden);
            }
            hidden.value = pin;
            upiPinModal.style.display = 'none';
            // Show loading modal
            document.getElementById('loadingModal').style.display = 'flex';
            pendingFormSubmit = true;
            setTimeout(function() {
                transferForm.submit();
            }, 1200); // Show loading for at least 1.2 seconds
        };
        upiPinCancelBtn.onclick = function() {
            upiPinModal.style.display = 'none';
        };
        upiPinInput.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') upiPinModal.style.display = 'none';
            if (e.key === 'Enter') upiPinConfirmBtn.click();
        });
    </script>
</body>
</html>