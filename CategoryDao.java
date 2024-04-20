package com.grocery.shop.dao;
import com.grocery.shop.entities.Category;
import java.sql.*;
import java.util.ArrayList;
public class CategoryDao {
    private Connection con;
    
    public CategoryDao(Connection con) {
        this.con=con;
    }
    
    //method to save category to db
    public boolean saveCategory(Category category)
    {
        boolean f=false;
        try {
           String query="insert into category(cTitle,cDesc) values(?,?)";
           PreparedStatement pstmt=con.prepareStatement(query);
           pstmt.setString(1, category.getcTitle());
           pstmt.setString(2, category.getcDesc());
           pstmt.executeUpdate();
           f=true;
        
          } catch (Exception e) {
            e.printStackTrace();
         }
    
        return f;
   }
    
     //method to delete category from database
    public void deleteCategory(int cId)
    {
        try {
          String query="delete from category where cId=?";
          PreparedStatement pstmt=con.prepareStatement(query);
          pstmt.setInt(1, cId);
          pstmt.execute();
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    
}
