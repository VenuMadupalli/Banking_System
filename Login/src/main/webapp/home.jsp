<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    // Check if user is logged in
    HttpSession sess = request.getSession(false);
    if (sess == null || sess.getAttribute("username") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    String username = (String) sess.getAttribute("username");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bank Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #74ebd5, #ACB6E5);
            margin: 0;
            padding: 0;
        }
        .header {
            text-align: center;
            padding: 30px;
            color: #fff;
            font-size: 28px;
            font-weight: bold;
        }
        .dashboard {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            margin: 30px;
        }
        .card {
            background-color: #fff;
            width: 200px;
            padding: 30px 20px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            text-align: center;
            transition: transform 0.2s;
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .card h2 {
            color: #4e54c8;
            margin-bottom: 15px;
        }
        .card a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border-radius: 8px;
            text-decoration: none;
            margin-top: 10px;
            transition: background 0.3s;
        }
        .card a:hover {
            background-color: #45a049;
        }
				.logout-form {
		    text-align: center;      /* Center the button */
		    margin-top: 40px;        /* Space from dashboard cards */
		}
		
		.logout-btn {
		    background-color: #e74c3c;   /* Red button */
		    color: white;
		    padding: 12px 30px;          /* Bigger clickable area */
		    font-size: 16px;
		    border: none;
		    border-radius: 8px;          /* Rounded corners */
		    cursor: pointer;
		    transition: background 0.3s, transform 0.2s;
		}
		
		.logout-btn:hover {
		    background-color: #c0392b;   /* Darker red on hover */
		    transform: translateY(-2px); /* Slight lift effect */
		}


    </style>
</head>
<body>
<%
// Prevent caching so the back button won't show this page after logout
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", 0); // Proxies
%>


    <div class="header">
        Welcome, <%= username %> 👋
    </div>

    <div class="dashboard">
        <div class="card">
            <h2>Balance</h2>
            <p>Check your account balance</p>
            <a href="Balance">View Balance</a>
        </div>
        <div class="card">
            <h2>Deposit</h2>
            <p>Add money to your account</p>
            <a href="Deposit.jsp">Go</a>
        </div>
        <div class="card">
            <h2>Withdraw</h2>
            <p>Withdraw from your account</p>
            <a href="Withdraw.jsp">Go</a>
        </div>
        <div class="card">
            <h2>Transfer</h2>
            <p>Send money to another account</p>
            <a href="Transfer.jsp">Go</a>
        </div>
        
    </div>
    
   <form action="LogOut" method="get" class="logout-form">
    <input type="submit" value="Logout" class="logout-btn">
</form>    

</body>
</html>
