<%-- 
    Document   : ConsultantSignUp.jsp
    Created on : 10-Aug-2023, 18:28:53
    Author     : Jude Shalon
--%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Iterator"%>

<%@page import="com.db.dbconnect"%>
<%@page import="com.entity.Appointment"%>
<%@page import="com.dao.AppointmentDao"%>
<%@page import="com.entity.Jobseeker"%>
<%@page import="com.dao.JobSeekerDao"%>
<%@page import="com.entity.Consultant"%>
<%@page import="com.dao.ConsultantDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Consultant DashBoard | Edit Appointment</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            /* -------------- NAV BAR STYLE ---------------- */


            .container_1 {
                max-width: 1200px;
                margin: 0 auto;

            }
            .navbar {
                background-color: white;
                overflow: hidden;
                padding: 0px 0px;

                display: flex; /* Add this line to use flexbox */
                justify-content: flex-end; /* Align items to the left side */
                align-items: center;

            }
            .navbar a {

                display:block;
                color: black;
                text-align: center;
                padding: 16px 12px;
                text-decoration: none;

            }
            .navbar a:hover {
                background-color: #ddd;
                color: black;
            }



            .login-button:hover {
                background-color: #b62d23;
            }



            /* Set a style for all buttons */
            button {


                float: right;
                background-color: #b62d23;
                color: white;
                border: none;
                border-radius:12px;
                padding: 10px 20px;
                margin: 14px 16px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 14px;
                cursor: pointer;

            }
            button {

                color: white;
                border: none;
                padding: 9px 20px;
                border-radius: 5px;
                cursor: pointer;
            }

            button:hover {
                opacity: 0.8;
            }


            /*Style for - Please Login First. Body/.custom-container*/
            .custom-container {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 5vh;
                background-color: seagreen;

            }

            .login-box {
                height: 60px;
                width: 1465px;
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 18px;
                color: white;
                font-family: 'Roboto';
                margin-top: 1px;
            }

            body {
                font-family: Arial, sans-serif;
                background-color: #f8f9fa;
            }
            .container {
                margin-top: 30px;
            }
            .form-container {
                background-color: #fff;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                padding: 40px;
                box-sizing: border-box;
                height: 800px; /* Set the height to 1000px */

            }
            .table-container {
                margin-top: 30px;
            }
            .table {
                width: 100%;
                border-collapse: collapse;
            }
            .table th,
            .table td {
                border: 1px solid #ccc;
                padding: 5px;
                text-align: center;
            }

            /* Make specified mandatory labels red */
            label[for="email"]:after,
            label[for="password"]:after,
            label[for="experience"]:after,
            label[for="cvUpload"]:after {
                content: "*";
                color: red;
                margin-right: 5px;
            }
            .btn-submit {
                background-color: seagreen;
                color: white;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                margin: 10px auto; /* Center the button horizontally */
                display: block; /* Make the button a block element for margin auto to work */
                cursor: pointer;
                width: 30%;
                position: absolute; /* Position absolutely within the container */
                left: 50%; /* Move to the horizontal center */
                transform: translateX(-50%); /* Adjust to center the button */
                button:hover {
                    opacity: 0.8;
                }
            }

            .search-countries {
                width: 100%;
                padding: 10px;
                box-sizing: border-box;
            }


            .form-link {
                text-decoration: none;
                color: blue;
            }


            /*Style for - FogotPassword-button. Body/..form-link-button*/
            .form-link-button {
                background-color: white;
                color: black;
                border: none;
                cursor: pointer;
                text-align: center;
                width: 30%;
                margin:0 auto;
                margin: 10px auto; /* Center the button horizontally */
                display: block; /* Make the button a block element for margin auto to work */
                cursor: pointer;
                margin-top: -350px;

                position: absolute; /* Position absolutely within the container */
                left: 50%; /* Move to the horizontal center */
                transform: translateX(-50%); /* Adjust to center the button */

            }


            .create-account-button
            {

                padding: 10px 20px;
                margin: 10px 0;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 14px;
                cursor: pointer;
                width: 30%;

            }

            .create-account-button {
                color: #28a745;
                border: 2px solid #28a745;
                border-radius: 5px;
                cursor: pointer;
                color: darkcyan;
                margin-top: 10px;
                background-color: white;
                margin-top: -300px;

                position: absolute; /* Position absolutely within the container */
                left: 50%; /* Move to the horizontal center */
                transform: translateX(-50%); /* Adjust to center the button */

            }

            .form-container{
                margin: auto;
                width:70%
            }

            .field-container{
                margin-top: 20px;
            }

            .select-style{
                padding: 8px;
                width: 100%;

            }


        </style>
    </head>
    <body>


        <div class="navbar">
            <a href="consultantdashboard.jsp">Go to Consultant Dashboard</a>

        </div>


        <div class="custom-container">
            <div class="login-box">
                Update Appointment Account
            </div>
        </div>

        <%
            int id = 0;
            if (request.getParameter("id") != null) {
                id = Integer.parseInt(request.getParameter("id"));
            }
            AppointmentDao appointmentDao = new AppointmentDao(dbconnect.getConn());
            Appointment appointment = appointmentDao.getAppointmentById(id);

            String appointmentDateTime = appointment.getAppointment_datetime();

            String appointmentDate = appointmentDateTime.split(" ", 2)[0];
            String appointmentTime = appointmentDateTime.split(" ", 2)[1];

            SimpleDateFormat inputFormat = new SimpleDateFormat("HH:mm:ss");
            SimpleDateFormat outputFormat = new SimpleDateFormat("HH:mm");

            Date date = inputFormat.parse(appointmentTime);
            String formattedTime = outputFormat.format(date);

        %>
        <div class="form-container" >
            <form class="row g-3 ">
                <div class="col-md-6 field-container" action="AppointmentRescheduleServlet" method="post">
                    <label class="form-label">Consultant</label>
                    <div class="dropdown">
                        <select id="consultant_id" name="consultant_id" class="form-select select-style" disabled>
                            <%  ConsultantDao consultantDao = new ConsultantDao(dbconnect.getConn());
                                List<Consultant> consultants = consultantDao.getAllConsultant();
                                Consultant selectedConsultant = null;

                                String selectedConsultantId = Integer.toString(appointment.getConsultant_id());
                                for (Consultant consultant : consultants) {
                                    String consultantId = Integer.toString(consultant.getId());

                                    if (consultantId.equals(selectedConsultantId)) { // Use 'equals' to compare strings
                                        selectedConsultant = consultant;
                                        break;
                                    }
                                }

                                Iterator<Consultant> iterator = consultants.iterator();

                                while (iterator.hasNext()) {
                                    Consultant consultant = iterator.next();

                                    if (consultant.getId() == selectedConsultant.getId()) {
                                        iterator.remove();
                                        break;
                                    }
                                }
                            %>
                            <option value="<%=selectedConsultant.getId()%>"><%= selectedConsultant.getId()%>  &nbsp; <%=selectedConsultant.getFname()%> <%=selectedConsultant.getLname()%></option>
                            <%
                                for (Consultant consultant : consultants) {
                            %>
                            <option value="<%=consultant.getId()%>"><%= consultant.getId()%>  &nbsp; <%=consultant.getFname()%> <%=consultant.getLname()%></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                </div>
                <div class="col-md-6 field-container">
                    <label class="form-label">Job Seeker</label>
                    <div class="dropdown">
                        <select id="jobseeker_id" name="jobseeker_id" class="form-select select-style" disabled>
                            <%
                                JobSeekerDao jobseekerDao = new JobSeekerDao(dbconnect.getConn());
                                List<Jobseeker> jobseekers = jobseekerDao.getAllJobseekers();
                                Jobseeker selectedJobseeker = null;

                                String selectedJobseekerId = Integer.toString(appointment.getJobseeker_id());
                                for (Jobseeker jobseeker : jobseekers) {
                                    String jobseekerId = Integer.toString(jobseeker.getId());

                                    if (jobseekerId.equals(selectedJobseekerId)) { // Use 'equals' to compare strings
                                        selectedJobseeker = jobseeker;
                                        break;
                                    }
                                }
                                Iterator<Jobseeker> jobseekeriterator = jobseekers.iterator();

                                while (jobseekeriterator.hasNext()) {
                                    Jobseeker jobseeker = jobseekeriterator.next();

                                    if (jobseeker.getId() == selectedJobseeker.getId()) {
                                        jobseekeriterator.remove();
                                        break;
                                    }
                                }
                            %>
                            <option value="<%=selectedJobseeker.getId()%>"><%= selectedJobseeker.getId()%>  &nbsp; <%=selectedJobseeker.getFname()%> <%=selectedJobseeker.getLname()%></option>
                            <%
                                for (Jobseeker jobseeker : jobseekers) {
                            %>
                            <option value="<%=jobseeker.getId()%>"><%= jobseeker.getId()%>  &nbsp; <%=jobseeker.getFname()%> <%=jobseeker.getLname()%></option>
                            <%
                                }
                            %>                
                        </select>
                    </div>
                </div>
                <div class="col-6 field-container">
                    <label class="form-label">Appointment Date</label>
                    <input type="date" value="<%=appointmentDate%>"  name="appointment_date" class="form-control" id="appointment_date" placeholder="Select Appointment Date">
                </div>
                <div class="col-6 field-container">
                    <label class="form-label">Appointment Time</label>
                    <input type="time" value="<%=appointmentTime%>"  name="appointment_time" class="form-control" id="appointment_time" placeholder="Select Appointment Time">
                </div>
                <div class="col-12 field-container">
                    <button type="button" onclick="onSubmit();" class="btn  btn-primary">Update</button>
                </div>
            </form>
        </div>


        <script>
            function onSubmit() {
                var consultantElement = document.getElementById("consultant_id");
                var jobSeekerElement = document.getElementById("jobseeker_id");
                var appointmentDateElement = document.getElementById("appointment_date");
                var appointmentTimeElement = document.getElementById("appointment_time");

                var consultant_id = consultantElement.value;
                var jobseeker_id = jobSeekerElement.value;
                var appointment_date = appointmentDateElement.value;
                var appointment_time = appointmentTimeElement.value;

                var data = {
                    consultant_id,
                    jobseeker_id,
                    appointment_date,
                    appointment_time
                };

                var jsonData = JSON.stringify(data);

                var xhr = new XMLHttpRequest();

                xhr.open("POST", "/JobsCeylon_Appointment_Scheduling/RescheduleAppointmentServlet", true);
                xhr.setRequestHeader("Content-Type", "application/json");

                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        // Handle the response here
                        var response = xhr.responseText;
                        console.log("Response from server:", response);
                    }
                };

                xhr.send(jsonData);

            }
        </script>



    </body>
</html>
