package com.servlet;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AdminDao;
import com.db.dbconnect;
import com.entity.Admin;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/Adminservlet")
public class Adminservlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            try {
                String email = req.getParameter("email");
                String password = req.getParameter("password");
                HttpSession session = req.getSession();
                AdminDao dao = new AdminDao(dbconnect.getConn());
                Admin admin = dao.login(email, password);
                if (admin != null) {
                    session.setAttribute("userObj", admin);
                    resp.sendRedirect("admindashboard.jsp");
                } else {
                    session.setAttribute("errorMsg", "invalid email & password");
                    resp.sendRedirect("adminlogin.jsp");
                }
            } catch (SQLException ex) {
                Logger.getLogger(Adminservlet.class.getName()).log(Level.SEVERE, null, ex);
            }

	}

}