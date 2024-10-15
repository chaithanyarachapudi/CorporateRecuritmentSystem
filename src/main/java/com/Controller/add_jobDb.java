package com.Controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Model.Add_Jobcon;
import com.Model.Add_job;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/jobs")
public class add_jobDb extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Add_job> jobs = new ArrayList<>();
        try (Connection conn = Add_Jobcon.getConnection()) {
            String query = "SELECT * FROM add_job";
            try (Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery(query)) {
                while (rs.next()) {
                    Add_job job = new Add_job();
                    job.setTablename(rs.getString("tablename"));
                    job.setDescription(rs.getString("description"));
                    jobs.add(job);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("jobs", jobs);
        request.getRequestDispatcher("jobs.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String jobTitle = request.getParameter("tablename");
        String jobDescription = request.getParameter("description");

        try (Connection conn = Add_Jobcon.getConnection()) {
            String query = "INSERT INTO add_job (tablename, description) VALUES (?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, jobTitle);
                stmt.setString(2, jobDescription);
                stmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/jobs");
    }
}
