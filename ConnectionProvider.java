package com.grocery.shop.helper;
import java.sql.*;
public class ConnectionProvider
{
    private static Connection con;
    public static Connection getConnection()
    {
        try
        {
            if(con==null)
            {
               //load driver class
            
               Class.forName("com.mysql.jdbc.Driver");
            
               //create connection
               con =DriverManager.getConnection("jdbc:mysql://localhost:3306/grocery_shop","root","root");
            }     
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return con;
    }
}
