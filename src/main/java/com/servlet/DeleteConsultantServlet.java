package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ConsultantDao;
import com.db.dbconnect;
import com.entity.Consultant;

@WebServlet("/DeleteConsultantServlet")
public class DeleteConsultantServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            int id = Integer.parseInt(req.getParameter("id")); // Retrieve the Consultant ID to be deleted

            ConsultantDao dao = new ConsultantDao(dbconnect.getConn());
            
            HttpSession session = req.getSession();
            try {
                boolean isDeleted = dao.deleteConsultantById(id); // Call the DAO method to delete the Consultant by ID

                if (isDeleted) {
                    session.setAttribute("succMsg", "Consultant Deleted successfully");
                    resp.sendRedirect("admindashboard.jsp");
                } else {
                    session.setAttribute("errorMsg", "Something went wrong on the server");
                    resp.sendRedirect("deleteConsultant.jsp");
                }
            } catch (Exception e) {
                // Print the exception details for debugging
                e.printStackTrace();
                // You can also set an error message for the user or take appropriate action
                session.setAttribute("errorMsg", "An error occurred while deleting the consultant");
                resp.sendRedirect("deleteConsultant.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
