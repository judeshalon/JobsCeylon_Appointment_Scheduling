<%-- 
    Document   : home.jsp
    Created on : 22-Aug-2023, 00:28:27
    Author     : Joy Chuzana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ include file="header.jsp"%>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
        }

        .container {
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 10vh;
            flex-direction: column;
        }

        .box {
            background-color: whitesmoke;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 80%;
            max-width: 800px;
            margin-top: 20px;
        }

        h2 {
            color: #333;
            font-size: 24px;
        }

        p {
            font-size: 16px;
            line-height: 1.6;
            color: #555;
        }

        ul {
            list-style: disc;
            margin-left: 20px;
        }

        li {
            font-size: 16px;
            line-height: 1.6;
            color: #555;
        }

        strong {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <img src="https://e0.pxfuel.com/wallpapers/377/205/desktop-wallpaper-smart-in-totally-green-color-lightness-website-thumbnail.jpg" alt="alt" height="400" width="1480">
    <div class="container">
        <h2>Welcome to Jobs Ceylon Consultation Centre</h2>
        <p>The Jobs Ceylon Consultation Centre in Colombo provides free consultation services to job seekers planning to go abroad for jobs. Our consultants are specialized in various countries and job types. We offer part-time consultation services to help you make informed decisions.</p>
    </div>

    <div class="container">
        <div class="box">
            <h2>About Us</h2>
            <p>We provide different types of appointment services to cater to your needs:</p>
            <ul>
                <li><strong>Direct Appointments:</strong> If you are ready to apply for a specific job, you can directly book an appointment.</li>
            </ul>
            <p>For direct appointment inquiries, you can contact us using the following details:</p>
            <ul>
                <li><strong>Telephone:</strong> 0111223456</li>
                <li><strong>Email:</strong> jobs@gmail.lk</li>
                <li><strong>Address:</strong> No 471, Galle Road, Colombo 3, Kollupitiya, Sri Lanka</li>
            </ul>
        </div>
    </div>
</body>
</html>
