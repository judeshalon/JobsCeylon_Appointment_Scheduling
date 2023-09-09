<%@page import="com.entity.Appointment"%>
<%@page import="com.dao.AppointmentDao"%>
<%@page import="com.entity.Admin"%>
<%@page import="com.dao.AdminDao"%>
<%@page import="com.dao.JobSeekerDao"%>
<%@page import="com.entity.Jobseeker"%>

<%@page import="java.util.List"%>
<%@page import="com.entity.Consultant"%>
<%@page import="com.dao.ConsultantDao"%>
<%@page import="com.db.dbconnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Jobs Ceylon - Job Seeker DashBoard </title>
        <style>
            /* Global Styles */
            body {
                font-family: Arial, sans-serif;
                background-color: #f8f9fa;
                margin: 0;
                padding: 0;
            }
            /* Header Styles */
            header {
                background-color: lightseagreen;
                color: #fff;
                text-align: center;
                padding: 6px 0;
            }
            /* Navbar Styles */
            .navbar {
                background-color: white;
                overflow: hidden;
                padding: 70px 0px;
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                border: 1px solid #ddd;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                margin:  0.7px 1px;
            }
            .navbar ul {
                list-style-type: none;
                margin: 0;
                padding: 0;
            }
            .navbar li {
                width: 100%;
                margin-bottom: 2px; /* Add a small space between links */
            }
            .navbar a {
                display: block;
                background-color: #f1f1f1;
                color: seagreen;
                text-align: left;
                padding: 15px;
                text-decoration: none;
                border-radius: 5px;
                transition: background-color 0.3s ease-in-out;
                font-weight: bold;
            }
            .navbar a:hover {
                background-color: #ddd;
                color: black;
            }
            /* Main Content Styles */
            .main-content {
                max-width: 1200px;
                margin: 5px;
                padding: 20px;
                background-color: #fff;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                border-radius: 5px;
            }
            .section {
                margin-top: 250px;
                margin-left: 20%;
            }
            h2 {
                margin-top: -45%;
            }

            /* User Table Styles */
            .user-table {
                flex: 1;
                background-color: #fff;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                border-radius: 5px;
                padding: 20px;
                margin-right: 02px;
                margin-left: 05px;
                margin-top:  -10px;


            }
            .user-table table {
                width: 95%;
                border-collapse: collapse;
            }
            .user-table th, .user-table td {
                padding: 12px;
                border: 1px solid #ddd;

                .flex-container.reverse {
                    display: flex;
                    align-items: flex-start;
                    justify-content: space-between;
                    flex-direction: row-reverse; /* Reverse the direction */
                }

                .section {
                    display: none;
                }



                /* --------------- style for userprofile and security nav tag ------------ */
                .user-table table {
                    width: 100%;
                    border-collapse: collapse;
                    margin-top: 15px;
                }

                .user-table table th,
                .user-table table td {
                    padding: 10px;
                    border: 1px solid #ccc;
                }

                .user-table label {
                    font-weight: bold;
                }

                .user-table input[type="text"],
                .user-table input[type="email"],
                .user-table input[type="tel"],
                .user-table input[type="password"] {
                    width: 100%;
                    padding: 8px;
                    border: 1px solid #ccc;
                    border-radius: 5px;
                    box-sizing: border-box;
                }

                .user-table button {
                    background-color: #3498db;
                    color: white;
                    padding: 10px 20px;
                    border: none;
                    border-radius: 5px;
                    cursor: pointer;
                    font-weight: bold;
                    margin-top: 15px;
                    transition: background-color 0.3s ease-in-out;
                }

                .user-table button:hover {
                    background-color: #2980b9;

                }

                /* ---------- Help Contact nav ---------- */
                /* Additional styles for Help and Support section */
                .help-content {
                    margin-top: 20px;
                    padding: 20px;
                    background-color: #f7f7f7;
                    border-radius: 5px;
                    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                }

                .help-content h3 {
                    margin-top: 0;
                    padding-bottom: 10px;
                    border-bottom: 1px solid #ddd;
                    color: #333;
                }

                .help-content p {
                    font-size: 16px;
                    line-height: 1.6;
                    color: #555;
                }

                .help-content a {
                    color: #3498db;
                    text-decoration: none;
                }

                .help-content ul {
                    list-style-type: disc;
                    margin-left: 20px;
                    padding-left: 15px;
                }

                .help-content li {
                    font-size: 16px;
                    line-height: 1.6;
                    color: #555;
                    margin-bottom: 5px;
                }

                /* Style for the button container */
                .button-container {
                    display: flex;
                    justify-content: flex-end;
                    margin-bottom: 10px;

                }

                /* Style for the button */
                #add-consultant-btn {
                    background-color: #007bff;
                    color: #ffffff;
                    border: none;
                    padding: 8px 16px;
                    border-radius: 4px;
                    cursor: pointer;
                    transition: background-color 0.3s ease;
                }

                #add-consultant-btn:hover {
                    background-color: #0056b3;
                }


            }
            /* Add more CSS styling here */
        </style>
    </head>
    <body>
        <header>
            <%
                Jobseeker jobseeker = (Jobseeker) session.getAttribute("userObj");

            %>
            <h1>Welcome to The Jobs Ceylon - Job Seeker - <%=jobseeker.getFname() + ' ' + jobseeker.getLname()%></h1>
        </header>
        <div class="flex-container reverse">
            <div class="navbar">
                <nav>
                    <ul>
                        <li><a href="javascript:void(0);" onclick="toggleSection('dashboard')">Dashboard</a></li>
                        <li><a href="javascript:void(0);" onclick="toggleSection('profile')">Profile </a></li >
                        <li><a href="javascript:void(0);" onclick="toggleSection('appointments')">Appointments</a></li>
                        <li><a href="multiuserlogin.jsp">Log Out</a></li>
                    </ul>
                </nav>
            </div>

            <!<!-- DASHBOARD -->
            <section class="section" id="dashboard">
                <div class="flex-container">
                    <div class="user-table">

                    </div>
                </div>
            </section>


            <!<!-- PROFILE -->
            <section class="section" id="profile">
                <h2>Job Seeker Details</h2>
                <div class="flex-container">
                    <div class="user-table">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">First Name</th>
                                    <th scope="col">Last Name</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Password</th>
                                    <th scope="col">Phone Number</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Server-side scripting starts here -->

                                <tr>
                                    <td><%= jobseeker.getFname()%></td>
                                    <td><%= jobseeker.getLname()%></td>
                                    <td><%= jobseeker.getEmail()%></td>
                                    <td><%= jobseeker.getPassword()%></td>
                                    <td><%= jobseeker.getPhoneNumber()%></td>
                                    <td>
                                        <a href="jobseekerEdit.jsp?id=<%= jobseeker.getId()%>"
                                           class="btn btn-sm btn-primary">Edit</a>
                                    </td>
                                </tr>

                            </tbody>
                        </table>

                    </div>
                </div>
            </section>
            <script>
                // Function to add a new row to the table
                function addNewRow() {
                    const tableBody = document.querySelector('#consultant-details tbody');

                    // Create a new row element
                    const newRow = document.createElement('tr');
                    newRow.innerHTML = `
                        <td>New ID</td>
                        <td>New Name</td>
                        <td>New Country</td>
                        <td>New Job</td>
                        <td>New Availability</td>
                        <td>
                            <a href="#">View</a> |
                            <a href="#">Edit</a> |
                            <a href="#">Update</a> |
                            <a href="#">Delete</a>
                        </td>
                    `;

                    // Append the new row to the table
                    tableBody.appendChild(newRow);
                }

                // Attach event listener to the "Add Consultant" button
                const addConsultantButton = document.querySelector('#add-consultant-btn');
                addConsultantButton.addEventListener('click', addNewRow);
            </script>            


            <!<!-- APPOINTMENTS -->
            <section class="section" id="appointments">
                <h2>Appointment Details</h2>
                <div class="flex-container">
                    <div class="user-table">
                        <br><br>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Appointment ID </th>
                                    <th scope="col">Consultant ID</th>
                                    <th scope="col">Job Seeker ID</th>
                                    <th scope="col">Date and Time</th>
                                    <th scope="col">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    AppointmentDao dao = new AppointmentDao(dbconnect.getConn());
                                    List<Appointment> appointmentList = dao.getAppointmentByJobseekerId(jobseeker.getId());
                                    for (Appointment appointment : appointmentList) {
                                %>
                                <tr>
                                    <td><%= appointment.getId()%></td>
                                    <td><%= appointment.getConsultant_id()%></td>
                                    <td><%= appointment.getJobseeker_id()%></td>
                                    <td><%= appointment.getAppointment_datetime()%></td>
                                    <td>
                                        <a href="jobseekerAppointmentReschedule.jsp?id=<%= appointment.getId()%>"
                                           class="btn btn-sm btn-primary">Rescheduling</a>

                                    </td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </section>


            <script>
                // Function to add a new row to the table
                function addNewRow() {
                    const tableBody = document.querySelector('#jobseeker-details'); // Corrected ID selector

                    // Create a new row element
                    const newRow = document.createElement('tr');
                    newRow.innerHTML = `
                    <td>New ID</td>
                    <td>New Name</td>
                    <td>New Email</td>
                    <td>New Phone</td>
                    <td>New Country</td>
                    <td>New Preferred Consultant</td>
                    <td>
                        <a href="#">View</a> |
                        <a href="#">Edit</a> |
                        <a href="#">Update</a> |
                        <a href="#">Delete</a>
                    </td>
                `;

                    // Append the new row to the table
                    tableBody.appendChild(newRow);
                }

                // Attach event listener to the "Job Seeker" button
                const addJobSeekerButton = document.querySelector('#add-jobseeker-btn');
                addJobSeekerButton.addEventListener('click', addNewRow);
            </script>







            <script>


                function toggleSection(sectionId) {
                    var sections = document.querySelectorAll(".section");
                    sections.forEach(function (section) {
                        if (section.id === sectionId) {
                            section.style.display = "block";
                        } else {
                            section.style.display = "none";
                        }
                    });
                }

                var sections = document.querySelectorAll(".section");
                sections.forEach(function (section) {
                    section.style.display = "none";
                });
            </script>


            <!-- Add more sections for other functionalities -->
        </div>
    </body>
</html>
