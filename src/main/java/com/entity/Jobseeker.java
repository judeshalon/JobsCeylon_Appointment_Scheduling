package com.entity;

public class Jobseeker {

    private int id;
    private String fname;
    private String lname;
    private String email;
    private String password;
    private String phoneNumber;

    public Jobseeker() {
        super();
        // TODO Auto-generated constructor stub
    }

    public Jobseeker(String fname, String lname, String email, String password, String phoneNumber) {
        super();
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.password = password;
        this.phoneNumber = phoneNumber;
    }
    
     public Jobseeker(int id, String fname, String lname, String email, String password, String phoneNumber ) {
        super();
        this.id=id;
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.password = password;
        this.phoneNumber = phoneNumber;
       
     }
    


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

}