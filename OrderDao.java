package com.grocery.shop.dao;
import com.grocery.shop.entities.Order;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class OrderDao {
   private Connection con;

    public OrderDao(Connection con) {
        this.con = con;
    }
   
    //method to save order to db
    public boolean saveOrder(List<Order> olist)
   {
       boolean f=false;
       try {
          String query="insert into product_order(order_id,name,email,phone,address,item_name,price,payment) values(?,?,?,?,?,?,?,?)";
          
          con.setAutoCommit(false);
          PreparedStatement pstmt=con.prepareStatement(query);
         
          for(Order o:olist)
          { 
              pstmt.setString(1, o.getOrder_id());
              pstmt.setString(2, o.getName());
              pstmt.setString(3, o.getEmail());
              pstmt.setString(4, o.getPhone());
              pstmt.setString(5, o.getFulladdress());
              pstmt.setString(6, o.getItem_name());
              pstmt.setInt(7, o.getPrice());
              pstmt.setString(8, o.getPayment());
              pstmt.addBatch();
          }
        int[] count=pstmt.executeBatch();
        con.commit(); 
        f=true;
        con.setAutoCommit(true);
       } catch(Exception e)
       {
           e.printStackTrace();
       }
       return f;
   }
    
    //method to show list of products order by user by its email
    public List<Order> getProduct(String email)
    {
        List<Order> list=new ArrayList<Order>();
        Order o=null;
        try {
           String query="select * from product_order where email=?";
           PreparedStatement pstmt=con.prepareStatement(query);
           pstmt.setString(1, email);
           ResultSet set=pstmt.executeQuery();
           while(set.next()) {
               o=new Order();
               o.setId(set.getInt(1));
               o.setOrder_id(set.getString(2));
               o.setName(set.getString(3));
               o.setEmail(set.getString(4));
               o.setPhone(set.getString(5));
               o.setFulladdress(set.getString(6));
               o.setItem_name(set.getString(7));
               o.setPrice(set.getInt(8));
               o.setPayment(set.getString(9));
               list.add(o);
           }
        }catch(Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    //method to get all orders
    public List<Order> getAllOrder()
    {
        List<Order> list=new ArrayList<Order>();
        Order o=null;
        try {
           String query="select * from product_order";
           PreparedStatement pstmt=con.prepareStatement(query);
           ResultSet set=pstmt.executeQuery();
           while(set.next()) {
               o=new Order();
               o.setId(set.getInt(1));
               o.setOrder_id(set.getString(2));
               o.setName(set.getString(3));
               o.setEmail(set.getString(4));
               o.setPhone(set.getString(5));
               o.setFulladdress(set.getString(6));
               o.setItem_name(set.getString(7));
               o.setPrice(set.getInt(8));
               o.setPayment(set.getString(9));
               list.add(o);
           }
        }catch(Exception e) {
            e.printStackTrace();
        }
        return list; 
    }
    
}
