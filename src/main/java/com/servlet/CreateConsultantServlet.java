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

@WebServlet("/CreateConsultantServlet")
public class CreateConsultantServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {

        try {  
            System.out.println(1);
            String fname = req.getParameter("fname");
            String lname = req.getParameter("lname");
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            String phoneNumber = req.getParameter("phoneNumber");
            String specializedCountries = req.getParameter(
                    "SpecializedCountries");
            String workingPeriod = req.getParameter("workingPeriod");
            
            Consultant consultant = new Consultant(fname,lname,email,password,
            phoneNumber,specializedCountries,workingPeriod);         
          
            
            ConsultantDao dao = new ConsultantDao(dbconnect.getConn());
            
            HttpSession session = req.getSession();
            try {
                boolean isCreated = dao.registerConsultant(consultant);

                if (isCreated) {
                    session.setAttribute("succMsg", 
                            "Consultant Created sucessfully");
                    resp.sendRedirect("admindashboard.jsp");
                } else {
                    session.setAttribute("errorMsg", 
                            "Something wrong on server");
                    resp.sendRedirect("editconsultant.jsp");
                }
            } catch (Exception e) {
                // Print the exception details for debugging
                e.printStackTrace();
                // You can also set an error message for 
                // the user or take appropriate action
                session.setAttribute("errorMsg", 
                        "An error occurred while updating the consultant");
                resp.sendRedirect("editconsultant.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
