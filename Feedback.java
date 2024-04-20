package com.grocery.shop.entities;
import java.sql.*;
public class Feedback {
    private int id;
    private String name;
    private String email;
    private String rate;
    private String feedback;
    private String suggestion;

    public Feedback(int id, String name, String email, String rate, String feedback, String suggestion) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.rate = rate;
        this.feedback = feedback;
        this.suggestion = suggestion;
    }

    public Feedback() {
    }

    public Feedback(String name, String email, String rate, String feedback, String suggestion) {
        this.name = name;
        this.email = email;
        this.rate = rate;
        this.feedback = feedback;
        this.suggestion = suggestion;
    }

    
    //getters and setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getRate() {
        return rate;
    }

    public void setRate(String rate) {
        this.rate = rate;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public String getSuggestion() {
        return suggestion;
    }

    public void setSuggestion(String suggestion) {
        this.suggestion = suggestion;
    }
  
}
