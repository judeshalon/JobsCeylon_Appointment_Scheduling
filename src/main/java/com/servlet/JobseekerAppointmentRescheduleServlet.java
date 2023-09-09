package com.servlet;

import com.dao.AppointmentDao;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.logging.Logger;


import com.db.dbconnect;
import com.entity.Appointment;

@WebServlet("/JobseekerAppointmentRescheduleServlet")
public class JobseekerAppointmentRescheduleServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(RescheduleAppointmentServlet.class.getName());


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            int id = Integer.parseInt(req.getParameter("id"));
            AppointmentDao dao = new AppointmentDao(dbconnect.getConn());
            Appointment appointment = dao.getAppointmentById(id);

            int consultant_id = Integer.parseInt(req.getParameter("consultant_id"));
            int jobseeker_id = Integer.parseInt(req.getParameter("jobseeker_id"));
            String appointment_datetime = 
                    req.getParameter("appointment_date") 
                    + 'T' +  req.getParameter("appointment_date");

            if (consultant_id != 0) {
                appointment.setConsultant_id(consultant_id);
            }
            if (jobseeker_id != 0) {
                appointment.setJobseeker_id(jobseeker_id);
            }
            if (appointment_datetime != null && !appointment_datetime.isEmpty()) {
                appointment.setAppointment_datetime(appointment_datetime);
            }

            HttpSession session = req.getSession();
            try {
                boolean isUpdated = dao.updateAppointment(appointment);

                if (isUpdated) {
                    session.setAttribute("succMsg", "Appointment Updated successfully");
                    resp.sendRedirect("jobseekerdashboard.jsp");
                } else {
                    session.setAttribute("errorMsg", "Something went wrong on the server");
                    resp.sendRedirect("jobseekerAppointmentReschedule.jsp");
                }
            } catch (Exception e) {
                // Print the exception details for debugging
                e.printStackTrace();
                // You can also set an error message for 
                // the user or take appropriate action
                session.setAttribute("errorMsg", "An error occurred while updating the appointment");
                resp.sendRedirect("jobseekerAppointmentReschedule.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
