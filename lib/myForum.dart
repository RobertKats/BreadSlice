import 'package:flutter/material.dart';
import 'package:breadslice/widgets/itemField.dart';
import 'package:breadslice/widgets/userField.dart';


class userData{
  TextEditingController user = new TextEditingController();
  String price="";
  
}
class itemData{
  TextEditingController item = new TextEditingController();
  TextEditingController price = new TextEditingController();
  List<userData> subList = new List<userData>();
}

class MyForum extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MyForumState();

}
class MyForumState extends State<MyForum>{

  List<itemData> itemList = new List<itemData>();
  @override
  void initState() {
    itemList.add(itemData());
    super.initState();
  }
  void _update(){
        Calculations(itemList).calculate();
        // setState(() {
          
        // });
  }
  @override
  Widget build(BuildContext context) {
    print("update");
    _update();
    //_update();
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.ac_unit),
            onPressed: (){
                _update();
                setState(() {});
            },
          ),
        ],
      ),
      body: _mainList(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          itemList.add(itemData());
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
          Center (child:_subList(itemList[i].subList),)
        ],
    );
  }
  Widget _subList(List<userData> sublist){
      return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemBuilder:(context,i){
          if( sublist.length== i){
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  shape: CircleBorder(),
                  child: Icon(Icons.remove),
                  onPressed: (){
                    if(sublist.length != 0)
                      sublist.removeLast();
                     // sublist[item].removeLast();
                      setState(() { });
                  },
                ),

                RaisedButton(
                  shape: CircleBorder(),
                  child: Icon(Icons.add),
                  onPressed: (){
                      sublist.add(userData());
                      setState(() { });
                  },
                ),
              ],
            );
            
          }
         return Column(
           
           children: <Widget>[
              Padding( padding: EdgeInsets.all(1),),
                UserField(user: sublist[i].user ,price: sublist[i].price,)
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
        itemCount: sublist.length+1,
      );
  }
  Widget _mainList(){
      return ListView.builder(
        itemBuilder: (context,i){
          if(itemList.length == i){
            //print("boop");
            return null;
          }
            return _body(i);
        },
        itemCount: itemList.length+1,
      );
  } 

}

class Calculations{

  List<itemData> itemList;
  Calculations(this.itemList);
  void calculate(){
      double tax = 0.0;
      if(itemList.last.item.text == "tax"){
          if(itemList.last.price.text != null && itemList.last.price.text !=""){
              tax = double.parse(itemList.last.price.text);
          }           
        }

      for (var item in itemList) {
        if(item.subList.isEmpty){
          return;
        }
        int userCount = item.subList.length;
        tax = tax/userCount;
        if(item.price.text == null || item.price.text == ""){
          return;
        }
        //print("${item.price.text}");  
        var price;
        try{
         price = double.parse(item.price.text)/userCount;
        }on FormatException{
          return;
        }
        price = price + tax;
        for (var user in item.subList) {
           user.price = price.toStringAsFixed(2);
        }
      }
  }  

}