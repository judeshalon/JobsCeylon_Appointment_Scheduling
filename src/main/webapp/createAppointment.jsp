<%-- 
    Document   : ConsultantSignUp.jsp
    Created on : 10-Aug-2023, 18:28:53
    Author     : Jude Shalon
--%>

<%@page import="com.entity.Jobseeker"%>
<%@page import="com.dao.JobSeekerDao"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Consultant"%>
<%@page import="com.dao.ConsultantDao"%>
<%@page import="com.db.dbconnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>MultiUserLogin | Appointment Create Page</title>
        <link rel="stylesheet" 
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <!-- Include Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <!-- Include jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <!-- Include Bootstrap JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.5.2/dist/js/bootstrap.min.js"></script>

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
                margin-top: 40px;
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
            .btn-submit {
                background-color: lightseagreen;
                margin-top: 150px;

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
                display: block; /* Make button a block element for margin auto to work */
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

                .dropdown {
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    height: 100vh; /* Adjust the height as needed */
                }

                /* Optional styling for the select element */
                #dropdown {
                    width: 200px; /* Set the width as needed */
                }

            }

            table {
                width: 100%;
                border-collapse: separate;
                border-spacing: 10px; /* Adjust the spacing as needed */
            }

            /* Style for table cells (td) */
            td {
                padding: 10px; /* Adjust the padding as needed */
            }

            /* Default style for the dropdown */
            #consultantDropdown {
                background-color: white; /* Default background color */
                color: black; /* Default text color */
            }

            /* Style for "Conform" option */
            #consultantDropdown option[value="conform"] {
                color: green; /* White text color for "Conform" */
            }

            /* Style for "Pending" option */
            #consultantDropdown option[value="pending"] {
                color: darkorange; /* White text color for "Pending" */
            }

        </style>

    </head>
    <body>

        <div class="navbar">
            <a href="admindashboard.jsp">Go to Admin Dashboard</a>

        </div>



        <div class="custom-container">
            <div class="login-box">
                Create a Appointment Account
            </div>
        </div>


        <div class="container form-container">
            <h1 class="text-center"></h1>
            <form id="createAppointment" action="CreateAppointmentServlet" method="post" >
                <table border="0" align="center">
                    <!-- First Row -->
                    <tr>
                        <td>
                            <label for="fname"><b>Consultants</b></label>
                        </td>
                        <td>
                            <div class="dropdown">
                                <select id="consultant_id" name="consultant_id">
                                    <option>Select Consultant</option>
                                    <%
                                        ConsultantDao dao2 = new ConsultantDao(dbconnect.getConn());
                                        List<Consultant> list2 = dao2.getAllConsultant();
                                        for (Consultant d : list2) {
                                    %>

                                    <option value="<%=d.getId()%>"><%=d.getId()%>  &nbsp; <%=d.getFname()%> <%=d.getLname()%></option>
                                    <%
                                            log(d.getFname());
                                        }
                                    %>
                                </select>
                            </div>


                            </div>
                        </td>
                        <td>
                            <label for="lname"><b>Job Seekers</b></label>
                        </td>
                        <td>
                            <div class="dropdown">
                                <select id="jobseeker_id" name="jobseeker_id">

                                    <option>Select Job Seeker</option>                                    
                                    <%
                                        JobSeekerDao dao3 = new JobSeekerDao(dbconnect.getConn());
                                        List<Jobseeker> jobseekers = dao3.getAllJobseekers();
                                        for (Jobseeker jobseeker : jobseekers) {
                                    %>


                                    <option value="<%=jobseeker.getId()%>"><%= jobseeker.getId()%>  &nbsp; <%=jobseeker.getFname()%> <%=jobseeker.getLname()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            </div>
                        </td>
                    </tr>
                    <!-- Second Row -->
                    <tr>
                        <td>
                            <label for="appointment_date"><b>Appointment Date</b></label>
                        </td>
                        <td>
                            <input type="date" name="appointment_date" class="form-control" id="appointmentDate" placeholder="Select Appointment Date">
                            <small id="appointmentDate_alert"></small>
                        </td>
                        <td>
                            <label for=">appointmentTime"><b>Appointment Time</b></label>
                        </td>
                        <td>
                            <input type="time" name="appointment_time" class="form-control" id="appointmentTime" placeholder="Select Appointment Time">
                            <small id="appointmentTime_alert"></small>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button type="submit" class="btn-submit">Create</button>
                        </td>
                    </tr>
                </table>

            </form>
            <br><br>
            <br>


            <br><br>
        </div>


        <script>
            function showFormData(event) {
                event.preventDefault(); // Prevent the form from actually submitting

                // Get the form element
                var form = document.getElementById("createAppointment");

                // Create a new FormData object to capture form data
                var formData = new FormData(form);

                // Prepare the data for display
                var formDataText = "Form Data:\n";
                for (var pair of formData.entries()) {
                    formDataText += pair[0] + ": " + pair[1] + "\n";
                }

                // Display the form data on the page
                var formDataDisplay = document.getElementById("formData");

                console.log(formDataDisplay)
                alert(formDataDisplay);
            }
        </script>



    </body>
</html>