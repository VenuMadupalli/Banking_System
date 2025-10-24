package com.venu;

import java.io.IOException;

import com.venu.login.LoginDao;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Loginn")   // Maps the servlet to /Login
public class Login extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String name= request.getParameter("uname");
		String pass= request.getParameter("pass");
		
		LoginDao dao= new LoginDao();
		
		
		if(dao.check(name, pass)) {
			HttpSession session= request.getSession();
			session.setAttribute("username", name);
			response.sendRedirect("home.jsp");
		}
		else {
			response.sendRedirect("index.jsp");
		}
    }
}
