import 'package:flutter/material.dart';
import 'package:breadslice/widgets/itemField.dart';
import 'package:breadslice/widgets/userField.dart';


class MyForum extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MyForumState();

}
class MyForumState extends State<MyForum>{

  List<ItemField> items = new List<ItemField>();
  Map<ItemField,List<UserField>> subList = Map<ItemField,List<UserField>>();
  @override
  void initState() {
    var item = new TextEditingController();
    var price = new TextEditingController();
    var first = ItemField(item: item, price: price,);
    items.add(first);
     var sublistone =new List<UserField>();
    //sublistone.add(new UserField(price:  new TextEditingController() ,user: new TextEditingController()));
    subList[first] = sublistone;
    
    
    super.initState();
  }
  void _update(){
        Calculations(items,subList).calculate();
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
          var item = new TextEditingController();
          var price = new TextEditingController();
          var itemObj = ItemField(item: item, price: price,);
          items.add(itemObj);
          subList[itemObj] = new List<UserField>(); 
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
          Center (child: items[i]),
          Padding( padding: EdgeInsets.all(2),),
          Center (child:_subList(items[i])),
        ],
    );
  }
  Widget _subList(ItemField item){
      return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemBuilder:(context,i){
          if( subList[item].length== i){
            //print("boop");
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  shape: CircleBorder(),
                  child: Icon(Icons.remove),
                  onPressed: (){
                    if(subList[item].length != 0)
                      subList[item].removeLast();
                      setState(() { });
                  },
                ),

                RaisedButton(
                  shape: CircleBorder(),
                  child: Icon(Icons.add),
                  onPressed: (){
                      subList[item].add(new UserField(user: new TextEditingController(), price: new TextEditingController(),));
                      setState(() { });
                  },
                ),
              ],
            );
            
          }
         return Column(
           children: <Widget>[
              Padding( padding: EdgeInsets.all(1),),
              (subList[item])[i],
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
        itemCount: subList[item].length+1,
      );
  }
  Widget _mainList(){
      return ListView.builder(
        itemBuilder: (context,i){
          if(items.length == i){
            //print("boop");
            return null;
          }
            return _body(i);
        },
        itemCount: items.length+1,
      );
  } 

}

class Calculations{

  List<ItemField> items;
  Map<ItemField,List<UserField>> subList;
  Calculations(this.items,this.subList);

  void calculate(){
      for (var item in items) {
        int userCount = subList[item].length;
        if(item.price.text == null || item.price.text == ""){
          return;
        }
        var price = double.parse(item.price.text)/userCount;
        //item.item.text = "ha";
        for (var user in subList[item]) {
           // user = new UserField(user: user.user,price: user.price,);
             user.price.text = price.toString();
        }
      }
  }  

}