package com.servlet;

import com.dao.AppointmentDao;
import com.db.dbconnect;
import com.entity.Appointment;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;


@WebServlet("/CreateAppointmentServlet")
public class CreateAppointmentServlet extends HttpServlet {

private static final Logger logger = Logger.getLogger(CreateAppointmentServlet.class.getName());


    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        try {

            int consultant_id = Integer.parseInt(request.getParameter("consultant_id"));
            int jobseeker_id = Integer.parseInt( request.getParameter("jobseeker_id"));
            String appointment_datetime = request.getParameter("appointment_date") + 'T' + request.getParameter("appointment_time");
            
            HttpSession session = request.getSession();
            Appointment c = new Appointment(consultant_id, jobseeker_id,
                    appointment_datetime);
            AppointmentDao dao = new AppointmentDao(dbconnect.getConn());
            boolean f = dao.registerAppointment(
                    c);
            if (f) {
                session.setAttribute("sucMsg",
                        "Register Sucessfully");
                response.sendRedirect("admindashboard.jsp");
            } else {
                session.setAttribute("errorMsg",
                        "invalid email & password");
                response.sendRedirect("createAppointment.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
