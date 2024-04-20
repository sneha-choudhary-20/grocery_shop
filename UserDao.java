package com.grocery.shop.dao;
import com.grocery.shop.entities.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
       this.con=con;
    }
    
    //method to insert user to database:
    public boolean saveUser(User user)
    {
        boolean f=false;
        try
        {
            String query="insert into user(name,email,password,phone,address) values(?,?,?,?,?)";
            PreparedStatement pstmt=this.con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getPhone());
            pstmt.setString(5, user.getAddress());
            
            pstmt.executeUpdate();
            f=true;
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
    
    //method to get user by useremail and userpassword:
    
    public User getUserByEmailAndPassword(String email, String password) {
        User user=null;
        try {
            
            String query="select * from user where email =? and password =?";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            
            ResultSet set=pstmt.executeQuery();
            if(set.next())
            {
                user=new User();
                //fetch user name from db..
                String name=set.getString("name");
                //set data to user object..
                user.setName(name);
                
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setPhone(set.getString("phone"));
                user.setAddress(set.getString("address"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setRole(set.getString("role"));
            }
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    
    
   //method to get all users
   public List<User> getAllUsers()
    {
      List<User> list=new ArrayList<>();
        
        try {
            
            PreparedStatement pstmt=con.prepareStatement("select * from user");
            ResultSet set=pstmt.executeQuery();
            while(set.next())
            {
                int id=set.getInt("id");
                String name=set.getString("name");
                String email=set.getString("email");
                String password=set.getString("password");
                String phone=set.getString("phone");
                String address=set.getString("address");
                Timestamp rdate=set.getTimestamp("rdate");
                String role=set.getString("role");
                User u=new User(id,name,email,password,phone,address,rdate,role);
                list.add(u);
            }
            
        } catch(Exception e) {
            e.printStackTrace();
        }
    
        return list;  
    }
   
    //method to set new password
    public boolean updateUser(User user)
    {
        boolean f=false;
        try {
           String query = "update user set password=? where email=?";
           PreparedStatement pstmt=this.con.prepareStatement(query);
            pstmt.setString(2, user.getEmail());
            pstmt.setString(1, user.getPassword());
            pstmt.executeUpdate();
            f=true;
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
}
