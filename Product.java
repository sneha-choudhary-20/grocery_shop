package com.grocery.shop.entities;
public class Product {
    private int pId;
    private String pName;
    private String pDesc;
    private String pPhoto;
    private int pPrice;
    private int pdiscount;
    private int pQuantity;
    private int catId;

    public Product(int pId, String pName, String pDesc, String pPhoto, int pPrice, int pdiscount, int pQuantity, int catId) {
        this.pId = pId;
        this.pName = pName;
        this.pDesc = pDesc;
        this.pPhoto = pPhoto;
        this.pPrice = pPrice;
        this.pdiscount = pdiscount;
        this.pQuantity = pQuantity;
        this.catId = catId;
    }

    
    public Product() {
    }

    public Product(String pName, String pDesc, String pPhoto, int pPrice, int pdiscount, int pQuantity, int catId) {
        this.pName = pName;
        this.pDesc = pDesc;
        this.pPhoto = pPhoto;
        this.pPrice = pPrice;
        this.pdiscount = pdiscount;
        this.pQuantity = pQuantity;
        this.catId = catId;
    }

    
    //getters and setters

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpDesc() {
        return pDesc;
    }

    public void setpDesc(String pDesc) {
        this.pDesc = pDesc;
    }

    public String getpPhoto() {
        return pPhoto;
    }

    public void setpPhoto(String pPhoto) {
        this.pPhoto = pPhoto;
    }

    public int getpPrice() {
        return pPrice;
    }

    public void setpPrice(int pPrice) {
        this.pPrice = pPrice;
    }

    public int getPdiscount() {
        return pdiscount;
    }

    public void setPdiscount(int pdiscount) {
        this.pdiscount = pdiscount;
    }

    public int getpQuantity() {
        return pQuantity;
    }

    public void setpQuantity(int pQuantity) {
        this.pQuantity = pQuantity;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    
    //method to calculate price after discount
    public int getPriceAfterApplyingDiscount()
    {
        int d=(int)((this.getPdiscount()/100.0)*this.getpPrice());
        return this.getpPrice()-d;
    } 
}
