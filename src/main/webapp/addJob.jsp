<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
		    font-family: Arial, sans-serif;
		    background-image: url('images/i4.png'); /* Corrected path */
            background-size: cover;
            background-position: center;
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
		    display: grid;
		    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
		    gap: 40px;
		    margin-bottom: 20px;
		}
		
		.job-card {
		    background-color: #fff;
		    padding: 20px;
		    border-radius: 10px;
		    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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
            <form id="create-job-form" method="post" action="createJob.jsp">
                <label for="job-title">Job Title</label>
                <input type="text" id="job-title" name="job-title" required>
                <label for="job-description">Job Description</label>
                <textarea id="job-description" name="job-description" rows="4" required></textarea>
                <input type="submit" value="Create Job">
            </form>
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
            formContainer.classList.toggle('active');
        });
    </script>
</body>
</html>