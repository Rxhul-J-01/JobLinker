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

@WebServlet("/updateUserServlet")

public class UpdateUserServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id = Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");
		String qualification = req.getParameter("qualification");
		String email = req.getParameter("email");
		String pass = req.getParameter("pass");
		
		User u = new User();
		
		u.setId(id);
		u.setName(name);
		u.setQualification(qualification);
		u.setEmail(email);
		u.setPassword(pass);
		
		userDAO dao = new userDAO(DBConnect.getCon());
		
		boolean f = dao.updateUser(u);
		HttpSession session = req.getSession();
		PrintWriter out = resp.getWriter();
		
		if(f) {
			out.println("<script type=\"text/javascript\">");
            out.println("alert('Profile Update Successfull');");
            out.println("window.location.href='home.jsp';");
            out.println("</script>");
		}
		else {
			out.println("<script type=\"text/javascript\">");
            out.println("alert('Wrong went wrong');");
            out.println("window.location.href='home.jsp';");
            out.println("</script>");
		}

		
		
	}
	
	

}
