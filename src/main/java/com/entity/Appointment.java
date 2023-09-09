package com.entity;

public class Appointment {

    private int id;
    private int consultant_id;
    private int jobseeker_id;
    private String appointment_datetime;
    

    public Appointment() {
        super();
        // TODO Auto-generated constructor stub
    }

    public Appointment(int consultant_id, int jobseeker_id, String appointment_datetime) {
        super();
        this.consultant_id = consultant_id;
        this.jobseeker_id = jobseeker_id;
        this.appointment_datetime = appointment_datetime;
       
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getConsultant_id() {
        return consultant_id;
    }

    public void setConsultant_id(int consultant_id) {
        this.consultant_id = consultant_id;
    }

    public int getJobseeker_id() {
        return jobseeker_id;
    }

    public void setJobseeker_id(int jobseeker_id) {
        this.jobseeker_id = jobseeker_id;
    }

    public String getAppointment_datetime() {
        return appointment_datetime;
    }

    public void setAppointment_datetime(String appointment_datetime) {
        this.appointment_datetime = appointment_datetime;
    }

}