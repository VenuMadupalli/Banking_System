<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>


<h2>Transfer money</h2>
<form action="Transfer" method="post">
    Receiver Account No: <input type="text" name="toAccount" required><br><br>
    Enter Amount: <input type="number" name="amount" step="1" required><br><br>
    <button type="submit">Send</button>
</form>
</body>
</html>