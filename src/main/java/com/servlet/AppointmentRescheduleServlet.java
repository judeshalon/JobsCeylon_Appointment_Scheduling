package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;
import com.db.dbconnect; // Adjust the import for your DBConnect class
import com.entity.Appointment;

@WebServlet("/AppointmentRescheduleServlet")
public class AppointmentRescheduleServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            int id = Integer.parseInt(req.getParameter("id"));
            AppointmentDao dao = new AppointmentDao(dbconnect.getConn()); 
            Appointment appointment = dao.getAppointmentById(id);

            int consultantId = Integer.parseInt(req.getParameter("consultant_id")); // Change parameter name here
            int jobseekerId = Integer.parseInt(req.getParameter("jobseeker_id")); // Change parameter name here
            String newDatetime = req.getParameter("appointment_datetime"); // Change parameter name here

            if (consultantId != 0) appointment.setConsultant_id(consultantId);
            if (jobseekerId != 0) appointment.setJobseeker_id(jobseekerId);
            if (newDatetime != null) appointment.setAppointment_datetime(newDatetime);

            HttpSession session = req.getSession();
            try {
                boolean isUpdated = dao.updateAppointment(appointment);

                if (isUpdated) {
                    session.setAttribute("succMsg", "Appointment Rescheduled successfully");
                    resp.sendRedirect("consultantdashboard.jsp");
                } else {
                    session.setAttribute("errorMsg", "Something went wrong on the server");
                    resp.sendRedirect("rescheduleAppointment.jsp");
                }
            } catch (Exception e) {
                // Print the exception details for debugging
                e.printStackTrace();
                // You can also set an error message for the user or take appropriate action
                session.setAttribute("errorMsg", "An error occurred while rescheduling the appointment");
                resp.sendRedirect("rescheduleAppointment.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}