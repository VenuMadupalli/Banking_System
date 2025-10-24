<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Deposit Money</title>
</head>
<body>
<%
// Prevent caching so the back button won't show this page after logout
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", 0); // Proxies
%>

    <h2>Deposit Amount</h2>
    <form action="Deposit" method="post">
        <label>Enter Amount:</label>
        <input type="number" name="amount" required min="1">
        <br><br>
        <button type="submit">Deposit</button>
    </form>
</body>
</html>
