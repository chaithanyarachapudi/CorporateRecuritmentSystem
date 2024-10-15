package com.Controller;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.Model.JobApplicant;

public class DatabaseUtils {
    public static List<JobApplicant> getJobApplicants() {
        List<JobApplicant> applicants = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ep1", "root","Rjchaithu@1610");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM job_applicants");

            while (rs.next()) {
                String fullName = rs.getString("full_name");
                String email = rs.getString("email");
                String phoneNumber = rs.getString("phone_number");
                String position = rs.getString("position");
                String coverLetter = rs.getString("cover_letter");
                applicants.add(new JobApplicant(fullName, email, phoneNumber, position, coverLetter));
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return applicants;
    }
}
