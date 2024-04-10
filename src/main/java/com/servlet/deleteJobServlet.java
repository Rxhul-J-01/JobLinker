package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.jobDAO;
import com.db.DBConnect;

@WebServlet("/delete")

public class deleteJobServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			int id = Integer.parseInt(req.getParameter("id"));
			
			jobDAO dao = new jobDAO(DBConnect.getCon());
			
			HttpSession session = req.getSession();
			
			boolean success = dao.deleteJob(id);
			
			if(success) {
				session.setAttribute("alertMsg", "Job delete Successfully");
				resp.sendRedirect("viewjob.jsp");
			}else {
				session.setAttribute("alertMsg", "Something went wrong");
				resp.sendRedirect("viewjob.jsp");
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	
}
