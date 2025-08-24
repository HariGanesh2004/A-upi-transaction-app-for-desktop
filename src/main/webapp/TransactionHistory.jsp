<%@ page import="java.sql.*" %>
<%@ page import="com.hpay.util.Dbconnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String senderupi=(String)(session.getAttribute("supi"));
%>
<!DOCTYPE html>
<html>
<head>
    <title>Transaction History</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            background: #f8fafc;
            font-family: 'Segoe UI', Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 900px;
            margin: 40px auto;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 24px rgba(0,0,0,0.08);
            padding: 32px 24px;
        }
        h2 {
            text-align: center;
            color: #2d3748;
            margin-bottom: 32px;
            font-size: 2rem;
            letter-spacing: 1px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 16px;
        }
        th, td {
            padding: 14px 10px;
            text-align: center;
        }
        th {
            background: #e2e8f0;
            color: #2d3748;
            font-weight: 600;
            border-bottom: 2px solid #cbd5e1;
        }
        tr {
            transition: background 0.2s;
        }
        tr:hover {
            background: #f1f5f9;
        }
        td {
            border-bottom: 1px solid #e2e8f0;
            color: #4a5568;
        }
        .debited {
            color: #e53e3e;
            font-weight: 600;
        }
        .credited {
            color: #38a169;
            font-weight: 600;
        }
        .status-success {
            background: #c6f6d5;
            color: #276749;
            padding: 6px 12px;
            border-radius: 8px;
            font-weight: 500;
        }
        .status-failed {
            background: #fed7d7;
            color: #9b2c2c;
            padding: 6px 12px;
            border-radius: 8px;
            font-weight: 500;
        }
        @media (max-width: 700px) {
            .container { padding: 12px 4px; }
            th, td { padding: 8px 4px; font-size: 0.95rem; }
            h2 { font-size: 1.3rem; }
        }
    </style>
</head>
<body>
<div class="container">
<h2>Transaction History</h2>
<%
    Connection con = null;
    PreparedStatement stmt = null;
    ResultSet res = null;
    String r="";
    String s="";

    try {
        con = Dbconnection.Dbconnect();
        stmt=con.prepareStatement("SELECT ReferenceId,senderupi, receiverupi, amount, timedate, Status FROM transaction_history where senderupi=? or receiverupi=? ORDER BY timedate DESC");
        stmt.setString(1, senderupi);
        stmt.setString(2, senderupi);
        res = stmt.executeQuery();
%>
        <table>
            <tr>
                <th>Transaction ID</th>
                <th>From</th>
                <th>To</th>
                <th>Amount</th>
                <th>Type</th>
                <th>Date &amp; Time</th>
                <th>Status</th>
            </tr>
<%
        while (res.next()) {
            r = res.getString("senderupi");
            boolean isDebited = senderupi.equalsIgnoreCase(r);
            s = isDebited ? "Debited" : "Credited";
            String status = res.getString("Status");
            String statusClass = "status-success";
            if (status != null && !status.equalsIgnoreCase("Success")) statusClass = "status-failed";
%>
            <tr>
                <td><%= res.getString("ReferenceId") %></td>
                <td><%= r %></td>
                <td><%= res.getString("receiverupi") %></td>
                <td class="<%= isDebited ? "debited" : "credited" %>">
                    <%= isDebited ? "-" : "+" %><%= res.getInt("amount") %>
                </td>
                <td><%= s %></td>
                <td><%= res.getTimestamp("timedate") %></td>
                <td><span class="<%= statusClass %>"><%= status %></span></td>
            </tr>
<%
        }
%>
        </table>
<%
    } catch(Exception e) {
        out.println("<div style='color:red;text-align:center;'>Error: " + e.getMessage() + "</div>");
    } finally {
        try { if(res != null) res.close(); } catch(Exception e) {}
        try { if(stmt != null) stmt.close(); } catch(Exception e) {}
        try { if(con != null) con.close(); } catch(Exception e) {}
    }
%>
</div>
</body>
</html>
