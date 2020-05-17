import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';

class ItemField extends StatelessWidget {
  final TextEditingController item;
  final bool readOnlyItem;
  final TextEditingController price;
  final bool readOnlyPrice;
  final BoxConstraints constraints;
  final Color color;
  ItemField({
    this.item,
    this.readOnlyItem = false,
    this.price,
    this.readOnlyPrice = false,
    this.constraints = const BoxConstraints(
      maxWidth: 380,
      minWidth: 380,
      minHeight: 40,
      maxHeight: 40,
    ),
    this.color = const Color(0xFF770732),
  });

  @override
  Widget build(BuildContext context) {
    return _fip();
  }

  Widget _fip() {
    return Container(
        constraints: constraints,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          //border: Border.all(),
        ),
        child: new Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: _theRow(),
        ));
  }

  Widget _theRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _item(),
        _price(),
      ],
    );
  }

  Widget _item() {
    return Flexible(
        child: Container(
      alignment: Alignment.center,
      constraints: BoxConstraints(
        maxWidth: 300,
        minWidth: 300,
        minHeight: 30,
        maxHeight: 30,
      ),
      // color: Colors.red,//Color(0xFF770732),
      child: TextField(
          readOnly: readOnlyItem,
          controller: item,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              border: InputBorder.none,
              isDense: true,
              hintText: 'Item',
              hintStyle: TextStyle(
                color: Colors.grey,
                inherit: false,
              ))),
    ));
  }

  Widget _price() {
    return Flexible(
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints(
          maxWidth: 100,
          minWidth: 100,
          minHeight: 30,
          maxHeight: 30,
        ),
        //color: Colors.red,//Color(0xFF770732),
        child: TextField(
            readOnly: readOnlyPrice,
            controller: price,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                border: InputBorder.none,
                isDense: true,
                hintText: 'Cost',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  inherit: false,
                ))),
      ),
    );
  }
}
