<%-- 
    Document   : jobseekersignup
    Created on : 22-Aug-2023, 02:55:30
    Author     : Joy Chuzana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>MultiUserLogin | Job Seeker Signup Page</title>
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
                padding: 60px;
                box-sizing: border-box;
                margin-top: 40px;
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
            label[for="jobseekerId"]:after,
            label[for="email"]:after,
            label[for="password"]:after,
            label[for="interestedCountries"]:after,
            label[for="interestedJobs"]:after
            {
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
                background-color:lightseagreen;

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

                position: absolute; /* Position absolutely within the container */
                left: 50%; /* Move to the horizontal center */
                transform: translateX(-50%); /* Adjust to center the button */

            }




        </style>
    </head>
    <body>


        <div class="navbar">
            <a href="home.jsp">Home</a>
            <a href="">About Us</a>
            <button type="button" onclick="window.location.href = 'multiuserlogin.jsp' style ="width:auto;">Register/SignIn</button>

            <script>
                function redirectToMultiUserLogin() {
                    window.location.href = 'multiuserlogin.jsp';
                }
            </script>

        </div>


        <div class="custom-container">
            <div class="login-box">
                Create a Job Seeker Account
            </div>
        </div>





        <div class="container form-container">
            <h1 class="text-center"></h1>
            <form id="registrationForm" action="Jobseekersignupservlet" method="post">
                <div class="row">
                    <div class="col-md-6 form-group">
                        <label for="fname"><b>First Name</b></label>
                        <input type="text" name="fname" class="form-control" id="fname" placeholder="Enter First Name">
                        <small id="fname_alert"></small>
                    </div>
                    <div class="col-md-6 form-group">
                        <label for="lname"><b>Last Name</b></label>
                        <input type="text"  name="lname" class="form-control" id="lname" placeholder="Enter Last Name">
                        <small id="lname_alert"></small>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 form-group">
                        <label for="email"><b>Email Address</b> </label>
                        <input type="email"  name="email" class="form-control" id="email" placeholder="Enter Email Address">
                        <small id="email_alert"></small>
                    </div>
                    <div class="col-md-6 form-group">
                        <label for="password"><b>Password</b> </label>
                        <input type="password"  name="password" class="form-control" id="password" placeholder="Enter Password">
                        <small id="password_alert"></small>
                    </div>
                </div>

                <div class="row">


                    <div class="col-md-6 form-group">
                        <label for="phoneNumber"><b>Phone Number</b></label>
                        <input type="text" name="phone" class="form-control" id="phoneNumber" placeholder="Enter Phone Number">
                        <small id="phoneNumber_alert"></small>
                    </div>
                </div>
                <div class="col-md-6 form-group">

                </div>



                <div class="row">
                    <div class="col-md-12 form-group">
                        <label style="display: flex; justify-content: center; align-items: center; font-size: 14px;">
                            <input type="checkbox" name="privacyCheckbox" id="privacyCheckbox" style="margin-right: 5px;">
                            <b>  I agree to the Job Ceylon Consultation Center's&nbsp;&nbsp;</b><a href="Privacypolicy.jsp" style="color: seagreen; text-decoration: none;" target="_blank">Privacy Policy</a>
                        </label>
                    </div>
                </div>
                <button type="submit" onclick="GetData();" class="btn-submit">Register</button>

                <br><br>
                <button class="form-link-button" type="button" onclick="window.location.href = 'jobseekerlogin.jsp';">Already have an Account?</button><br>

                <script>
                    function redirectToMultiUserLogin() {
                        window.location.href = 'Home.jsp';
                    }
                </script>
                <br>
                <button class="create-account-button" type="button" onclick="window.location.href = 'consultantsignup.jsp';">Create an Account - Consultant</button>

            </form>
        </div>

    </form>
</div>
<script>
    function validateForm() {
        var email = document.getElementById("email").value;
        var password = document.getElementById("password").value;
        var privacyCheckbox = document.getElementById("privacyCheckbox").checked;
        var isValid = true;

        if (email === "") {
            document.getElementById("email_alert").textContent = "Email is required.";
            document.getElementById("email_alert").style.color = "red";
            isValid = false;
        } else {
            document.getElementById("email_alert").textContent = "";
        }

        if (password === "") {
            document.getElementById("password_alert").textContent = "Password is required.";
            document.getElementById("password_alert").style.color = "red";
            isValid = false;
        } else {
            document.getElementById("password_alert").textContent = "";
        }

        if (!privacyCheckbox) {
            document.getElementById("privacy_alert").textContent = "You must agree to the Privacy Policy.";
            isValid = false;
        } else {
            document.getElementById("privacy_alert").textContent = "";
        }

        return isValid;
    }

    function GetData() {
            console.log("Button clicked!"); // Add this line

        if (validateForm()) {
            // Proceed with registration
            // You can add your registration logic here

            var successMessage = "Job Seeker details saved successfully.";
            var errorMessage = "Failed to save Job Seeker details.";
            var isSuccess = true;

            if (isSuccess) {
                alert(successMessage);
            } else {
                alert(errorMessage);
            }
        }
    }
</script>


</body>
</html>