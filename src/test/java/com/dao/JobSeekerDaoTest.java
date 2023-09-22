/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package com.dao;

import com.entity.Admin;
import com.entity.Jobseeker;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Joy Chuzana
 */
public class JobSeekerDaoTest {

    public JobSeekerDaoTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }

    /**
     * Test of registerJobSeeker method, of class JobSeekerDao.
     */
  @Test
    public void testRegisterJobSeeker() throws SQLException {
        System.out.println("RegisterJobSeeker");

        // Create a Jobseeker with the provided values
        Jobseeker jobSeeker = new Jobseeker();
        jobSeeker.setFname("Anojan");
        jobSeeker.setLname("Kumar");
        jobSeeker.setEmail("anoj@gmail.com");
        jobSeeker.setPassword("123@qwe");
        jobSeeker.setPhoneNumber("77123456");

        // Create a Connection object
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobsceylon-appointment-scheduling?useSSL=false", "root", "Judeshalon");

        // Pass the established database connection to the JobSeekerDao constructor
        JobSeekerDao instance = new JobSeekerDao(connection);

        // Attempt to register the JobSeeker
        boolean result = instance.registerJobSeeker(jobSeeker);

        // Check if the registration was successful
        assertTrue(result); // This assertion will pass if 'result' is true (successful registration)

        // Retrieve the registered job seeker by ID (assuming ID 3)
        int registeredJobSeekerId = 3; // Adjust the ID as needed
        Jobseeker registeredJobSeeker = instance.getJobseekerById(registeredJobSeekerId);

        // Check if the retrieved details match the expected values
        assertEquals("Anojan", registeredJobSeeker.getFname());
        assertEquals("Kumar", registeredJobSeeker.getLname());
        assertEquals("anoj@gmail.com", registeredJobSeeker.getEmail());
        assertEquals("123@qwe", registeredJobSeeker.getPassword());
        assertEquals("77123456", registeredJobSeeker.getPhoneNumber());
    }
    
      @Test
    public void testLogin() throws Exception {
        System.out.println("Jobseeker login");

        int jobseekerId = 3;
        String expectedEmail = "anoj@gmail.com";
        String expectedPassword = "123@qwe";

        // Create a Connection object
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobsceylon-appointment-scheduling?useSSL=false", "root", "Judeshalon");

        // Pass the Connection object to the JobSeekerDao constructor
        JobSeekerDao instance = new JobSeekerDao(connection);

        // Get the jobseeker's email and password by ID from the database
        Jobseeker jobseeker = instance.getJobseekerById(jobseekerId);

        // Check if the jobseeker is not null, indicating that the ID exists
        assertNotNull(jobseeker);

        // Retrieve the email and password from the jobseeker object
        String email = jobseeker.getEmail();
        String password = jobseeker.getPassword();

        // Perform the login with the retrieved email and password
        Jobseeker result = instance.login(email, password);

        // Check if the result is not null, indicating a successful login
        assertNotNull(result);

        // Check if the retrieved email and password match the expected values
        assertEquals(expectedEmail, email);
        assertEquals(expectedPassword, password);
    }

    @Test
    public void testgetJobSeekerById() {
        System.out.println("GET JobSeeker by ID");

        // Create a Jobseeker with the provided values
        Jobseeker jobSeeker = new Jobseeker();
        jobSeeker.setFname("Anojan");
        jobSeeker.setLname("Kumar");
        jobSeeker.setEmail("anoj@gmail.com");
        jobSeeker.setPassword("123@qwe");
        jobSeeker.setPhoneNumber("77123456");

        Connection connection = null;
        try {
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobsceylon-appointment-scheduling?useSSL=false", "root", "Judeshalon");
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Pass the Connection object to the JobSeekerDao constructor
        JobSeekerDao instance = new JobSeekerDao(connection);

        // Attempt to register the JobSeeker
        boolean result = instance.registerJobSeeker(jobSeeker);

        // Check if the registration was successful
        assertTrue(result); // This assertion will pass if 'result' is true (successful registration) and fail if it's false (failed registration)

        // Retrieve the details of the registered job seeker from the database
        Jobseeker registeredJobSeeker = instance.getJobseekerById(3); // Implement 'getJobSeekerByEmail' method to fetch the job seeker by email

        // Compare the details of the registered job seeker with the provided details
        assertEquals(jobSeeker.getFname(), registeredJobSeeker.getFname());
        assertEquals(jobSeeker.getLname(), registeredJobSeeker.getLname());
        assertEquals(jobSeeker.getEmail(), registeredJobSeeker.getEmail());
        assertEquals(jobSeeker.getPassword(), registeredJobSeeker.getPassword());
        assertEquals(jobSeeker.getPhoneNumber(), registeredJobSeeker.getPhoneNumber());
    }


}
