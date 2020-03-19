import 'package:breadslice/magic.dart';
import 'package:breadslice/widgets/TotalField.dart';
import 'package:breadslice/widgets/userSummary.dart';
import 'package:flutter/material.dart';
import 'package:breadslice/widgets/itemField.dart';
import 'package:breadslice/widgets/userField.dart';
import 'package:breadslice/summary.dart';
import 'package:breadslice/SaveingData.dart';
import 'package:breadslice/SavePage.dart';
import 'package:breadslice/components.dart';
import 'package:breadslice/Calculations.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';




class MyForum extends StatefulWidget{
  final List<ItemData> itemList;
  final TotalData totalData;
  MyForum({List<ItemData> itemList,TotalData totalData}):
    itemList = itemList ?? new List<ItemData>(),
    totalData = totalData ?? new TotalData();
  @override
  State<StatefulWidget> createState() => MyForumState(this.itemList,this.totalData);

}
class MyForumState extends State<MyForum>{
  List<ItemData> itemList;
  TextEditingController saveFile;
  TotalData totalData;
  Map<String,double> users;
  Calculations cal;

  MyForumState(List<ItemData> itemList, TotalData totalData):
  this.itemList = itemList,
  this.saveFile = new TextEditingController(),
  this.totalData = totalData,
  this.users = new Map<String,double>(),
  this.cal = new Calculations(itemList,totalData);

  @override
  void initState() {
    KeyboardVisibilityNotification().addNewListener(
      onHide:(){
        FocusScope.of(context).unfocus();
      }
    );
    if(itemList.length == 0){
      var _data = ItemData();
        _data.subList.add(UserData());
        itemList.add(_data);
    }else{
        _update(context);
    }
    super.initState();
  }
  void _update(BuildContext context){
        cal.calculate();
        users = cal.users;
       // var a = new Calculations(itemList,totalData);

  }
  @override
  Widget build(BuildContext context) {
    //print("update");
    _update(context);
    //_update();
    return Scaffold(
      appBar: MyComponents.myAppBar((){
            _displayDialog(context);
      }),
      drawer: MyComponents.myDrawer(context),
      body: GestureDetector(
        child: _mainList(),
        onTap: (){
          // print("yoo");
           FocusScope.of(context).unfocus();
        },
      ),
      floatingActionButton: FloatingActionButton(
       child: Icon(Icons.add),
        onPressed: (){
                _update(context);
                var _data = ItemData();
                _data.subList.add(UserData());
                itemList.add( _data);                
                setState(() {       
                });
        },
        ),
    );
  }

   _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Enter a save name'),
            content: TextField(
            
              controller: saveFile,
              decoration: InputDecoration(hintText: "File name"),
            ),
            actions: <Widget>[
              new FlatButton(
                onPressed: (){
                  if(saveFile.text == "" || saveFile.text == null) Navigator.of(context).pop();
                  print(saveFile.text);
                  
                  SaveingData.saveData(new IOUData(totalData: totalData, itemData: itemList),saveFile.text);
                  saveFile.text = "";
                  Navigator.of(context).pop();
                }, 
                child: Text("Save")
                ),
              new Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0)
              ),
              new FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
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
                    if(item.subList.length > 1)
                      item.subList.removeLast();                    
                    else if(itemList.length > 1){
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
           
            return _costDataAndDoneButton();
          }
            return _body(i);
        },
        itemCount: itemList.length+1,
      );
  } 

  Widget _costDataAndDoneButton(){
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
             Padding(
              padding: EdgeInsets.only(top: 15,bottom: 15),
              child: TotalField(
                total: totalData.total,
                tax: totalData.tax,
                tip: totalData.tip,
                delivery: totalData.delivery,
               ),
              ),
          Padding(
            padding: EdgeInsets.only(top: 15,bottom: 100),
            child: RawMaterialButton(
              fillColor: Theme.of(context).buttonColor,
              child: Text("Done",
                  style: TextStyle(
                  fontSize: 18
                ),
              ),
              constraints: BoxConstraints(
                minHeight: 40,
                minWidth: 200
              ),
              shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                       ),
                    
              onPressed: (){
                          _update(context);
                            Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Summary(users: users, totalData: totalData,),
                            ));        
                            },
              

              ),
            ),
        ],
      );
  }

}
