package com.grocery.shop.entities;

public class Category {
   private int cId;
   private String cTitle;
   private String cDesc;
   
    public Category(int cId, String cTitle, String cDesc) {
        this.cId = cId;
        this.cTitle = cTitle;
        this.cDesc = cDesc;
    }
    
    public Category() {
    }

    public Category(String cTitle, String cDesc) {
        this.cTitle = cTitle;
        this.cDesc = cDesc;
    }

   //getters and setters

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public String getcTitle() {
        return cTitle;
    }

    public void setcTitle(String cTitle) {
        this.cTitle = cTitle;
    }

    public String getcDesc() {
        return cDesc;
    }

    public void setcDesc(String cDesc) {
        this.cDesc = cDesc;
    }

}
