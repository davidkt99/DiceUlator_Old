import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:flutter/services.dart' ;
import 'Data/Database.dart';
import 'Pages/Dice_Calc_Page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //  DataBase
  //StartDatabase();                    SQLite
  DataBaseInit();
  Printbox(box);

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
      home: Dice_Calc_Page(),
    );
  }
}
