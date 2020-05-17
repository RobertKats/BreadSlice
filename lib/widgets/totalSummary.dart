import 'package:flutter/material.dart';

class TotalSummary extends StatelessWidget {
  final String subtotal;
  final String tax;
  final String tip;
  final String delivery;
  final String total;

  TotalSummary(
      {Key key, this.subtotal, this.tax, this.tip, this.delivery, this.total})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _total();
  }

  Widget _total() {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 260,
        minWidth: 40,
        minHeight: 40,
        // maxHeight: 40,
      ),
      decoration: BoxDecoration(
          //color: Color(0xFF770732),
          //border: Border.all(),
          ),
      child: _info(),
    );
  }

  Widget _info() {
    return Column(
      children: <Widget>[
        _infoRow("Subtotal", subtotal),
        _infoRow("Tax", tax),
        _infoRow("Tip", tip),
        _infoRow("Delivery", delivery),
        _infoRow("Total", total),
      ],
    );
  }

  Widget _infoRow(String item, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 30),
        ),
        Text(
          item,
          style: TextStyle(fontSize: 20),
        ),
        Padding(
          padding: EdgeInsets.only(right: 25),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Text(
            price,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
