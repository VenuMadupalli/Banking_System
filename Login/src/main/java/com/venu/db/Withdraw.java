package com.venu.db;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.venu.db.DBConnection;

/**
 * Servlet implementation class Withdraw
 */
@WebServlet("/Withdraw")
public class Withdraw extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	final String query = "UPDATE users SET balance = balance - ?"
	        + "WHERE username = ?;";

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        String username = (String) session.getAttribute("username");
        double amount = Double.parseDouble(request.getParameter("amount"));
        double newBalance = 0.0;

        try (Connection conn = DBConnection.getConnection()) {

            // Update balance
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setDouble(1, amount);
            ps.setString(2, username);
            ps.executeUpdate();
            ps.close();

            // Get updated balance
           

        } catch (Exception e) {
            e.addSuppressed(e);;
        }

        // Forward to JSP with updated balance
//        request.setAttribute("balance", newBalance);
        response.sendRedirect("WithdrawSuc.jsp");
	}

}
