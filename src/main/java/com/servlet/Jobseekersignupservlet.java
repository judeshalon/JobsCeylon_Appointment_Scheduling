package com.servlet;

import com.dao.JobSeekerDao;
import com.db.dbconnect;
import com.entity.Jobseeker;
import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Jobseekersignupservlet")
public class Jobseekersignupservlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("fname");
        String lastName = request.getParameter("lname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phoneNumber = request.getParameter("phone");

        try (Connection connection = dbconnect.getConn()) {
            JobSeekerDao jobSeekerDao = new JobSeekerDao(connection);
            Jobseeker jobSeeker = new Jobseeker(firstName, lastName, email, password, phoneNumber);
            boolean success = jobSeekerDao.registerJobSeeker(jobSeeker);

            if (success) {
                // Registration successful, redirect to a success page or show a success message
                response.sendRedirect("index.html");
            } else {
                // Registration failed, display an error message on the same page
                request.setAttribute("errorMessage", "Registration failed. Please try again.");
                request.getRequestDispatcher("jobseekersignup.jsp").forward(request, response);
            }
        } catch (Exception e) {
            // Handle exceptions, you might want to log the error
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred during registration.");
            request.getRequestDispatcher("jobseekersignup.jsp").forward(request, response);
        }
    }
}
