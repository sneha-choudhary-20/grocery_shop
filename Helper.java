package com.grocery.shop.helper;

public class Helper {
    
  //method to get desc by 10 words in home page
  public static String get10Words(String desc)
  {
      String[] strs=desc.split(" ");
      if(strs.length>10)
      {
          String res="";
          for(int i=0;i<10;i++)
          {
              res=res+strs[i]+ " ";
          }
          return(res+ "...");
      }else
      {
          return(desc+ "....");
      }
  }
}
