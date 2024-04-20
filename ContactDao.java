package com.grocery.shop.dao;
import com.grocery.shop.entities.Contact;
import java.sql.*;
public class ContactDao {
    private Connection con;

    public ContactDao(Connection con) {
       this.con=con;
    }
    
    //method to save contact to database:
    public boolean saveContact(Contact contact)
    {
        boolean f=false;
        try
        {
            String query="insert into contact(name,email,message) values(?,?,?)";
            PreparedStatement pstmt=this.con.prepareStatement(query);
            pstmt.setString(1, contact.getName());
            pstmt.setString(2, contact.getEmail());
            pstmt.setString(3, contact.getMessage());
            
            pstmt.executeUpdate();
            f=true;
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
}
