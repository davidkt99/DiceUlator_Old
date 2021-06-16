import 'package:flutter/material.dart';

int CurrInst = 0;

int OldListSize = 25;

List<String> OldRolls = [];
String CurRolls = '';

List<List<String>> Inst_OldRolls = [[],[],[],[],[],[],[],[],[],[]];
List<List<String>> Inst_OldAns = [[],[],[],[],[],[],[],[],[],[]];
List<List<String>> Inst_OldEqu = [[],[],[],[],[],[],[],[],[],[]];
List<String> Inst_CurEqu = ['','','','','','','','','','',];
List<String> Inst_CurAns = ['','','','','','','','','','',];
List<String> Inst_CurRolls = ['','','','','','','','','','',];




//  Colors

Color Primary = Colors.purple[600];
Color Accent = Colors.green;
Color Secondary = Colors.white;
Color BackGround = Colors.black26;
Color TextColor = Colors.white;