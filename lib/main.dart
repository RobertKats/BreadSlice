import 'package:breadslice/widgets/userField.dart';
import 'package:flutter/material.dart';
//import 'package:breadslice/cashMoney.dart';
import 'package:breadslice/testingPage.dart';
import 'package:breadslice/widgets/itemField.dart';
import 'package:breadslice/myForum.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    '/': (BuildContext context) => new Router(),
    '/ItemField': (BuildContext context) => new UserField(),
    '/forum': (BuildContext context) => new MyForum(),
  };
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
          routes: routes,
          title: 'IOU',
          //theme: ThemeData(

          //),
      );
    

  }
}