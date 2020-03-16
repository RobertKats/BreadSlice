import 'package:flutter/material.dart';
import 'package:breadslice/magic.dart';
import 'dart:convert';






class ItemDataList {
  List<ItemData> itemData;

    static ItemDataList itemDataListFromJson(String str) => ItemDataList.fromJson(json.decode(str));

    static String itemDataListToJson(List<ItemData> data) => json.encode(toJson(data));



  ItemDataList({
    this.itemData,
  });

  factory ItemDataList.fromJson(Map<String, dynamic> json) => ItemDataList(
        itemData: List<ItemData>.from(
            json["ItemData"].map((x) => ItemData.fromJson(x))),
      );

  static Map<String, dynamic> toJson(List<ItemData> itemData) => {
        "ItemData": List<dynamic>.from(itemData.map((x) => x.toJson())),
      };
}


class SaveingData{

      void test(List<ItemData> a) async{
        // print("just a test for now");
        // //String mydata = a.toJson().toString();
        // String mydata = ItemData.itemDataToJson(a);
        // print(mydata);
        // var out = ItemData.itemDataFromJson(mydata);
        //saveData(a);
      }

      void saveData(List<ItemData> itemList) async{
        String data = ItemDataList.itemDataListToJson(itemList);
        Magic.createDbFolder();       
        await Magic.writeData(data, "test",type: "db");
        var a = await Magic.dbFileList();
        a.forEach(print);
        print("data writen");
      }
      static Future<List<ItemData>> loadData() async{
          String data = await Magic.readData("test",type:"db");
          var out = ItemDataList.itemDataListFromJson(data).itemData;
          return out;
      }




}





class UserData{
  TextEditingController user = new TextEditingController();
  String price="";
  UserData({String user}){
      this.user.text = user;
    }

  
}
class ItemData{
    // String itemS;
    // String priceS;
    // List<String> users;
    TextEditingController item = new TextEditingController();
    TextEditingController price = new TextEditingController();
    List<UserData> subList = new List<UserData>();

    static ItemData itemDataFromJson(String str) => ItemData.fromJson(json.decode(str));
    static String itemDataToJson(ItemData data) => json.encode(data.toJson());
    // ItemData({
    //     this.itemS,
    //     this.priceS,
    //     this.users,
    // });
    ItemData({String itemS,String priceS,List<String> users}){
          this.item.text = itemS;
          this.price.text = priceS;
          this.subList = new List<UserData>();
           if(users != null) users.forEach((x) => subList.add(new UserData(user:x)));
    }


    factory ItemData.fromJson(Map<String, dynamic> json) => ItemData(
    itemS: json["item"],
    priceS: json["price"],
    users: List<String>.from(json["users"].map((x)=>x)),
    );

    Map<String, dynamic> toJson() => {
        'item': item.text,
        "price": price.text,
        "users": List<dynamic>.from(subList.map((x) => x.user.text)),
    };
    
}
class TotalData{
    TextEditingController total = new TextEditingController();
    TextEditingController tax = new TextEditingController();
    TextEditingController tip = new TextEditingController();
    TextEditingController delivery = new TextEditingController();
    String subTotal;
}
