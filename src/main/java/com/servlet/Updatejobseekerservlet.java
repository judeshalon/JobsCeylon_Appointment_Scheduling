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
import com.entity.Jobseeker;

@WebServlet("/Updatejobseekerservlet")
public class Updatejobseekerservlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {

           int id = Integer.parseInt(req.getParameter("id"));
            JobSeekerDao dao = new JobSeekerDao(dbconnect.getConn());
            Jobseeker jobseeker = dao.getJobseekerById(id);

            String fname = req.getParameter("fname");
            String lname = req.getParameter("lname");
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            String phoneNumber = req.getParameter("phoneNumber");

            
            if(fname != null) jobseeker.setFname(fname);
            if(lname != null) jobseeker.setLname(lname);
            if(email != null) jobseeker.setEmail(email);
            if(password != null) jobseeker.setPassword(password);
            if(phoneNumber!= null) jobseeker.setPhoneNumber(phoneNumber);

            HttpSession session = req.getSession();
            try {
                if (dao.updateJobseeker(jobseeker)) {
                    session.setAttribute("succMsg", "Jobseeker Updated Sucessfully");
                    resp.sendRedirect("admindashboard.jsp");
                } else {
                    session.setAttribute("errorMsg", "something wrong on server");
                    resp.sendRedirect("editconsultant.jsp");
                }
            } catch (Exception e) {
                // Print the exception details for debugging
                e.printStackTrace();
                // You can also set an error message for the user or take appropriate action
                session.setAttribute("errorMsg", "An error occurred while updating the consultant");
                resp.sendRedirect("editjobseeker.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
