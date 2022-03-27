import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:flutter/services.dart' ;
import 'Data/Database.dart';
import 'Pages/Dice_Calc_Page.dart';
import 'Data/globals.dart' as globals;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //  DataBase
  //StartDatabase();                    SQLite
  await DataBaseInit();
  Printbox(globals.box);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Diculator',
      theme: ThemeData.dark().copyWith(
      ),
      home: DiceCalcPage(),
    );
  }


}
