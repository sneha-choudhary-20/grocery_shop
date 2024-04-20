package com.grocery.shop.dao;
import com.grocery.shop.entities.Cart;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class CartDao {
   
    private Connection con;

    public CartDao(Connection con) {
        this.con = con;
    }
    
    //method to insert cart to db
    public boolean addCart(Cart c)
    {
        boolean f=false;
        try {
            String query="insert into cart(pid,uid,pname,price,total_price) values(?,?,?,?,?)";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setInt(1, c.getPid());
            pstmt.setInt(2, c.getUid());
            pstmt.setString(3, c.getPname());
            pstmt.setInt(4, c.getPrice());
            pstmt.setInt(5, c.getTotal_price());
            pstmt.executeUpdate();
            f=true;
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
    
   //method to get all cart by user id
    public List<Cart> getProductByUser(int uid)
    {
       List<Cart> list=new ArrayList<Cart>();
       Cart c=null;
       int total_price=0;
       try {
          String query="select * from cart where uid=?";
          PreparedStatement pstmt=con.prepareStatement(query);
          pstmt.setInt(1, uid);
          ResultSet set=pstmt.executeQuery();
          while(set.next())
          {
             c=new Cart();
             c.setCid(set.getInt(1));
             c.setPid(set.getInt(2));
             c.setUid(set.getInt(3));
             c.setPname(set.getString(4));
             c.setPrice(set.getInt(5));
             
             total_price=total_price+set.getInt(6);
             c.setTotal_price(total_price);
             
             list.add(c);
          }
       }catch(Exception e)
       {
           e.printStackTrace();
       }
       return list;
    }
    
    
    //method to remove product from cart
    public boolean deleteProduct(int pid,int uid,int cid)
    {
       boolean f=false;
       try {
          String query="delete from cart where pid=? and uid=? and cid=?";
          PreparedStatement pstmt=con.prepareStatement(query); 
          pstmt.setInt(1, pid);
          pstmt.setInt(2, uid);
          pstmt.setInt(3, cid);
          pstmt.executeUpdate();
          f=true;
       }catch(Exception e)
       {
           e.printStackTrace();
       }
       return f;
    }
    
    //method to get all cart count
    public ArrayList<Cart> getAllCart()
    {
        ArrayList<Cart> list=new ArrayList<>();
        Cart c=null;
        try {
           
            String query="select * from cart";
            Statement st=this.con.createStatement();
            ResultSet set=st.executeQuery(query);
            while(set.next())
            {
             c=new Cart();
             c.setCid(set.getInt(1));
             c.setPid(set.getInt(2));
             c.setUid(set.getInt(3));
             c.setPname(set.getString(4));
             c.setPrice(set.getInt(5));
             c.setTotal_price(set.getInt(6));
             list.add(c);
            }
            
        } catch(Exception e) {
            e.printStackTrace();
        }
    
        return list;
    }
    
}
