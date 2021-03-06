import 'package:breadslice/myForum.dart';
import 'package:breadslice/widgets/totalSummary.dart';
import 'package:flutter/material.dart';
import 'package:breadslice/SaveingData.dart';
import 'package:breadslice/widgets/userSummary.dart';


class Summary extends StatelessWidget{
    //TODO: Remake the summary page as a widget component and then wrap that in a view 
    final TotalData totalData;
    //final List<Users> users;
    final Map<String,double> users;
    final List<ItemData> itemList;
    Summary({this.itemList,@required this.totalData,@required this.users});
  
  @override
  Widget build(BuildContext context) {
        return Scaffold(
            appBar: new AppBar(
            actions: <Widget>[
                new IconButton(
                  icon: Icon(Icons.edit),
                   onPressed: (){
                     Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(
                            builder: (context) =>MyForum(itemList: itemList, totalData: totalData,),
                            ),                     
                      ModalRoute.withName ('/'));
                   }
                   ),
            ],
            ),
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
