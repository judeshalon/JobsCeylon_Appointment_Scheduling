/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package com.dao;

import com.entity.Admin;
import java.sql.Connection;
import java.sql.DriverManager;
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
public class AdminDaoTest {
    
    public AdminDaoTest() {
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
     * Test of login method, of class AdminDao.
     */
 @Test
public void testLogin() throws Exception {
    System.out.println("Admin login");
    String email = "admin@gmail.com"; // Correct email
    String password = "1234"; // Correct password
    
    // Create a Connection object 
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobsceylon-appointment-scheduling?useSSL=false", "root", "Judeshalon");
    
    // Pass the Connection object to the AdminDao constructor
    AdminDao instance = new AdminDao(connection); // Replace 'connection' with your actual Connection object
    
    // Attempt to login
    Admin result = instance.login(email, password);
    
    // Check if the result is not null, indicating a successful login
    assertNotNull(result);
    
    
    // For example, you could check if the 'result' object contains the correct email or other properties:
    assertEquals(email, result.getEmail());
    
}

}