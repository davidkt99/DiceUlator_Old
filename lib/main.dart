import 'package:flutter/material.dart';
import 'Data/Database.dart';
import 'package:flutter/services.dart' ;

import 'Pages/Dice_Calc_Page.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  DataBase
    StartDatabase();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Diculator',
      theme: ThemeData.dark().copyWith(
      ),
      home: Dice_Calc_Page(),
    );
  }
}
