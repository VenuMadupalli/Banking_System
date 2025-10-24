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
    // Prevent caching so the back button won't show this page after logout
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
    
    HttpSession sesion= request.getSession(false);
    if(sesion==null){
    	response.sendRedirect("index.js");
    }
    
%>

<h1>Deposit successful</h1>
<a href="home.jsp"> <button>Done</button> </a>
</body>
</html>