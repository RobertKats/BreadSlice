
import 'package:flutter/material.dart';
import 'package:breadslice/Design.dart';
import 'package:breadslice/testingPage.dart';
import 'package:breadslice/myForum.dart';
import 'package:breadslice/summary.dart';
import 'package:breadslice/finance/financePage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    '/forum': (BuildContext context) => new Router(),
    '/Design': (BuildContext context) => new Design(),
    '/': (BuildContext context) => new MyForum(),
    '/summary': (BuildContext context) => new Summary(),
    '/Fina': (BuildContext context) => new FinancePage(),
  };
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: routes,
          title: 'IOU',
          //theme: ThemeData(

          //),
      );
    

  }
}