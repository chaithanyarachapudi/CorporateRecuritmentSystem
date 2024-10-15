package com.Model;
public class JobApplicant {
    private String fullName;
    private String email;
    private String phoneNumber;
    private String position;
    private String coverLetter;

    public JobApplicant(String fullName, String email, String phoneNumber, String position, String coverLetter) {
        this.fullName = fullName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.position = position;
        this.coverLetter = coverLetter;
    }

    public String getFullName() {
        return fullName;
    }

    public String getEmail() {
        return email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getPosition() {
        return position;
    }

    public String getCoverLetter() {
        return coverLetter;
    }
}
