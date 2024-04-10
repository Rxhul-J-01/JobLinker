package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.userDAO;
import com.db.DBConnect;
import com.entity.User;

@WebServlet("/register")

public class RegisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			String name = req.getParameter("name");
			String qualification = req.getParameter("qualification");
			String email = req.getParameter("email");
			String pass = req.getParameter("pass");
			
			userDAO dao = new userDAO(DBConnect.getCon());
			
			User u = new User(name, email, pass, qualification,"user");		
			
			boolean f = dao.addUser(u);
			HttpSession session = req.getSession();
			
			if(f) {
				session.setAttribute("succMsg", "Registration Successfull");
				resp.sendRedirect("register.jsp");
			}else {
				session.setAttribute("succMsg", "Something went wrong");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
}
