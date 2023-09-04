package com.entity;

public class Admin {

    private int id;
    private String email;
    private String password;
    
    public Admin() {
        super();
        // TODO Auto-generated constructor stub
    }

    public Admin(String email, String password) {
        super();
        this.email = email;
        this.password = password;
        
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
}