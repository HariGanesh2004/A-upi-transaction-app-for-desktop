<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Timestamp"%>

<%int amount=(Integer)session.getAttribute("amount");
String rupi=(String)session.getAttribute("rupi");
String rid=(String)session.getAttribute("rid");
  Timestamp time=new Timestamp(System.currentTimeMillis());%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Transaction Failed</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet" />
    <style>
      :root {
        --bg: #0b1220;
        --card: #0f172a;
        --muted: #8ea0b8;
        --text: #e5eef8;
        --danger: #dc2626;
        --danger-700: #b91c1c;
        --ring: rgba(220, 38, 38, 0.35);
        --shadow: 0 10px 30px rgba(0, 0, 0, 0.35);
      }

      * { box-sizing: border-box; }

      html, body { height: 100%; }

      body {
        margin: 0;
        background: radial-gradient(1200px 800px at 50% -100px, rgba(220, 38, 38, 0.18), transparent 60%) , var(--bg);
        font-family: "Inter", system-ui, -apple-system, Segoe UI, Roboto, Arial, sans-serif;
        color: var(--text);
        display: grid;
        place-items: center;
        padding: 24px;
      }

      .card {
        width: 100%;
        max-width: 520px;
        background: linear-gradient(180deg, rgba(220, 38, 38, 0.07), transparent 45%), var(--card);
        border: 1px solid rgba(255, 255, 255, 0.06);
        border-radius: 16px;
        box-shadow: var(--shadow);
        padding: 28px;
      }

      .icon-wrap {
        width: 72px;
        height: 72px;
        border-radius: 999px;
        background: rgba(220, 38, 38, 0.12);
        border: 1px solid rgba(220, 38, 38, 0.35);
        display: grid;
        place-items: center;
        margin: 4px auto 16px;
        box-shadow: 0 0 0 10px rgba(220, 38, 38, 0.05);
      }

      .title {
        text-align: center;
        font-size: 24px;
        font-weight: 700;
        letter-spacing: 0.2px;
        margin: 6px 0 6px;
      }

      .subtitle {
        text-align: center;
        color: var(--muted);
        font-size: 14px;
        margin: 0 0 22px;
      }

      .details {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 14px 12px;
        padding: 16px;
        background: rgba(255, 255, 255, 0.02);
        border: 1px solid rgba(255, 255, 255, 0.06);
        border-radius: 12px;
        margin-bottom: 20px;
      }

      .label { color: var(--muted); font-size: 12px; }
      .value { font-size: 14px; font-weight: 600; letter-spacing: 0.2px; }

      .actions {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 12px;
      }

      a.button {
        text-decoration: none;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        gap: 8px;
        height: 44px;
        border-radius: 10px;
        border: 1px solid rgba(255, 255, 255, 0.08);
        color: white;
        font-weight: 600;
        letter-spacing: 0.2px;
        transition: transform 120ms ease, box-shadow 120ms ease, background 120ms ease;
      }

      a.button.primary {
        background: linear-gradient(180deg, var(--danger), var(--danger-700));
        box-shadow: 0 8px 20px var(--ring);
      }

      a.button.secondary { background: rgba(255, 255, 255, 0.04); }
      a.button:hover { transform: translateY(-1px); }
      a.button:active { transform: translateY(0); }

      .badge {
        display: inline-block;
        padding: 6px 10px;
        border-radius: 999px;
        font-size: 12px;
        font-weight: 700;
        letter-spacing: 0.3px;
        background: rgba(220, 38, 38, 0.14);
        border: 1px solid rgba(220, 38, 38, 0.35);
        color: #fecaca;
        margin: 0 auto 8px;
      }

      .help {
        margin-top: 14px;
        text-align: center;
        font-size: 12px;
        color: var(--muted);
      }

      @media (max-width: 420px) {
        .details { grid-template-columns: 1fr; }
        .actions { grid-template-columns: 1fr; }
      }
    </style>
  </head>
  <body>
    <main class="card" role="main" aria-labelledby="title">
      <div class="icon-wrap" aria-hidden="true">
        <svg width="32" height="32" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
          <path d="M12 9v4m0 4h.01M22 12a10 10 0 1 1-20 0 10 10 0 0 1 20 0Z" stroke="#dc2626" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
      </div>
      <div class="badge">FAILED</div>
      <h1 id="title" class="title">Transaction Failed</h1>
      <p class="subtitle">We couldn't complete your payment.</p>

      <section class="details" aria-label="Transaction details">
      
      <div>
          <div class="label">ReferenceId</div>
          <div class="value"><%=rid %></div>
        </div>
        
        <div>
          <div class="label">Amount</div>
          <div class="value">₹<%=amount %></div>
        </div>
        
         <div>
          <div class="label">To</div>
          <div class="value"><%= rupi %></div>
        </div>
        
        <div>
          <div class="label">Reason</div>
          <div class="value">Insufficient funds / Network error /Pin incorrect</div>
        </div>
        <div>
          <div class="label">Date & Time</div>
          <div class="value"><%=time %></div>
        </div>
      </section>

      <div class="actions">
        <a class="button primary" href="login page.html">Try login Again</a>
        <a class="button secondary" href="support.html">Contact Support</a>
      </div>

      <p class="help">If funds were deducted, they will be auto-refunded within 2-7 business days.</p>
    </main>
  </body>
</html>

