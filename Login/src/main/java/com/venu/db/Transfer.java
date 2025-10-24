package com.venu.db;
import com.venu.db.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

@WebServlet("/Transfer")
public class Transfer extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("username");
        String toAccount = request.getParameter("toAccount");
        int amount = Integer.parseInt(request.getParameter("amount"));

        try (Connection con = DBConnection.getConnection()) {
            con.setAutoCommit(false);

            // 1️⃣ Get sender balance and account
            PreparedStatement ps1 = con.prepareStatement("SELECT balance, bank_account FROM users WHERE username = ?");
            ps1.setString(1, username);
            ResultSet rs1 = ps1.executeQuery();
            if (!rs1.next()) {
                out.println("Sender not found!");
                return;
            }

            int senderBalance = rs1.getInt("balance");
            String senderAccount = rs1.getString("bank_account");

            if (senderBalance < amount) {
                out.println("Insufficient balance!");
                return;
            }

            // 2️⃣ Deduct from sender
            PreparedStatement ps2 = con.prepareStatement("UPDATE users SET balance = balance - ? WHERE username = ?");
            ps2.setInt(1, amount);
            ps2.setString(2, username);
            ps2.executeUpdate();

            // 3️⃣ Add to receiver
            PreparedStatement ps3 = con.prepareStatement("UPDATE users SET balance = balance + ? WHERE bank_account = ?");
            ps3.setInt(1, amount);
            ps3.setString(2, toAccount);
            int rows = ps3.executeUpdate();
            if (rows == 0) {
                con.rollback();
                out.println("Receiver account not found!");
                return;
            }

            con.commit();
            out.println("<h3>Transfer Successful!</h3>");
            
            response.sendRedirect("TranSuc.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3>Transfer Failed: " + e.getMessage() + "</h3>");
        }
    }
}
