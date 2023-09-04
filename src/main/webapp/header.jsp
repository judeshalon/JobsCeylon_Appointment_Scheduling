<%-- 
    Document   : header
    Created on : 21-Aug-2023, 23:54:23
    Author     : Joy Chuzana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Jobs Ceylon </title>
            <style>
                body {
                    font-family: Arial, sans-serif;
                    margin: 0;
                    padding: 0;
                    background-color: #f7f9fb;
                }
                header {
                    background-color: #007bff;
                    color: white;
                    padding: 10px;
                    text-align: center;
                }
                .container {
                    max-width: 1200px;
                    margin: 0 auto;
                    padding: 20px;
                }
                .navbar {
                    background-color: white;
                    overflow: hidden;
                }
                .navbar a {
                    float: right;
                    display: block;
                    color: black;
                    text-align: center;
                    padding: 25px 13px;
                    text-decoration: none
                }
                .navbar a:hover {
                    background-color: #ddd;
                    color: black;
                }

                footer {
                    text-align: center;
                    padding: 10px;
                    background-color: #333;
                    color: white;
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

                button:hover {
                    opacity: 0.8;
                }

                button {
                    background-color: #b62d23;
                    color: white;
                    border: none;
                    padding: 10px 20px;
                    border-radius: 5px;
                    cursor: pointer;
                }

            </style>

        </style>
    </head>
    <body>
        <div class="navbar">
            <button onclick="redirectToMultiUserLogin()" style="width:auto;">Register/SignIn</button>

            <script>
                function redirectToMultiUserLogin() {
                    window.location.href = 'multiuserlogin.jsp';
                }
            </script>

            <a href="">About Us</a>
            <a href="home.jsp">Home</a>  
        </div>
    </div>
</body>

</html>
