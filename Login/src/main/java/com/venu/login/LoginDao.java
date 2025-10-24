package com.venu.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDao {

    String query = "SELECT * FROM users WHERE username=? AND password=?";
    String url = "jdbc:mysql://localhost:3306/application";
    String user = "root";
    String passWord = "Madupalli@2005";

    public boolean check(String name, String pass) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, passWord);
            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, name);
            st.setString(2, pass);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }

        } catch (Exception e) {
            System.out.println("LoginDao Error: " + e.getLocalizedMessage());
        }
        return false;
    }
}
