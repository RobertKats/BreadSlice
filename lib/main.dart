import 'package:flutter/material.dart';
import 'package:breadslice/cashMoney.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    '/': (BuildContext context) => new MyForum(),
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