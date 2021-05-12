import 'package:flutter/material.dart';

import 'Pages/Dice_Calc_Page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Dice_Calc_Page(Calc_Inst_Name: 'Main Instance'),
    );
  }
}
