import 'package:breadslice/widgets/totalSummary.dart';
import 'package:flutter/material.dart';
import 'package:breadslice/widgets/itemField.dart';
import 'package:breadslice/widgets/userField.dart';
import 'package:breadslice/widgets/totalField.dart';
import 'package:breadslice/widgets/userSummary.dart';


class Design extends StatelessWidget{

  
  @override
  Widget build(BuildContext context) {
        return Scaffold(
            appBar: new AppBar(),
           // backgroundColor: Colors.red,
            body:  Column(
              children: <Widget>[
                 // UserSummary(),
                  TotalSummary(
                    tax: "10",
                    tip: "10",
                    delivery: "10",
                    total: "10",
                    subtotal: "10",
                  )
              ],
            ),
        );
      }
  
}
