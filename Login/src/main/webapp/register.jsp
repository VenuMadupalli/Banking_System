<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register Page</title>
    <style>
        body { font-family: Arial; background: linear-gradient(to right,#74ebd5,#ACB6E5); display:flex; justify-content:center; align-items:center; height:100vh; margin:0;}
        .container {background:#fff;padding:30px 40px;border-radius:15px;box-shadow:0 0 20px rgba(0,0,0,0.2);width:400px;}
        h2{text-align:center;color:#333;margin-bottom:25px;}
        input[type="text"], input[type="password"], input[type="email"], input[type="number"] {
            width:100%;padding:12px;margin:8px 0 15px 0;border:1px solid #ccc;border-radius:8px;box-sizing:border-box;
        }
        input[type="submit"]{width:100%;padding:12px;background-color:#4CAF50;border:none;color:white;border-radius:8px;cursor:pointer;font-size:16px;}
        input[type="submit"]:hover{background-color:#45a049;}
        .success{color:green;text-align:center;}
        .error{color:red;text-align:center;}
    </style>
</head>
<body>
    <div class="container">
        <h2>Register</h2>

        <%-- Messages --%>
        <%
            String error = request.getParameter("error");
            String success = request.getParameter("success");
            if("true".equals(error)){
        %>
            <p class="error">Registration failed! Check your inputs or username/email may already exist.</p>
        <% } else if("true".equals(success)) { %>
            <p class="success">Registration successful! <a href="index.jsp">Login here</a></p>
            
        <% } %>

        <form action="Register" method="post">
            <label>Username:</label>
            <input type="text" name="username" required>

            <label>Bank Account Number:</label>
            <input type="text" name="bank_account" required>
            
            <label>Balance:</label>
            <input type="number" name="balance" required>

            <label>Mobile:</label>
            <input type="text" name="mobile" required>

            <label>Email:</label>
            <input type="email" name="email" required>

            <label>Password:</label>
            <input type="password" name="password" required>

            <label>Re-enter Password:</label>
            <input type="password" name="repass" required>
                        

            <input type="submit" value="Register">
        </form>
    </div>
</body>
</html>
