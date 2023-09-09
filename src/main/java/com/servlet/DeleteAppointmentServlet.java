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
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/DeleteAppointmentServlet")
public class DeleteAppointmentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            int id = Integer.parseInt(req.getParameter("id"));
            Connection conn = dbconnect.getConn();
            AppointmentDao dao = new AppointmentDao(conn);

            // Perform the delete operation here by passing the ID
            boolean isDeleted = dao.deleteAppointmentById(id);

            HttpSession session = req.getSession();

            if (isDeleted) {
                session.setAttribute("succMsg", "Appointment Deleted successfully");
                resp.sendRedirect("admindashboard.jsp");
            } else {
                session.setAttribute("errorMsg", "Something went wrong on the server");
                resp.sendRedirect("appointmentDeletion.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
