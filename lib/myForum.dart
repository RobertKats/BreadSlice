import 'package:breadslice/widgets/TotalField.dart';
import 'package:breadslice/widgets/userSummary.dart';
import 'package:flutter/material.dart';
import 'package:breadslice/widgets/itemField.dart';
import 'package:breadslice/widgets/userField.dart';
import 'package:breadslice/summary.dart';


class UserData{
  TextEditingController user = new TextEditingController();
  String price="";
  
}
class ItemData{
  TextEditingController item = new TextEditingController();
  TextEditingController price = new TextEditingController();
  List<UserData> subList = new List<UserData>();
}
class TotalData{
    TextEditingController total = new TextEditingController();
    TextEditingController tax = new TextEditingController();
    TextEditingController tip = new TextEditingController();
    TextEditingController delivery = new TextEditingController();
    String subTotal;
}

class MyForum extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MyForumState();

}
class MyForumState extends State<MyForum>{

  List<ItemData> itemList = new List<ItemData>();
  TotalData totalData = new TotalData();
   //List<Users> users = new List<Users>();
   Map<String,double> users = new Map<String,double>();

  @override
  void initState() {
    itemList.add(ItemData());
    super.initState();
  }
  void _update(){
        Calculations(itemList,totalData,users).calculate();
        // setState(() {
          
        // });
  }
  @override
  Widget build(BuildContext context) {
    //print("update");
    _update();
    //_update();
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.ac_unit),
            onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Summary(users: users, totalData: totalData,),
                ));
                //_update();
                //setState(() {});
            },
          ),
        ],
      ),
      body: _mainList(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          itemList.add(ItemData());
          setState(() {       
          });
        },
        ),
    );
  }

  Widget _body(int i){
    return Column(
        children: <Widget>[
          Padding( padding: EdgeInsets.all(2),),
          Center(child: ItemField(item: itemList[i].item ,price:itemList[i].price ,),),
          Padding( padding: EdgeInsets.all(2),),
          Center (child:_subList(itemList[i]),)
        ],
    );
  }
  Widget _subList(ItemData item){
      return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemBuilder:(context,i){
          if( item.subList.length== i){
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  shape: CircleBorder(),
                  child: Icon(Icons.remove),
                  onPressed: (){
                    if(item.subList.length != 0)
                      item.subList.removeLast();
                    else if(itemList.length !=1){
                      itemList.remove(item);
                    }
                     // sublist[item].removeLast();
                      setState(() { });
                  },
                ),

                RaisedButton(
                  shape: CircleBorder(),
                  child: Icon(Icons.add),
                  onPressed: (){
                      item.subList.add(UserData());
                      setState(() { });
                  },
                ),
              ],
            );
            
          }
         return Column(
           
           children: <Widget>[
              Padding( padding: EdgeInsets.all(1),),
                UserField(user: item.subList[i].user ,price: item.subList[i].price,)
              //(subList[item])[i],
              // Dismissible(
              //   key: ValueKey(UniqueKey().toString()) ,
              //   child: (subList[item])[i] ,                
              //   onDismissed: (v){
              //     print("I RAN");
              //     // var a = subList[item].remove((subList[item])[i]);
              //     // print(a);
              //     setState(() {
              //     var a = subList[item].remove((subList[item])[i]);
              //     print(a);
              //     });
              //   },
              // ),
                            
           ],
           );
        },
        itemCount: item.subList.length+1,
      );
  }
  Widget _mainList(){
      return ListView.builder(
        itemBuilder: (context,i){
          if(itemList.length == i){
           
            return Padding(
              padding: EdgeInsets.only(top: 15,bottom: 100),
              child: TotalField(
                total: totalData.total,
                tax: totalData.tax,
                tip: totalData.tip,
                delivery: totalData.delivery,
              ),
              );
          }
            return _body(i);
        },
        itemCount: itemList.length+1,
      );
  } 

}

class Calculations{

  List<ItemData> itemList;
  TotalData totalData;
  Map<String,double> users;

  Calculations(this.itemList,this.totalData,this.users);

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

  }  

}