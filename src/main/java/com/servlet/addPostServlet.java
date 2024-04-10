package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.jobDAO;
import com.db.DBConnect;
import com.entity.Job;

@WebServlet("/add_job")

public class addPostServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			PrintWriter out = resp.getWriter();
			
			String title = req.getParameter("title");
			String location = req.getParameter("location");
			String category = req.getParameter("category");
			String status = req.getParameter("status");
			String description = req.getParameter("description");
			
			if (title == null || title.isEmpty()) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Enter Title');");
                out.println("window.location.href='postjob.jsp';");
                out.println("</script>");
                return; // Stop further processing
            } else if (location == null || location.isEmpty()) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Enter Location');");
                out.println("window.location.href='postjob.jsp';");
                out.println("</script>");
                return; // Stop further processing
            } else if (category == null || category.isEmpty()) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Enter Category');");
                out.println("window.location.href='postjob.jsp';");
                out.println("</script>");
                return; // Stop further processing
            } else if (status == null || status.isEmpty()) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Enter Status');");
                out.println("window.location.href='postjob.jsp';");
                out.println("</script>");
                return;
            }
			
			
			Job j = new Job();
			
			j.setTitle(title);
			j.setLocation(location);
			j.setCategory(category);
			j.setStatus(status);
			j.setDescription(description);
			
			HttpSession session = req.getSession();
			
			jobDAO dao = new jobDAO(DBConnect.getCon());
			
			boolean success = dao.addJobs(j);
			
			if(success) {
				session.setAttribute("alertMsg", "Job Posted Successfully");
				resp.sendRedirect("postjob.jsp");
			}else {
				session.setAttribute("alertMsg", "Something went wrong");
				resp.sendRedirect("postjob.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
