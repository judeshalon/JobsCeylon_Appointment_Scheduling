package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entity.Appointment;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AppointmentDao {

    private Connection conn;

    public AppointmentDao(Connection conn) {
        super();
        this.conn = conn;
    }

    public boolean registerAppointment(Appointment appointment) {
        boolean success = false;

        try {
            String sql = "INSERT INTO appointment_dtls (consultant_id, jobseeker_id,"
                    + "appointment_datetime) VALUES (?, ?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, appointment.getConsultant_id());
            ps.setInt(2, appointment.getJobseeker_id());
            ps.setString(3, appointment.getAppointment_datetime());
            int rowsInserted = ps.executeUpdate();
            success = rowsInserted > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }

    /* ------    Add List and Call by ID   -----*/
    public List<Appointment> getAllAppointment() {
        List<Appointment> list = new ArrayList<Appointment>();
        Appointment d = null;
        try {

            String sql = "select * from appointment_dtls order by id desc";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                d = new Appointment();
                d.setId(rs.getInt(1));
                d.setConsultant_id(rs.getInt(2));
                d.setJobseeker_id(rs.getInt(3));
                d.setAppointment_datetime(rs.getString(4));

                list.add(d);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Appointment getAppointmentById(int id) {

        Appointment d = null;
        try {

            String sql = "select * from appointment_dtls where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                d = new Appointment();
                d.setId(rs.getInt(1));
                d.setConsultant_id(rs.getInt(2));
                d.setJobseeker_id(rs.getInt(3));
                d.setAppointment_datetime(rs.getString(4));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return d;
    }

    public boolean updateAppointment(Appointment appointment) {
        boolean f = false;

        try {
            String sql = "update appointment_dtls set consultant_id=?,jobseeker_id=?,appointment_datetime=?,"
                    + " where id=?";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, appointment.getConsultant_id());
                ps.setInt(2, appointment.getJobseeker_id());
                ps.setString(3, appointment.getAppointment_datetime());

                ps.setInt(8, appointment.getId());

                int i = ps.executeUpdate();

                if (i == 1) {
                    f = true;
                }
            }
        } catch (SQLException e) {
            // Handle the exception gracefully, either by throwing a custom 
            // exception or logging the error.
            e.printStackTrace();
        }

        return f;
    }

    public boolean deleteAppointmentById(int id) {
        boolean f = false;

        try {
            String sql = "DELETE FROM appointment_dtls WHERE id=?";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, id);

                int i = ps.executeUpdate();

                if (i == 1) {
                    f = true; // Set to true if one row is affected, indicating successful deletion
                }
            }
        } catch (SQLException e) {
            // Handle the exception gracefully, either by throwing a custom 
            // exception or logging the error.
            e.printStackTrace();
        }

        return f;
    }

    public List<Appointment> getAppointmentByConsultantId(int consultant_id) {

        List<Appointment> list = new ArrayList<Appointment>();
        Appointment d = null;
        try {

            String sql = "SELECT * FROM appointment_dtls WHERE consultant_id=? order by id desc";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, consultant_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                d = new Appointment();
                d.setId(rs.getInt(1));
                d.setConsultant_id(rs.getInt(2));
                d.setJobseeker_id(rs.getInt(3));
                d.setAppointment_datetime(rs.getString(4));

                list.add(d);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
     public List<Appointment> getAppointmentByJobseekerId(int jobseeker_id) {

        List<Appointment> list = new ArrayList<Appointment>();
        Appointment d = null;
        try {

            String sql = "SELECT * FROM appointment_dtls WHERE jobseeker_id=? order by id desc";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, jobseeker_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                d = new Appointment();
                d.setId(rs.getInt(1));
                d.setConsultant_id(rs.getInt(2));
                d.setJobseeker_id(rs.getInt(3));
                d.setAppointment_datetime(rs.getString(4));

                list.add(d);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
