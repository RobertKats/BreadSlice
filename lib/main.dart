
import 'package:flutter/material.dart';
import 'package:breadslice/SavePage.dart';
import 'package:breadslice/summary.dart';
import 'package:breadslice/homePage.dart';


void main() => runApp(MyApp());
// void main(){
//     Magic.createDbFolder();
//     print("app startup");
//     runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    '/': (BuildContext context) => new HomePage(),
    '/savePage':(BuildContext context) => new SavedPage(),
    //'/summary': (BuildContext context) => new Summary(), TODO: add a fix to have params passesd to a named Route 
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