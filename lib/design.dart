import 'package:flutter/material.dart';
import 'package:breadslice/widgets/itemField.dart';
import 'package:breadslice/widgets/userField.dart';
import 'package:breadslice/widgets/totalField.dart';


class Design extends StatelessWidget{

  
  @override
  Widget build(BuildContext context) {
        return Scaffold(
            appBar: new AppBar(),
           // backgroundColor: Colors.red,
            body:  new TotalField(),
        );
      }
  
}