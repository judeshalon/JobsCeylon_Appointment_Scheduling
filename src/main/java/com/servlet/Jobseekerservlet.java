package com.servlet;


import com.dao.ConsultantDao;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.JobSeekerDao;
import com.db.dbconnect;
import com.entity.Consultant;
import com.entity.Jobseeker;
import javax.servlet.http.Cookie;

@WebServlet("/Jobseekerservlet")
public class Jobseekerservlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        HttpSession session = req.getSession();
        JobSeekerDao dao = new JobSeekerDao(dbconnect.getConn());
        Jobseeker jobseeker = dao.login(email, password);
        String id = Integer.toString(jobseeker.getId());

        if (jobseeker != null) {
            session.setAttribute("userObj", jobseeker);
            resp.addCookie(new Cookie("consultantId", id));
            resp.addCookie(new Cookie("loggedInType", "JOBSEEKER"));

            resp.sendRedirect("jobseekerdashboard.jsp");
        } else {
            session.setAttribute("errorMsg", "invalid email & password");
            resp.sendRedirect("jobseekerlogin.jsp");
        }

    }

}
