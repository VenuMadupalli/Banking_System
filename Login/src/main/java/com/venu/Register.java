package com.venu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/Register")
public class Register extends HttpServlet {

    String url = "jdbc:mysql://localhost:3306/application";
    String user = "root";
    String passWord = "Madupalli@2005";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0
        response.setDateHeader("Expires", 0); // Proxies

        String username = request.getParameter("username");
        String bankAccount = request.getParameter("bank_account");
        int balance=Integer.parseInt( request.getParameter("balance"));
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String repass = request.getParameter("repass");

        // Check if passwords match
        if (!password.equals(repass)) {
            response.sendRedirect("register.jsp?error=true");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, passWord);

            String query = "INSERT INTO users(username, bank_account,balance,  mobile, email, password) VALUES(?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, bankAccount);
            ps.setLong(3, balance);
            ps.setString(4, mobile);
            ps.setString(5, email);
            ps.setString(6, password);

            int i = ps.executeUpdate();
            if (i > 0) {
                response.sendRedirect("register.jsp?success=true");
            } else {
                response.sendRedirect("register.jsp?error=true");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?error=true");
        }
    }
}
