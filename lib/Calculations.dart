import 'package:breadslice/SaveingData.dart';
import 'package:flutter/material.dart';


class Calculations{

  List<ItemData> itemList;
  TotalData totalData;
  Map<String,double> users;

  Calculations(this.itemList,this.totalData):
  this.users = new Map<String,double>();

  double _getTaxPer(double subTotal){
    if(subTotal <= 0){
      return 0;
    }
    double tax;
    try{
        tax = double.parse(totalData.tax.text);
    }on FormatException{
          return 0;
    }
    return tax/subTotal;
  }
  
  double _getSubTotal(){
      double subTotal = 0;
      for (var item in itemList) {
        if(item.price.text == null || item.price.text == ""){
        continue;
        }
        subTotal += _textToDouble(item.price);
       }
       return subTotal;
  }
  double _textToDouble(TextEditingController a){
      double out = 0;
      try{
         out = double.parse(a.text);
        }on FormatException{
          a.text = "";
          return 0;
        }
      return out;
  }
  int _getTotalUserCount(){
        int totalUserCount = 0;
          for (var item in itemList) {            
           totalUserCount += item.subList.length;
          }
          return totalUserCount;
      }

  void calculate(){
    users.clear();
   //users = new Map<String,double>();
   
    print("cal");
      double subTotal = _getSubTotal();
      totalData.subTotal = subTotal.toStringAsFixed(2);
      double tax = _getTaxPer(subTotal);
      double trueTotal = 0;
      int totalUserCount = _getTotalUserCount();
      //print("tot: $subTotal, Tax: $tax");

      for (var item in itemList) {
        if(item.subList.isEmpty){
          continue;
        }
        int userCount = item.subList.length;
        if(item.price.text == null || item.price.text == ""){
          return;
        }
        //print("${item.price.text}");  
        double price = _textToDouble(item.price);
        print(price);
        double userPrice;
        
        userPrice = price/userCount;
        userPrice += (userPrice * tax);
        if(totalUserCount != 0){
            //print("t: $totalUserCount");
           userPrice +=  _textToDouble(totalData.tip)/totalUserCount;
           userPrice +=  _textToDouble(totalData.delivery)/totalUserCount;
        }
        //print(" ${item.item.text} :   $userPrice");
        for (var user in item.subList) {   
         // print("${user.user.text}: ${user.price}");
          user.price =  userPrice.toStringAsFixed(2);
          if( users[user.user.text] == null) users[user.user.text] = userPrice;
          else users[user.user.text] += userPrice; 
          trueTotal += userPrice;
        }
      }
      
      totalData.total.text = trueTotal.toStringAsFixed(2);
      totalData.tax.text = _textToDouble(totalData.tax).toStringAsFixed(2);
      totalData.tip.text = _textToDouble(totalData.tip).toStringAsFixed(2);
      totalData.delivery.text = _textToDouble(totalData.delivery).toStringAsFixed(2);
  }
  

}