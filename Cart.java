package com.grocery.shop.entities;
public class Cart {
   private int cid;
   private int pid;
   private int uid;
   private String pname;
   private int price;
   private int Quantity;
   private int total_price;

    public Cart(int cid, int pid, int uid, String pname, int price, int Quantity, int total_price) {
        this.cid = cid;
        this.pid = pid;
        this.uid = uid;
        this.pname = pname;
        this.price = price;
        this.Quantity = Quantity;
        this.total_price = total_price;
    }

    public Cart() {
    }

    public Cart(int pid, int uid, String pname, int price, int Quantity, int total_price) {
        this.pid = pid;
        this.uid = uid;
        this.pname = pname;
        this.price = price;
        this.Quantity = Quantity;
        this.total_price = total_price;
    }
   
   
   //getters and setters

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public int getTotal_price() {
        return total_price;
    }

    public void setTotal_price(int total_price) {
        this.total_price = total_price;
    }
   
}
