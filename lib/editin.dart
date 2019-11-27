
import 'package:flutter/material.dart';
import 'package:breadslice/widgets/itemField.dart';
import 'package:breadslice/widgets/userField.dart';

class FieldInfo {
  FieldInfo({this.user, this.price});
  TextEditingController price;
  TextEditingController user;
}

class MyForum extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MyForumState();

}
class MyForumState extends State<MyForum>{

  List<ItemField> items = new List<ItemField>();
  Map<ItemField,List<FieldInfo>> subList = Map<ItemField,List<FieldInfo>>();
  @override
  void initState() {
    var item = new TextEditingController();
    var price = new TextEditingController();
    var first = ItemField(item: item, price: price,);
    items.add(first);
    var sublistone =new List<FieldInfo>();
    sublistone.add( FieldInfo(price:  new TextEditingController() ,user: new TextEditingController()));
    subList[first] = sublistone;


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print("update");
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.ac_unit),
            onPressed: (){
              Calculations(items,subList).calculate();
              setState(() {

              });
              var a = items[0].item.text;
              var b = items[0].price.text;
              // var b = subList[items[0]][0].user.text;
              print(a);
              print(b);
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
          subList[itemObj] = new List<FieldInfo>();
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
          print("boop");
          return RaisedButton(
            shape: CircleBorder(),
            child: Icon(Icons.add),
            onPressed: (){
              subList[item].add(new FieldInfo(user: new TextEditingController()));
              setState(() { });
            },
          );
        }



        return Column(
          children: <Widget>[
            Padding( padding: EdgeInsets.all(1),),
          UserField(
            price: subList[item][i].price,
            user: subList[item][i].user,
          ),
          //  subList[item])[i],
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
  Map<ItemField,List<FieldInfo>> subList;
  Calculations(this.items,this.subList);

  void calculate(){
    for (var item in items) {
      int userCount = subList[item].length;
      print(double.parse(item.price.text));
      var price = double.parse(item.price.text)/userCount;
      item.item.text = "ha";
      for (var user in subList[item]) {
        user.price.text = "fucl";
        //user = new UserField(user: user.user,price: user.price,);
        // user.user.text = "fuck";
        //user.price.text = price.toString();
      }
    }
  }

}