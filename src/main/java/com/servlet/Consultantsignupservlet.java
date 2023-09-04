package com.servlet;

import com.dao.ConsultantDao;
import com.db.dbconnect;
import com.entity.Consultant;
import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Consultantsignupservlet")
public class Consultantsignupservlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            
            HttpServletResponse response) throws ServletException, IOException {
        try{
        String firstName = request.getParameter("fname");
        String lastName = request.getParameter("lname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phoneNumber = request.getParameter("phone");
        String SpecializedCountries = request.getParameter(
                "specializedCountries");
        String workingPeriod = request.getParameter("workingPeriod");
HttpSession session = request.getSession();
                Consultant c = new Consultant(firstName, lastName, 
                        email, password, phoneNumber, SpecializedCountries, 
                        workingPeriod);
		ConsultantDao dao = new ConsultantDao(dbconnect.getConn());
                			boolean f = dao.registerConsultant(
                                                c);
		if (f) {
			session.setAttribute("sucMsg", 
                                "Register Sucessfully");
				response.sendRedirect("index.html");
		} else {
			session.setAttribute("errorMsg", 
                                "invalid email & password");
			response.sendRedirect("consultantsignup.jsp");
		}
    }catch (Exception e) {
			e.printStackTrace();
		}

    }
}
