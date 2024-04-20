package com.grocery.shop.dao;
import com.grocery.shop.entities.Feedback;
import java.sql.*;
public class FeedbackDao {
    private Connection con;

    public FeedbackDao(Connection con) {
       this.con=con;
    }
    
    //method to save feedback to database:
    public boolean saveFeedback(Feedback feedback)
    {
        boolean f=false;
        try
        {
            String query="insert into feedback(name,email,rate,feedback,suggestion) values(?,?,?,?,?)";
            PreparedStatement pstmt=this.con.prepareStatement(query);
            pstmt.setString(1, feedback.getName());
            pstmt.setString(2, feedback.getEmail());
            pstmt.setString(3, feedback.getRate());
            pstmt.setString(4, feedback.getFeedback());
            pstmt.setString(5, feedback.getSuggestion());
            
            pstmt.executeUpdate();
            f=true;
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
 
}
