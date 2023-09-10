import com.dao.AdminDao;
import com.entity.Admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class AdminLogin {
    public static void main(String[] args) {
        // Replace these values with your actual database configuration
        String jdbcUrl = "jdbc:mysql://localhost:3306/jobsceylon-appointment-scheduling?useSSL=false";
        String dbUser = "root";
        String dbPassword = "Judeshalon";

        // Initialize the connection and AdminDao
        try (Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword)) {
            AdminDao adminDao = new AdminDao(conn);

            // Replace with actual email and password for login
            String email = "admin@gmail.com";
            String password = "1234";

            Admin admin = adminDao.login(email, password);

            if (admin != null) {
                System.out.println("Login successful!");
                System.out.println("Admin ID: " + admin.getId());
                System.out.println("Admin Email: " + admin.getEmail());
            } else {
                System.out.println("Login failed. Invalid credentials.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Database connection error: " + e.getMessage());
        }
    }
}
