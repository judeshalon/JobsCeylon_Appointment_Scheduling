package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entity.Consultant;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ConsultantDao {

    private Connection conn;

    public ConsultantDao(Connection conn) {
        super();
        this.conn = conn;
    }

    public boolean registerConsultant(Consultant consultant) {
        boolean success = false;

        try {
            String sql = "INSERT INTO consultant_dtls (fname, lname, email, "
                    + "password, phone, specialized_countries, "
                    + "working_period ) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, consultant.getFname());
            ps.setString(2, consultant.getLname());
            ps.setString(3, consultant.getEmail());
            ps.setString(4, consultant.getPassword());
            ps.setString(5, consultant.getPhoneNumber());
            ps.setString(6, consultant.getSpecializedCountries());
            ps.setString(7, consultant.getWorkingPeriod());

            int rowsInserted = ps.executeUpdate();
            success = rowsInserted > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }

    public Consultant login(String em, String psw) {
        Consultant u = null;

        try {
            String sql = "select * from consultant_dtls where email=? and password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, em);
            ps.setString(2, psw);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                u = new Consultant();
                u.setId(rs.getInt(1));
                u.setFname(rs.getString(2));
                u.setLname(rs.getString(3));
                u.setEmail(rs.getString(4));
                u.setPassword(rs.getString(5));
                u.setPhoneNumber(rs.getString(6));
                u.setSpecializedCountries(rs.getString(7));
                u.setWorkingPeriod(rs.getString(8));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return u;
    }

    /* ------    Add List and Call by ID   -----*/
    public List<Consultant> getAllConsultant() {
        List<Consultant> list = new ArrayList<Consultant>();
        Consultant d = null;
        try {

            String sql = "select * from consultant_dtls order by id desc";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                d = new Consultant();
                d.setId(rs.getInt(1));
                d.setFname(rs.getString(2));
                d.setLname(rs.getString(3));
                d.setEmail(rs.getString(4));
                d.setPassword(rs.getString(5));
                d.setPhoneNumber(rs.getString(6));
                d.setSpecializedCountries(rs.getString(7));
                d.setWorkingPeriod(rs.getString(8));

                list.add(d);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Consultant getConsultantById(int id) {

        Consultant d = null;
        try {

            String sql = "select * from consultant_dtls where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                d = new Consultant();
                d.setId(rs.getInt(1));
                d.setFname(rs.getString(2));
                d.setLname(rs.getString(3));
                d.setEmail(rs.getString(4));
                d.setPassword(rs.getString(5));
                d.setPhoneNumber(rs.getString(6));
                d.setSpecializedCountries(rs.getString(7));
                d.setWorkingPeriod(rs.getString(8));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return d;
    }
    
       public Consultant getConsultantByEmail(String email) {

        Consultant d = null;
        try {

            String sql = "select * from consultant_dtls where email=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,email);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                d = new Consultant();
                d.setId(rs.getInt(1));
                d.setFname(rs.getString(2));
                d.setLname(rs.getString(3));
                d.setEmail(rs.getString(4));
                d.setPassword(rs.getString(5));
                d.setPhoneNumber(rs.getString(6));
                d.setSpecializedCountries(rs.getString(7));
                d.setWorkingPeriod(rs.getString(8));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return d;
    }
    
    
    
   public boolean updateConsultant(Consultant consultant) {
    boolean f = false;

    try {
        String sql = "update consultant_dtls set fname=?,lname=?,email=?,"
                + "password=?,phone=?,specialized_countries=?,working_period=?"
                + " where id=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, consultant.getFname());
            ps.setString(2, consultant.getLname());
            ps.setString(3, consultant.getEmail());
            ps.setString(4, consultant.getPassword());
            ps.setString(5, consultant.getPhoneNumber());
            ps.setString(6, consultant.getSpecializedCountries());
            ps.setString(7, consultant.getWorkingPeriod());
            ps.setInt(8, consultant.getId());

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

public boolean deleteConsultantById(int id) {
    boolean f = false;

    try {
        String sql = "DELETE FROM consultant_dtls WHERE id=?";
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
}