import 'package:flutter/material.dart';

/// Database Variables
// init of box variable
var box;

//DATABASE box name
String box_name = 'diceulator_data';

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
Color BackGround = Colors.black54;
Color TextColor = Colors.white;
Color ShadowColor = Colors.purple[600];


//rand other stuff
int clearCount = 0;

//  Shadows used
/*
boxShadow: [
BoxShadow(
color: globals.BackGround,
blurRadius: 4.0,
offset:
Offset(2.0, 2.0), // shadow direction: bottom right
),
],
 */
