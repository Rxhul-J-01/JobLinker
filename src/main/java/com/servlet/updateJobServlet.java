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
import com.entity.Job;

@WebServlet("/update")
public class updateJobServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			int id = Integer.parseInt(req.getParameter("id"));
			String title = req.getParameter("title");
			String location = req.getParameter("location");
			String category = req.getParameter("category");
			String status = req.getParameter("status");
			String description = req.getParameter("description");
			
			Job j = new Job();
			
			j.setId(id);
			j.setTitle(title);
			j.setLocation(location);
			j.setCategory(category);
			j.setStatus(status);
			j.setDescription(description);
			
			HttpSession session = req.getSession();
			
			jobDAO dao = new jobDAO(DBConnect.getCon());
			
			boolean success = dao.updateJob(j);
			
			if(success) {
				session.setAttribute("alertMsg", "Job update Successfully");
				resp.sendRedirect("viewjob.jsp");
			}else {
				session.setAttribute("alertMsg", "Something went wrong");
				resp.sendRedirect("viewjob.jsp");
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	
}
