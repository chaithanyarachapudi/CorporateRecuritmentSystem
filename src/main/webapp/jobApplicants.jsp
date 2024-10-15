<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.Model.JobApplicant" %>
<%@ page import="com.Controller.DatabaseUtils" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Job Applicants</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 15px;
            text-align: left;
        }
    </style>
</head>
<body>
    <h2>Job Applicants</h2>
    <table>
        <tr>
            <th>Full Name</th>
            <th>Email Address</th>
            <th>Phone Number</th>
            <th>Position of Job</th>
            <th>Cover Letter</th>
        </tr>
        <%
            // Sample data, replace this with actual database retrieval
            List<JobApplicant> applicants = new ArrayList<>();
            applicants.add(new JobApplicant("John Doe", "john@example.com", "123-456-7890", "Software Engineer", "I am very interested in this position."));
            applicants.add(new JobApplicant("Jane Smith", "jane@example.com", "987-654-3210", "Data Scientist", "My background is in data analysis and machine learning."));
            applicants.add(new JobApplicant("	anju","	anju@123456	","234895698","	Marketing Specialist","	stress"));
            applicants.add(new JobApplicant("	chaithanya","	qwerty@123","	9490433108","	Data Analyst","	qwerty"));
            applicants.add(new JobApplicant("	chaithu","	chaithu0705@gmail.com","	9490433108","	web development","	zxvvmrygf"));
            applicants.add(new JobApplicant("	chinnu","	qwer@123","	8008855034","	Project Manajer","	oiuytr"));
            applicants.add(new JobApplicant("	minu","	minu@1234","	789456123","	QA Engineer","	poiuytrd"));
            applicants.add(new JobApplicant("	sweety","	sweeety@1234","	9490433108","	Web development","	tyuiopplkjhgf"));
            for (JobApplicant applicant : applicants) {
        %>
        
        
        <tr>
            <td><%= applicant.getFullName() %></td>
            <td><%= applicant.getEmail() %></td>
            <td><%= applicant.getPhoneNumber() %></td>
            <td><%= applicant.getPosition() %></td>
            <td><%= applicant.getCoverLetter() %></td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
