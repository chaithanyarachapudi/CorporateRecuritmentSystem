<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            box-sizing: border-box;
        }
        .navbar {
            width: 100%;
            background-color: #333;
            overflow: hidden;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
        }
        .navbar a {
            float: left;
            display: block;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
        }
        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }
        .container {
            margin-top: 80px; /* Adjusted for navbar height */
            width: 90%;
            max-width: 1200px;
        }
        .form-container,
        .job-cards {
            display: none;
        }
        .form-container.active,
        .job-cards.active {
            display: block;
        }
        .job-cards {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-bottom: 20px;
        }
        .job-card {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: calc(33.333% - 20px);
            box-sizing: border-box;
        }
        .job-card h3 {
            margin-top: 0;
        }
        .job-card p {
            margin: 10px 0;
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            margin: 5px;
            border: none;
            border-radius: 5px;
            color: white;
            text-align: center;
            cursor: pointer;
        }
        .button.add {
            background-color: #4CAF50;
        }
        .button.add:hover {
            background-color: #45a049;
        }
        .button.delete {
            background-color: #f44336;
        }
        .button.delete:hover {
            background-color: #d32f2f;
        }
        .button.update {
            background-color: #2196F3;
        }
        .button.update:hover {
            background-color: #1976D2;
        }
        .button.create {
            background-color: #FFC107;
        }
        .button.create:hover {
            background-color: #FFB300;
        }
        .form-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        .form-container input[type="text"],
        .form-container textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }
        .form-container input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

    <div class="navbar" id="navbar-placeholder"></div>

    <div class="container">
        <button class="button add" id="toggle-create-job-form">Add Job</button>

        <div class="form-container" id="create-job-form">
            <h2>Create Job</h2>
            <form id="create-job-form" method="post" action="jobs">
                <label for="job-title">Job Title</label>
                <input type="text" id="job-title" name="tablename" required>

                <label for="job-description">Job Description</label>
                <textarea id="job-description" name="description" rows="4" required></textarea>

                <input type="submit" value="Create Job">
            </form>
        </div>

        <div class="job-cards active" id="job-cards-container">
            <c:forEach var="job" items="${jobs}">
                <div class="job-card">
                    <h3>${job.tablename}</h3>
                    <p>${job.description}</p>
                    <button class="button update">Update</button>
                    <button class="button delete">Delete</button>
                </div>
            </c:forEach>
        </div>
    </div>

    <script>
        function loadNavbar() {
            fetch('navbar.html')
                .then(response => response.text())
                .then(data => {
                    document.getElementById('navbar-placeholder').innerHTML = data;
                });
        }

        document.addEventListener('DOMContentLoaded', loadNavbar);

        document.getElementById('toggle-create-job-form').addEventListener('click', function() {
            const formContainer = document.getElementById('create-job-form');
            const jobCardsContainer = document.getElementById('job-cards-container');
            
            if (formContainer.classList.contains('active')) {
                formContainer.classList.remove('active');
                jobCardsContainer.classList.add('active');
            } else {
                formContainer.classList.add('active');
                jobCardsContainer.classList.remove('active');
            }
        });
    </script>
</body>
</html>