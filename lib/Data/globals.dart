import 'package:flutter/material.dart';

/// Database Variables
// init of box variable
var box;

//DATABASE box name
String box_name = 'diceulator_data';

int CurrInst = 0;

int OldListSize = 25;

List OldRolls = [];
String CurRolls = '';

List<List> Inst_OldRolls = [[],[],[],[],[],[],[],[],[],[]];
List<List> Inst_OldAns = [[],[],[],[],[],[],[],[],[],[]];
List<List> Inst_OldEqu = [[],[],[],[],[],[],[],[],[],[]];
List Inst_CurEqu = ['','','','','','','','','','',];
List Inst_CurAns = ['','','','','','','','','','',];
List Inst_CurRolls = ['','','','','','','','','','',];

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
