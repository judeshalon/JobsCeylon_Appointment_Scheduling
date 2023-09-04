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
        <title>Job Ceylon | Multi-User Login</title>
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

        </style>
    </head>
    <body>
        <div class="custom-container">
            <div class="login-box">
                Please login first
            </div>
        </div>

        <div class="MultiUser-Login">
            <div class="form-container">
                <form>

                    <button class="create-account-button" type="button" onclick="window.location.href = 'adminlogin.jsp';">Log In Account - Admin</button>
                    <button class="create-account-button" type="button" onclick="window.location.href = 'consultantlogin.jsp';">Log In Account - Consultant</button>
                    <button class="create-account-button" type="button" onclick="window.location.href = 'jobseekerlogin.jsp';">Log In Account - Job Seeker</button>
                </form>
            </div>
        </div>




    </body>
</html>

