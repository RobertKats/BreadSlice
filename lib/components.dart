


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

  static Widget myDrawer(Function onSavePressed){
    return Drawer(
        child: Container(
          alignment: Alignment.center,
          child: FlatButton(
            color: Colors.red,
            child: Text("Save Page"),
            onPressed: onSavePressed,
            ),
          ),
      );
  }



}