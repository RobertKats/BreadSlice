import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:breadslice/widgets/itemField.dart';



class UserField extends StatelessWidget {

  //final TextEditingController price;
  final String price;
  final TextEditingController user;
  UserField({
  this.price,
  this.user
  });

  @override
  Widget build(BuildContext context) {
    return _userBox();
  }

 Widget _userBox(){
      return Container(
        constraints: BoxConstraints(
            maxWidth: 340,
            minWidth: 340,
            minHeight: 40,
            maxHeight: 40,
        ),
        decoration: BoxDecoration(
          color: Color(0xFF770732),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          //border: Border.all(),
        ),
        child: new Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: _userRow(),
        )
      );
  }

   Widget _userRow(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
         _user(),
         _price()
      ],
    );
  }

  Widget _user(){
    return Flexible(
          child: Container(
            alignment: Alignment.center,
          constraints: BoxConstraints(
                maxWidth: 235,
                minWidth: 235,
                minHeight: 30,
                maxHeight: 30,
            ),
          color: Color(0xFF770732),
          child: TextField(
            controller: user,
            style: TextStyle(
              color: Colors.white
            ),
            decoration: null
          ),
        )
        );

  }
  Widget _price(){
    return Container(
         alignment: Alignment.center,
          constraints: BoxConstraints(
            maxWidth: 70,
            minWidth: 70,
            minHeight: 30,
            maxHeight: 30,
        ),
          color: Color(0xFF770732),
          child: Text((( price == null) ? "" : price),
              style: TextStyle(
                fontSize: 16,
                color: Colors.white
              ),
            )
          );
  }


}

