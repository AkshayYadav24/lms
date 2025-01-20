package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class User {
    // variable
    private Integer userId;
    private String name;
    private String email;
    private String password;
    private String contact;
    private UserType userType;

    // constructor
    public User() {
    }

    public User(Integer userId) {
        this.userId = userId;
    }

    public User(String name) {
        this.name = name;
    }

    public User(Integer userId, String name) {
        this(userId);
        this.name = name;
    }

    public User(String name, String email, String password, String contact, UserType userType) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.contact = contact;
        this.userType = userType;
    }

    

    // public static boolean updatePassword(String email, String verificationCode, String password) {
    //     boolean flag = false;

    //     try {
    //         Class.forName(Database.driver);
    //     } catch (ClassNotFoundException e) {
    //         e.printStackTrace();
    //     }
    //     try (Connection con = DriverManager.getConnection(Database.driverURL,Database.driverUser,Database.driverPassword)) {
    //         String query = "update users set password=?, verification_code=null where email=? and verification_code=?";
    //         PreparedStatement ps = con.prepareStatement(query);
    //         ps.setString(1, spe.encryptPassword(password));
    //         ps.setString(2, email);
    //         ps.setString(3, verificationCode);
    //         int val = ps.executeUpdate();
    //         if(val == 1) {
    //             flag = true;
    //         }
    //     } catch (SQLException e) {
    //         e.printStackTrace();
    //     }
    //     return flag;
    // }

    public int login() {
        int result = 0; // execption generate;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3030/lmsdb","root","naina");

            String query = "select name,contact,email from users where user_id = ? && password= ? && user_type_id = ?";
            
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setString(2, password);
            ps.setInt(3, userType.getUserTypeId());

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                name = rs.getString(1);
                contact = rs.getString(2);
                email = rs.getString(3);
                result = 2;
            } else {
                result = 1; // invalid user
            }
        } catch (SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }
        return result;
    }

    public User(Integer userId, String password, UserType userType) {
        this.userId = userId;
        this.password = password;
        this.userType = userType;
    }

    public int saveUser() {
        int result = 0;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3030/lmsdb","root","naina");

            String query = "insert into users (name, email, password, contact, user_type_id) value (?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, contact);
            ps.setInt(5, userType.getUserTypeId());

            int val = ps.executeUpdate();

            if(val == 1) {
                ResultSet rs = ps.getGeneratedKeys();
                if(rs.next())
                    result = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    // getter and setter
    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public UserType getUserType() {
        return userType;
    }

    public void setUserType(UserType userType) {
        this.userType = userType;
    }
}
