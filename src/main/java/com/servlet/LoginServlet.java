package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.userDAO;
import com.db.DBConnect;
import com.entity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			String email = req.getParameter("email");
			String pass = req.getParameter("pass");
			
			PrintWriter out = resp.getWriter();
			
			if (email.isEmpty() || pass.isEmpty()) {
                req.setAttribute("errorMsg", "Please enter both email & password.");
                req.getRequestDispatcher("login.jsp").forward(req, resp);
                return;
            }

			User u = new User();
			HttpSession session = req.getSession();
			
			if("admin@gmail.com".equals(email) && "admin1234".equals(pass)) {
				u.setRole("admin");
				session.setAttribute("userObj", u);
				resp.sendRedirect("admin.jsp");
				
			}
			else {
			    userDAO dao = new userDAO(DBConnect.getCon());
			    User user = dao.Login(email, pass);
			    if(user != null) {
			        session.setAttribute("userObj",user);
			        resp.sendRedirect("home.jsp");
			    } else {
			        req.setAttribute("errorMsg", "Invalid email & password");
			        req.getRequestDispatcher("login.jsp").forward(req, resp);
			    }
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}
}