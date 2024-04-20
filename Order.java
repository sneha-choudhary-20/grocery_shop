package com.grocery.shop.entities;
import java.sql.*;
public class Order {
  private int id;
  private String order_id;
  private String name;
  private String email;
  private String phone;
  private String fulladdress;
  private String item_name;
  private int price;
  private String payment;

    public Order(int id, String order_id, String name, String email, String phone, String fulladdress, String item_name, int price, String payment) {
        this.id = id;
        this.order_id = order_id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.fulladdress = fulladdress;
        this.item_name = item_name;
        this.price = price;
        this.payment = payment;
    }

    
    public Order() {
    }

    public Order(String order_id, String name, String email, String phone, String fulladdress, String item_name, int price, String payment) {
        this.order_id = order_id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.fulladdress = fulladdress;
        this.item_name = item_name;
        this.price = price;
        this.payment = payment;
    }

    //getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getFulladdress() {
        return fulladdress;
    }

    public void setFulladdress(String fulladdress) {
        this.fulladdress = fulladdress;
    }

    public String getItem_name() {
        return item_name;
    }

    public void setItem_name(String item_name) {
        this.item_name = item_name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    } 
   
}
