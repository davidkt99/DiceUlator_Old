import 'package:flutter/material.dart';
import 'Data/Database.dart';

import 'Pages/Dice_Calc_Page.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StartDatabase();
    return MaterialApp(
      title: 'Diculator',
      theme: ThemeData.dark().copyWith(

      ),
      home: Dice_Calc_Page(),
    );
  }
}
