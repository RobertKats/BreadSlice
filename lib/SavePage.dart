import 'package:flutter/material.dart';
import 'package:breadslice/SaveingData.dart';
import 'package:breadslice/magic.dart';



class SavedPage extends StatefulWidget{
    @override
    State<StatefulWidget> createState() => SavePageState();
}

class SavePageState extends State<SavedPage>{

    List<String> saves;

  @override
  void initState() {
    Magic.dbFileList().then((list){
      saves = list;
      setState(() {});
    });
    super.initState();
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          body: Container(
              alignment: Alignment.center,
              child: _myBody()
          ) ,
      );
    }

    Widget _myBody(){
        if(saves == null) return Text("loading");
        else return _list();
    }
    Widget _list(){
        return ListView.builder(
          itemBuilder: (context,i){
            return new Text(saves[i]);
          },
          itemCount: saves.length,
          );
    }

}