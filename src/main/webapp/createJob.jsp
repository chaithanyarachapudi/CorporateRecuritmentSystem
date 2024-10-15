<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String jobTitle = request.getParameter("job-title");
    String jobDescription = request.getParameter("job-description");

    if (jobTitle != null && jobDescription != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ep1", "root", "Rjchaithu@1610");
            PreparedStatement ps = conn.prepareStatement("INSERT INTO add_job (title, description) VALUES (?, ?)");
            ps.setString(1, jobTitle);
            ps.setString(2, jobDescription);
            ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    response.sendRedirect("AdminLoginIn.html");
%>
