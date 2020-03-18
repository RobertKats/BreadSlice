import 'package:breadslice/myForum.dart';
import 'package:breadslice/widgets/TotalField.dart';
import 'package:breadslice/widgets/userSummary.dart';
import 'package:flutter/material.dart';
import 'package:breadslice/widgets/itemField.dart';
import 'package:breadslice/widgets/userField.dart';
import 'package:breadslice/summary.dart';
import 'package:breadslice/SaveingData.dart';
import 'package:breadslice/SavePage.dart';



class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      
      body: MyForum(),
    );
  }
}
