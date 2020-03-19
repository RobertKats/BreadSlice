import 'package:breadslice/myForum.dart';
import 'package:breadslice/summary.dart';
import 'package:flutter/material.dart';
import 'package:breadslice/SaveingData.dart';
import 'package:breadslice/magic.dart';
import 'package:breadslice/components.dart';
import 'package:breadslice/Calculations.dart';



class SavedPage extends StatefulWidget{
    @override
    State<StatefulWidget> createState() => SavePageState();
}

class SavePageState extends State<SavedPage>{

    List<String> saves;
    String dbPath;

  @override
  void initState() { 

    Magic.localDbDir.then((path){
      dbPath = path.path;
    });
    Magic.dbFileList().then((list){
      saves = list;
      setState(() {});
    });
    super.initState();
  }

    @override
    Widget build(BuildContext context) {
      return WillPopScope(child: Scaffold(
                            drawer: MyComponents.myDrawer(context),
                            appBar:AppBar(
                              leading: null,
                              title: Text("Saved Receipt"),
                            ),
                              body: Container(
                                  alignment: Alignment.center,
                                  child: _myBody()
                              ) ,
                          ), 
              onWillPop: () async =>Navigator.canPop(context), // can I pop this route ?
              );
    }

    Widget _myBody(){
        if(saves == null) return Text("loading");
        else return _list();
    }
    Widget _list(){ 
        return ListView.builder(
          itemBuilder: (context,i){
            return _myButton(saves[i]);
          },
          itemCount: saves.length,
          );
    }
    Widget _myButton(String fullPath){    
      String file = fullPath.replaceRange(0, dbPath.length+1,"");//fullPath.replaceAll(dbPath, "");
      return FlatButton(
        onPressed: ()async{
            var iouData = await SaveingData.loadData(file);//Magic.readData(file,type:"db");
            var cal = Calculations(iouData.itemData,iouData.totalData);
            cal.calculate();
            Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>Summary(itemList: iouData.itemData , totalData: iouData.totalData ,users: cal.users,),
                        ));
        }, 
        child: new Text(file));
    }

}