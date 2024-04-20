package com.grocery.shop.dao;
import com.grocery.shop.entities.Category;
import com.grocery.shop.entities.Product;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class ProductDao {
    
    private Connection con;

    public ProductDao(Connection con) {
        this.con = con;
    }
    
    //method to get all category
    public ArrayList<Category> getAllCategory()
    {
        ArrayList<Category> list=new ArrayList<>();
        
        try {
           
            String query="select * from category";
            Statement st=this.con.createStatement();
            ResultSet set=st.executeQuery(query);
            while(set.next())
            {
                int cId=set.getInt("cId");
                String cTitle=set.getString("cTitle");
                String cDesc=set.getString("cDesc");
                Category category=new Category(cId,cTitle,cDesc);
                list.add(category);
            }
            
        } catch(Exception e) {
            e.printStackTrace();
        }
    
        return list;
    }
    
   //method to get all products
   public List<Product> getAllProducts()
    {
      List<Product> list=new ArrayList<>();
        
        try {
            
            PreparedStatement pstmt=con.prepareStatement("select * from product");
            ResultSet set=pstmt.executeQuery();
            while(set.next())
            {
                int pId=set.getInt("pId");
                String pName=set.getString("pName");
                String pDesc=set.getString("pDesc");
                String pPhoto=set.getString("pPhoto");
                int pPrice=set.getInt("pPrice");
                int pdiscount=set.getInt("pdiscount");
                int pQuantity=set.getInt("pQuantity");
                int catId=set.getInt("catId");
                Product p=new Product(pId,pName,pDesc,pPhoto,pPrice,pdiscount,pQuantity,catId);
                list.add(p);
            }
            
        } catch(Exception e) {
            e.printStackTrace();
        }
    
        return list;  
    }
   
   
   //method to get all products by category id
   public List<Product> getProductByCatId(int catId)
   {
       List<Product> list=new ArrayList<>();
       try {
            
            PreparedStatement pstmt=con.prepareStatement("select * from product where catId=?");
            pstmt.setInt(1,catId);
            ResultSet set=pstmt.executeQuery();
            while(set.next())
            {
                int pId=set.getInt("pId");
                String pName=set.getString("pName");
                String pDesc=set.getString("pDesc");
                String pPhoto=set.getString("pPhoto");
                int pPrice=set.getInt("pPrice");
                int pdiscount=set.getInt("pdiscount");
                int pQuantity=set.getInt("pQuantity");
                Product p=new Product(pId,pName,pDesc,pPhoto,pPrice,pdiscount,pQuantity,catId);
                list.add(p);
            }
            
        } catch(Exception e) {
            e.printStackTrace();
        }
    
       return list;
   }
   
   //method to get all products by product id
   public List<Product> getProductBypId(int pId)
   {
       List<Product> list=new ArrayList<>();
       try {
            
            PreparedStatement pstmt=con.prepareStatement("select * from product where pId=?");
            pstmt.setInt(1,pId);
            ResultSet set=pstmt.executeQuery();
            while(set.next())
            {
              
                String pName=set.getString("pName");
                String pDesc=set.getString("pDesc");
                String pPhoto=set.getString("pPhoto");
                int pPrice=set.getInt("pPrice");
                int pdiscount=set.getInt("pdiscount");
                int pQuantity=set.getInt("pQuantity");
                int catId=set.getInt("catId");
                Product p=new Product(pId,pName,pDesc,pPhoto,pPrice,pdiscount,pQuantity,catId);
                list.add(p);
            }
            
        } catch(Exception e) {
            e.printStackTrace();
        }
    
       return list;
   }
   
    //method to get single product by product id
   public Product getProductById(int pId)
   {
       Product p=null;
       try {
            
            PreparedStatement pstmt=con.prepareStatement("select * from product where pId=?");
            pstmt.setInt(1,pId);
            ResultSet set=pstmt.executeQuery();
            while(set.next())
            {
              
                String pName=set.getString("pName");
                String pDesc=set.getString("pDesc");
                String pPhoto=set.getString("pPhoto");
                int pPrice=set.getInt("pPrice");
                int pdiscount=set.getInt("pdiscount");
                int pQuantity=set.getInt("pQuantity");
                int catId=set.getInt("catId");
                p=new Product(pId,pName,pDesc,pPhoto,pPrice,pdiscount,pQuantity,catId);
            }
            
        } catch(Exception e) {
            e.printStackTrace();
        }
    
       return p;
   }
   
    //method to insert product to database
    public boolean saveProduct(Product p)
    {
        boolean f=false;
        try {
            
            String query="insert into product(pName,pDesc,pPhoto,pPrice,pdiscount,pQuantity,catId) values(?,?,?,?,?,?,?)";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1, p.getpName());
            pstmt.setString(2, p.getpDesc());
            pstmt.setString(3, p.getpPhoto());
            pstmt.setInt(4, p.getpPrice());
            pstmt.setInt(5, p.getPdiscount());
            pstmt.setInt(6, p.getpQuantity());
            pstmt.setInt(7, p.getCatId());
            pstmt.executeUpdate();
            f=true;
           
        } catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
    
    //method to update product of database
    public boolean updateProduct(Product p)
    {
        boolean f=false;
        try {
           String query="update product set pName=?, pDesc=?, pPrice=?, pdiscount=?, pQuantity=? where pId=?";
           PreparedStatement pstmt=con.prepareStatement(query);
           pstmt.setString(1, p.getpName());
           pstmt.setString(2, p.getpDesc());
           pstmt.setInt(3, p.getpPrice());
           pstmt.setInt(4, p.getPdiscount());
           pstmt.setInt(5, p.getpQuantity());
           pstmt.setInt(6, p.getpId());
           pstmt.executeUpdate();
           f=true;
        }catch(Exception e){
           e.printStackTrace(); 
        }
        return f;
    }
    
    
    //method to delete product from database
    public void deleteProduct(int pId)
    {
        try {
          String query="delete from product where pId=?";
          PreparedStatement pstmt=con.prepareStatement(query);
          pstmt.setInt(1, pId);
          pstmt.execute();
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    
}
