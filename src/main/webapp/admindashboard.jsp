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
        <title>Jobs Ceylon - Admin </title>
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
            <h1>Welcome to The Jobs Ceylon - Admin</h1>
        </header>
        <div class="flex-container reverse">
            <div class="navbar">
                <nav>
                    <ul>
                        <li><a href="javascript:void(0);" onclick="toggleSection('user-management')">Admin Management</a></li>
                        <li><a href="javascript:void(0);" onclick="toggleSection('consultant-details')"> Consultant Management </a></li >
                        <li><a href="javascript:void(0);" onclick="toggleSection('job-seeker-details')">Job Seeker Management</a></li>
                        <li><a href="javascript:void(0);"onclick="toggleSection('appointment-details')">Appointment Management</a></li>
                        <li><a href="multiuserlogin.jsp">Log Out</a></li>
                    </ul>
                </nav>
            </div>

            <!<!-- ADMIN MANAGEMENT -->
            <section class="section" id="user-management">
                <h2>Admin Details</h2>
                <div class="flex-container">
                    <div class="user-table">
                        <table>
                            <thead>
                                <tr>
                                    <th scope="col">Email</th>
                                    <th scope="col">Password</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Server-side scripting starts here -->
                                <%-- Import necessary classes and objects here --%>
                                <%
                                    // Assuming dao2 is already defined earlier in your code
                                    AdminDao dao4 = new AdminDao(dbconnect.getConn());
                                    List<Admin> adminList = dao4.getAllAdmin();
                                    for (Admin individualAdmin : adminList) {
                                %>
                                <tr>
                                    <td><%= individualAdmin.getEmail()%></td>
                                    <td><%= individualAdmin.getPassword()%></td>

                                </tr>
                                <% } // End of loop %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </section>


            <!<!-- CONSULTANT MANAGEMENT -->
            <section class="section" id="consultant-details">
                <h2>Consultant Details</h2>
                <div class="flex-container">
                    <div class="user-table">
                <a  href="createConsultant.jsp">Add Consultant </a>
                        <br> <br>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">First Name</th>
                                    <th scope="col">Last Name</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Password</th>
                                    <th scope="col">Phone Number</th>
                                    <th scope="col">Specialized Countries</th>
                                    <th scope="col">Working Period</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>

                            <%
                                ConsultantDao dao2 = new ConsultantDao(dbconnect.getConn());
                                List<Consultant> list2 = dao2.getAllConsultant();
                                for (Consultant d : list2) {
                            %>
                            <tr>
                                <td><%=d.getFname()%></td>
                                <td><%=d.getLname()%></td>
                                <td><%=d.getEmail()%></td>
                                <td><%=d.getPassword()%></td>
                                <td><%=d.getPhoneNumber()%></td>
                                <td><%=d.getSpecializedCountries()%></td>
                                <td><%=d.getWorkingPeriod()%></td>
                                <td><a href="editconsultant.jsp?id=<%=d.getId()%>"
                                       class="btn btn-sm btn-primary" >Edit</a> 

                                    <a
                                        href="../deleteConsultant?id=<%=d.getId()%>"
                                        class="btn btn-sm btn-danger">Delete</a></td>
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




            <!<!-- JOB SEEKER MANAGEMENT -->
            <section class="section" id="job-seeker-details">
                <h2>Job Seeker Details</h2>
                <div class="flex-container">
                    <div class="user-table">
                        <div class="button-container">
                            <button id="add-jobseeker-btn" class="add-button">Add Job Seeker</button>
                        </div>
                        <br><br>
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
                                <%-- Import necessary classes and objects here --%>
                                <%
                                    // Assuming dao2 is already defined earlier in your code
                                    JobSeekerDao dao3 = new JobSeekerDao(dbconnect.getConn());
                                    List<Jobseeker> jobseekers = dao3.getAllJobseekers();
                                    for (Jobseeker jobseeker : jobseekers) {
                                %>
                                <tr>
                                    <td><%= jobseeker.getFname()%></td>
                                    <td><%= jobseeker.getLname()%></td>
                                    <td><%= jobseeker.getEmail()%></td>
                                    <td><%= jobseeker.getPassword()%></td>
                                    <td><%= jobseeker.getPhoneNumber()%></td>
                                    <td>
                                        <a href="editjobseeker.jsp?id=<%= jobseeker.getId()%>"
                                           class="btn btn-sm btn-primary">Edit</a>
                                        <a href="../deleteJobseeker?id=<%= jobseeker.getId()%>"
                                           class="btn btn-sm btn-danger">Delete</a>
                                    </td>
                                </tr>
                                <%
                                    } // End of loop
                                %>
                                <!-- Server-side scripting ends here -->
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


            <!<!-- APPOINTMENT MANAGEMENT -->
            <section class="section" id="appointment-details">
                <h2>Appointment Details</h2>
                <div class="flex-container">
                    <div class="user-table">
                <a  href="createConsultant.jsp">Add Consultant </a>
                        <br><br>
                        <table>
                            <thead>
                                <tr>
                                    <th>Appointment ID</th>
                                    <th>Consultant</th>
                                    <th>Job Seeker</th>
                                    <th>Date and Time</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody id="appointment-details"> <!-- Added ID for the tbody element -->
                                <!-- Example appointment data (replace with dynamic data from your backend) -->
                                <tr>
                                    <td>1</td>
                                    <td>John Doe</td>
                                    <td>Jane Smith</td>
                                    <td>2023-08-20 10:00 AM</td>
                                    <td>Confirmed</td>
                                    <td>
                                        <a href="#">Reschedule</a> |
                                        <a href="#">Cancel</a>
                                    </td>
                                </tr>
                                <!-- Add more appointment rows as needed -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </section>

            <script>
                // Function to add a new row to the appointment table
                function addNewAppointment() {
                    const tableBody = document.querySelector('#appointment-details'); // Corrected ID selector

                    // Create a new row element
                    const newRow = document.createElement('tr');
                    <tr>
                <td>New ID</td>
                <td>New Consultant</td>
            <td>New Job Seeker</td>
                <td>New Date and Time</td>
                <td>
            <a href="#">Reschedule</a> |
            <a href="#">Cancel</a>
                </td>
                </tr>

                }

                // Attach event listener to the "Add Appointment" button
                const addAppointmentButton = document.querySelector('#add-appointment-btn');
                addAppointmentButton.addEventListener('click', addNewAppointment);
            </script>



            <section class="section" id="appointment-reports">
                <h2>Appointment Reports and Analytics</h2>
                <div class="flex-container">
                    <div class="user-table">
                        <table>
                            <thead>
                                <tr>
                                    <th>Report ID</th>
                                    <th>Report Name</th>
                                    <th>Description</th>
                                    <th>Generated By</th>
                                    <th>Generated Date</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Example report data (replace with dynamic data from your backend) -->
                                <tr>
                                    <td>1</td>
                                    <td>Consultant Appointments</td>
                                    <td>Shows a list of consultant appointments</td>
                                    <td>Admin - Name</td>
                                    <td>2023-08-15</td>
                                    <td>
                                        <a href="#">Generate</a> |
                                        <a href="#">View</a> |
                                        <a href="#">Download</a> |
                                        <a href="#">Delete</a>
                                    </td>
                                </tr>
                                <!-- Add more report rows as needed -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </section>

            <section class="section" id="communication-tools">
                <h2>Communication and Notification</h2>
                <div class="flex-container">
                    <div class="user-table">
                        <table>
                            <thead>
                                <tr>
                                    <th>Notification ID</th>
                                    <th>Subject</th>
                                    <th>Message</th>
                                    <th>Recipients</th>
                                    <th>Sent Date</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Example notification data (replace with dynamic data from your backend) -->
                                <tr>
                                    <td>1</td>
                                    <td>Important Update</td>
                                    <td>We have scheduled a maintenance for tomorrow.</td>
                                    <td>All Users</td>
                                    <td>2023-08-16</td>
                                    <td>
                                        <a href="#">Send Notification</a> |
                                        <a href="#">View</a> |
                                        <a href="#">Delete</a>
                                    </td>
                                </tr>
                                <!-- Add more notification rows as needed -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </section>

            <section class="section" id="profile-security">
                <h2>User Profile and Security</h2>
                <div class="flex-container">
                    <div class="user-table">
                        <h3>User Profile</h3>
                        <table>
                            <tr>
                                <th><label for="full-name">Admin Id:</label></th>
                                <td><input type="text" id="full-name" name="full-name"></td>
                            </tr>

                            <tr>
                                <th><label for="full-name">Name:</label></th>
                                <td><input type="text" id="full-name" name="full-name"></td>
                            </tr>
                            <tr>
                                <th><label for="email">Email:</label></th>
                                <td><input type="email" id="email" name="email"></td>
                            </tr>
                            <tr>
                                <th><label for="phone">Password:</label></th>
                                <td><input type="tel" id="phone" name="phone"></td>
                            </tr>
                        </table>
                        <button type="submit">Update Profile</button>

                        <h3>Change Password</h3>
                        <table>
                            <tr>
                                <th><label for="current-password">Current Password:</label></th>
                                <td><input type="password" id="current-password" name="current-password"></td>
                            </tr>
                            <tr>
                                <th><label for="new-password">New Password:</label></th>
                                <td><input type="password" id="new-password" name="new-password"></td>
                            </tr>
                            <tr>
                                <th><label for="confirm-password">Confirm Password:</label></th>
                                <td><input type="password" id="confirm-password" name="confirm-password"></td>
                            </tr>
                        </table>
                        <button type="submit">Change Password</button>
                    </div>
                </div>
            </section>

            <section class="section" id="help-support">
                <h2>Help and Support</h2>
                <div class="flex-container">
                    <div class="help-content">
                        <h3>Frequently Asked Questions (FAQ)</h3>
                        <p>Check out our FAQs for answers to common questions:</p>
                        <ul>
                            <li><a href="#">How do I schedule an appointment?</a></li>
                            <li><a href="#">What documents do I need for a consultation?</a></li>
                            <li><a href="#">How can I change my password?</a></li>
                        </ul>

                        <h3>Contact Us</h3>
                        <p>If you need further assistance, you can contact our support team:</p>
                        <ul>
                            <li>Email: <a href="mailto:support@example.com">support@example.com</a></li>
                            <li>Phone: <a href="tel:+1234567890">+1 (234) 567-890</a></li>
                        </ul>
                    </div>
                </div>
            </section>






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
