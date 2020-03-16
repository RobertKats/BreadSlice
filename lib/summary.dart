import 'package:breadslice/widgets/totalSummary.dart';
import 'package:flutter/material.dart';
import 'package:breadslice/SaveingData.dart';
import 'package:breadslice/widgets/userSummary.dart';


class Summary extends StatelessWidget{
    
    final TotalData totalData;
    //final List<Users> users;
    final Map<String,double> users;
    Summary({this.totalData,this.users});
  
  @override
  Widget build(BuildContext context) {
        return Scaffold(
            appBar: new AppBar(),
           // backgroundColor: Colors.red,
            body:  Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    child:UserSummary(users) ,
                ),
                  
                  TotalSummary(
                    tax: totalData.tax.text,
                    tip: totalData.tip.text,
                    delivery: totalData.delivery.text,
                    total: totalData.total.text,
                    subtotal: totalData.subTotal,
                  )
              ],
            ),
        );
      }
  
}
