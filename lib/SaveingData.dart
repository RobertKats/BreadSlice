import 'package:flutter/material.dart';
import 'package:breadslice/magic.dart';
import 'dart:convert';






class IOUData {
    List<ItemData> itemData;
    TotalData totalData;
    static IOUData iouDataFromJson(String str) => IOUData.fromJson(json.decode(str));

    static String iouDataToJson(IOUData data) => json.encode(toJson(data));



  IOUData({
    @required
    this.totalData,
    @required
    this.itemData,
  });

  factory IOUData.fromJson(Map<String, dynamic> json) => IOUData(
        itemData: List<ItemData>.from(
            json["ItemData"].map((x) => ItemData.fromJson(x))),
        totalData: TotalData.fromJson(json["TotalData"]),
      );

  static Map<String, dynamic> toJson(IOUData data) => {
        "ItemData": List<dynamic>.from(data.itemData.map((x) => x.toJson())),
        "TotalData": data.totalData.toJson(),
      };
}


class SaveingData{
      static void saveData(IOUData mydata,String fileName) async{
        String data = IOUData.iouDataToJson(mydata);
        await Magic.createDbFolder();       
        await Magic.writeData(data, fileName,type: "db");
        var a = await Magic.dbFileList();
        a.forEach(print);
        print("data writen");
      }

      static Future<IOUData> loadData(String file) async{
          String data = await Magic.readData(file,type:"db");
          print(data);
          var out = IOUData.iouDataFromJson(data);
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

    TotalData({String tax,String tip,String delivery}){
      this.delivery.text = delivery;
      this.tip.text = tip;
      this.tax.text = tax;
    }

    factory TotalData.fromJson(Map<String, dynamic> json) => TotalData(
    tax: json["tax"],
    tip: json["tip"],
    delivery: json["delivery"],
    );

    Map<String, dynamic> toJson() => {
        'tax': tax.text,
        "tip": tip.text,
        "delivery": delivery.text
    };

    

}
