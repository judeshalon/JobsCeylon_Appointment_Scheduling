<%-- 
    Document   : multiuserlogin
    Created on : 22-Aug-2023, 02:15:00
    Author     : Joy Chuzana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Job Ceylon | Admin Login</title>
        <%@ include file="header.jsp"%>

        <style>
            /*Style for - Login Form and Sign Up Buttons */
            input[type="email"],
            input[type="password"] {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 10px;
                box-sizing: border-box;
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
                width: 100%;
            }
            .create-account-button {
                color: #28a745;
                border: 2px solid #28a745;
                border-radius: 5px;
                cursor: pointer;
                color: darkcyan;
                margin-top: 10px;
                background-color: white;
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
            }
            /*Style for - MultiUser-Login. Body/.MultiUser-Login*/
            .MultiUser-Login {
                font-family: 'Roboto', sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .form-container {
                margin-bottom:10%;
                background-color: white;
                width: 30%;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .form-group {
                margin-bottom: 15px;
            }
            .form-label {
                display: block;
                font-weight: bold;
                margin-bottom: 5px;
            }
            .form-input {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 3px;
            }
            .form-button {
                background-color: lightseagreen;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 3px;
                cursor: pointer;
                text-align: center;
                width: 90%;
            }
            .form-link {
                text-decoration: none;
                color: blue;
            }

            /*Style for - FogotPassword-button. Body/..form-link-button*/
            .form-link-button {
                text-decoration: none;
                background-color: transparent;
                color: blue;
                padding: 10px 145px;
                border: none;
                border-radius: 3px;
                cursor: pointer;
                text-align: center;
                width: 90%;
                font-family:"poppins";
            }

            /* Style for the dialog box */
            #dialog {
                display: none;
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                padding: 15px;
                border-radius: 5px;
                font-weight: bold;
                text-align: center;
                width: 300px;
            }
            .success {
                background-color: #28a745; /* Green background color for success message */
                color: white;
            }
            .error {
                background-color: red; /* Red background color for error message */
                color: white;
            }
            #dialog {
                display: none;
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                padding: 15px;
                border-radius: 5px;
                font-weight: bold;
                text-align: center;
                width: 300px;
            }
            .success {
                background-color: #28a745; /* Green background color for success message */
                color: white;
            }
            .error {
                background-color: red; /* Red background color for error message */
                color: white;
            }
        </style>

        <script>
            function showMessage(message, isError) {
                var dialog = document.getElementById("dialog");
                dialog.innerHTML = message;
                dialog.className = isError ? "error" : "success";
                dialog.style.display = "block";
            }

            function hideMessage() {
                var dialog = document.getElementById("dialog");
                dialog.style.display = "none";
            }

            function handleLogin() {
                // Replace this with your actual validation logic.
                // For demonstration purposes, we're assuming the login always fails here.
                var email = document.getElementById("email").value;
                var password = document.getElementById("password").value;
                var expectedEmail = "admin@gmail.com";
                var expectedPassword = "1234";

                if (email === expectedEmail && password === expectedPassword) {
                    showMessage("Successfully logged in as admin", false); // Success message

                    setTimeout(redirectToNextPage, 2000); // Redirect after 2 seconds (2000 milliseconds)
                    return true; // Proceed with form submission
                } else {
                    showMessage("Login failed. Please check your credentials.", true); // Error message
                    return false; // Prevent form submission
                }
            }
        </script>
    </head>
    <body>
        <div class="custom-container">
            <div class="login-box">
                Please login as Admin
            </div>
        </div>

        <div class="MultiUser-Login">
            <div class="form-container">
                <form action="Adminservlet" method="post" onsubmit="return handleLogin();">
                    <div class="form-group">
                        <label class="form-label" for="email">E-mail:</label>
                        <input class="form-input" type="email" id="email" name="email" required>
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="password">Password:</label>
                        <input class="form-input" type="password" id="password" name="password" required>
                    </div>

                    <button class="form-button" type="submit">Login</button><br>
                    <a class="form-link-button" href="multiuserlogin.jsp">Back </a>
                </form>
            </div>
        </div>

        <div id="dialog" style="display: none;"></div>
    </body>
</html>