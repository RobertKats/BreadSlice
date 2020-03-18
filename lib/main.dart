
import 'package:breadslice/SavePage.dart';
import 'package:breadslice/magic.dart';
import 'package:flutter/material.dart';
import 'package:breadslice/Design.dart';
import 'package:breadslice/testingPage.dart';
import 'package:breadslice/myForum.dart';
import 'package:breadslice/summary.dart';
import 'package:breadslice/finance/financePage.dart';
import 'package:breadslice/finance/financePage.dart';
import 'package:breadslice/homePage.dart';


void main() => runApp(MyApp());
// void main(){
//     Magic.createDbFolder();
//     print("app startup");
//     runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    '/Router': (BuildContext context) => new Router(),
    '/Design': (BuildContext context) => new Design(),
    '/': (BuildContext context) => new HomePage(),
    '/savePage':(BuildContext context) => new SavedPage(),
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
          theme: ThemeData(
              //canvasColor: Color(0x00D4E9F0),
              primaryColor: Color(0xFF770732),
              accentColor: Color(0xFF770732),
          ),              
          
      );
    

  }
}