package com.entity;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Appointment {

    private int id;
    private int consultant_id;
    private int jobseeker_id;
    private String appointment_datetime;

    public Appointment() {
        super();
    }

    public Appointment(int consultant_id, int jobseeker_id, String appointment_datetime) {
        super();
        this.consultant_id = consultant_id;
        this.jobseeker_id = jobseeker_id;
        setAppointment_datetime(appointment_datetime); // Validate and set the appointment datetime
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
        // Validate and set the appointment datetime
        if (isValidDateTime(appointment_datetime)) {
            this.appointment_datetime = appointment_datetime;
        } else {
            throw new IllegalArgumentException("Invalid appointment datetime format");
        }
    }

    // Validate if the input string is a valid date-time format
    private boolean isValidDateTime(String datetime) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            Date date = sdf.parse(datetime);
            return true;
        } catch (ParseException e) {
            return false;
        }
    }
}