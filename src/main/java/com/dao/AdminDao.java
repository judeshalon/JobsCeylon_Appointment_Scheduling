package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.entity.Admin;
import java.util.ArrayList;
import java.util.List;

public class AdminDao {

    private Connection conn;

    public AdminDao(Connection conn) {
        super();
        this.conn = conn;
    }

    public Admin login(String email, String password) throws SQLException {
        Admin admin = null;

        String sql = "select * from admin_dtls where email=? and password=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, email);
        ps.setString(2, password);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            admin = new Admin();
            admin.setId(rs.getInt("id"));
            admin.setEmail(rs.getString("email"));
            admin.setPassword(rs.getString("password"));
        }

        return admin;
    }

    public Admin getAdminById(int id) throws SQLException {
        Admin admin = null;

        String sql = "select * from admin_dtls where id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            admin = new Admin();
            admin.setId(rs.getInt("id"));
            admin.setEmail(rs.getString("email"));
            admin.setPassword(rs.getString("password"));
        }

        return admin;
    }

    public boolean updateAdmin(Admin admin) throws SQLException {
        boolean isUpdated = false;

        String sql = "update admin_dtls set email=?, password=? where id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, admin.getEmail());
        ps.setString(2, admin.getPassword());
        ps.setInt(3, admin.getId());

        int rowsAffected = ps.executeUpdate();

        if (rowsAffected == 1) {
            isUpdated = true;
        }

        return isUpdated;
    }

    public List<Admin> getAllAdmin() throws SQLException {
        List<Admin> admins = new ArrayList<>();

        String sql = "SELECT * FROM admin_dtls";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Admin admin = new Admin();
            admin.setId(rs.getInt("id"));
            admin.setEmail(rs.getString("email"));
            admin.setPassword(rs.getString("password"));

            admins.add(admin);
        }

        return admins;
    }
}
