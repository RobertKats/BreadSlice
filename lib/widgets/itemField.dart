import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';





class ItemField extends StatelessWidget {

    final TextEditingController item;
    final TextEditingController price;
    ItemField({
      this.item, 
      this.price
      });
      //assert(item != null),
    //  assert(price != null);
     // item = new TextEditingController(),
      //price = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return _fip();
  }
  Widget _fip(){
      return Container(
        constraints: BoxConstraints(
            maxWidth: 380,
            minWidth: 380,
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
          child: _theRow(),
        )
      );
  }

  Widget _theRow(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _item(),
          _price(),
        ],
    );
  }
  Widget _item(){
    return Flexible(
      child: Container(
        alignment: Alignment.center,
      constraints: BoxConstraints(
            maxWidth: 300,
            minWidth: 300,
            minHeight: 30,
            maxHeight: 30,
        ),
      color: Color(0xFF770732),
      child: TextField(
        controller: item,
        style: TextStyle(
          color: Colors.white
        ),
        decoration: null
      ),
    )
    );

  }
   Widget _price(){
    return Flexible(
      
        child: Container(
          alignment: Alignment.center,
          constraints: BoxConstraints(
            maxWidth: 100,
            minWidth: 100,
            minHeight: 30,
            maxHeight: 30,
        ),
          color: Color(0xFF770732),
          child: TextField(
            controller: price,
            keyboardType: TextInputType.number,
            style: TextStyle(
             color: Colors.white
              ),
            decoration: InputDecoration(
              border: InputBorder.none, 
              isDense: true,
              //labelText: "Item"
            )
          ),
          ),
    );
  }


}


class Design extends StatelessWidget{
    
  final Widget testingWidget;
  @override
  Design({this.testingWidget});
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(),
        backgroundColor: Colors.red,
        body:  testingWidget,
    );
  }
}