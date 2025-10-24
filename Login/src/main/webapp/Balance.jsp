<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Balance</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f6fa;
            text-align: center;
            padding: 50px;
        }
        .card {
            background-color: white;
            display: inline-block;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.2);
        }
    </style>
</head>
<body>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

%>

    <div class="card">
        <h2>Your Current Balance:</h2>
        <h1>₹${balance}</h1>
    </div>
</body>
</html>
