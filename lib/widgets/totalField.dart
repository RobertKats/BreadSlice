import 'package:flutter/material.dart';
import 'package:breadslice/widgets/itemField.dart';
import 'package:breadslice/widgets/userField.dart';

class TotalField extends StatelessWidget {
  final TextEditingController total;
  final TextEditingController tax;
  final TextEditingController tip;
  final TextEditingController delivery;

  TotalField({
    this.total,
    this.tax,
    this.tip,
    this.delivery,
  });

  @override
  Widget build(BuildContext context) {
    return _itemField();
  }

  Widget _itemField() {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: _totalItemField(),
        ),
        Padding(
          padding: EdgeInsets.all(1),
        ),
        Center(
          child: _modItemField("Tax", tax),
        ),
        Padding(
          padding: EdgeInsets.all(1),
        ),
        Center(
          child: _modItemField("Tip", tip),
        ),
        Padding(
          padding: EdgeInsets.all(1),
        ),
        Center(
          child: _modItemField("Delivery", delivery),
        ),
        Padding(
          padding: EdgeInsets.all(1),
        ),
      ],
    );
  }

  Widget _totalItemField() {
    return ItemField(
      readOnlyItem: true,
      readOnlyPrice: true,
      item: TextEditingController(text: "Total"),
      price: total,
    );
  }

  Widget _modItemField(String text, TextEditingController controller) {
    return ItemField(
      readOnlyItem: true,
      price: controller,
      item: TextEditingController(text: text),
      //color: Colors.blue,
      constraints: BoxConstraints(
        maxWidth: 340,
        minWidth: 340,
        minHeight: 40,
        maxHeight: 40,
      ),
    );
  }
}
