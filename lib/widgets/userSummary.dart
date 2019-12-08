import 'package:flutter/material.dart';
import "package:breadslice/myForum.dart";





class UserSummary extends StatelessWidget{

  //final List<Users> users;
    final Map<String,double> users;
   UserSummary(this.users);
  @override
  Widget build(BuildContext context) {
    return Center(child:_userBubble());
  }

  Widget _userBubble(){
      return Container(
        constraints: BoxConstraints(
            maxWidth: 260,
            minWidth: 40,
            minHeight: 40,
           // maxHeight: 40,
        ),
        decoration: BoxDecoration(
          color: Color(0xFF770732),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          //border: Border.all(),
        ),
        child: _summery(),
      );
  }
  Widget _summery(){
    List<String> userNames = users.keys.toList();
      return ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context,i){
          if(i==0) return Padding(padding: EdgeInsets.only(top: 10),
            child: _userSum(userNames[i],users[userNames[i]]),
          );
          if(i==users.length-1) return Padding(padding: EdgeInsets.only(bottom: 10),
            child: _userSum(userNames[i],users[userNames[i]]),
          );
          return _userSum(userNames[i],users[userNames[i]]);
        },
        itemCount: userNames.length ,
        
      );
  }
  Widget _userSum(String user,double price){
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
           // color: Colors.red,            
           // border: Border.all(),
            ),
            constraints: BoxConstraints(
            maxWidth: 140,
            minWidth: 140,
            //minHeight: 20,
            //maxHeight: 20,
            ),
            child: _user(user) ,
          ),
         Container(
        padding: EdgeInsets.only(right: 10) ,
        child: _price(price),
    ),
        ],
      );
  }

  Widget _user(String user){
      return Text(user,
        style: TextStyle(
            color: Colors.white,
            fontSize: 20,
        ),
      );
  }
  Widget _price(double price){
    return Text(price.toStringAsFixed(2),
        style: TextStyle(
            color: Colors.white,
            fontSize: 20,
        ),
      );
  }
  
}