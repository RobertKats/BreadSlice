
import 'package:flutter/material.dart';



class Router extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text("Testing Page"),
        ),
        body: _rowOfButtons(context),
    );
  }

  Widget _rowOfButtons(BuildContext context){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _myButton(context, "ForumPage","/forum"),
          _myButton(context, "ItemDesign","/Design"),
          _myButton(context, "Fina","/Fina")
        ],
      );
  }

  Widget _myButton(BuildContext context,String name,String route){
      return RaisedButton(
          child: Text(name),
          onPressed: () => Navigator.pushNamed(context,route ),
      );
  }

}
