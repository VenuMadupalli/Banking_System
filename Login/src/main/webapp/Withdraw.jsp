<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Withdraw Amount</title>
</head>
<body>
<%
    // Prevent caching so the back button won't show this page after logout
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
%>


    <h2>Withdraw Amount</h2>
    <form action="Withdraw" method="post">
        <p>Enter amount: 
            <input type="number" name="amount" step="0.01" required>
        </p>
        <br>
        <button type="submit">Withdraw</button>
    </form>
</body>
</html>
