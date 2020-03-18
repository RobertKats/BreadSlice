


import 'package:flutter/material.dart';

class MyComponents{


  static Widget myAppBar(Function saveButtonOnPressed,{String title})
  {
    String _title = title ?? "IOU";
    return AppBar(
        title: Text(_title,
          ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed:saveButtonOnPressed,
          ),
        ],
      );
  }

  static Widget myDrawer(BuildContext context){
    return Drawer(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                FlatButton(
                  color: Colors.red,
                  child: Text("IOU Builder"),
                  onPressed: (){
                    Navigator.pushReplacementNamed(context,"/");
                  },
                  ),
                  FlatButton(
                  color: Colors.red,
                  child: Text("Save Page"),
                  onPressed: (){
                      Navigator.pushReplacementNamed(context,"/savePage");
                  },
                  ),
                
                  
            ],
          ),
          ),
      );
  }



}