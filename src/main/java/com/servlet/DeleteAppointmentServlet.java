package com.servlet;

import com.dao.AppointmentDao;
import com.db.dbconnect;
import com.entity.Appointment;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/DeleteAppointmentServlet")
public class DeleteAppointmentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            int id = Integer.parseInt(req.getParameter("id"));
            AppointmentDao dao = new AppointmentDao(dbconnect.getConn());

            // Perform the delete operation here by passing the ID
            boolean isDeleted = dao.deleteAppointmentById(id);

            HttpSession session = req.getSession();
            if (isDeleted) {
                session.setAttribute("succMsg", "Appointment Deleted successfully");
                resp.sendRedirect("admindashboard.jsp");
            } else {
                session.setAttribute("errorMsg", "Something went wrong on the server");
                resp.sendRedirect("appointmentCancel.jsp"); // Corrected the JSP page name
            }
        }catch (Exception e) {
            e.printStackTrace();
            HttpSession session = req.getSession();
            session.setAttribute("errorMsg", "An error occurred while processing your request");
            resp.sendRedirect("appointmentCancel.jsp"); // Corrected the JSP page name
        }
        // Corrected the JSP page name
        
    }
}
