/*
import 'package:sqflite/sqflite.dart';

//Database Strings
String Inst_OldRolls_String;
String Inst_OldAns_String;
String Inst_OldEqu_String;
String Inst_CurEqu_String;
String Inst_CurAns_String;
String Inst_CurRolls_String;


//Database Functions
Future<void> StartDatabase () async {
  var db = await openDatabase('DiceUlatorDB.db');
}

// Get a location using getDatabasesPath
var databasesPath = await getDatabasesPath();
String path = join(databasesPath, 'DiceUlatorDB.db');

// Delete the database
await deleteDatabase(path);

// open the database
Database database = await openDatabase(path, version: 1,
onCreate: (Database db, int version) async {
// When creating the db, create the table
await db.execute(
'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
});
*/

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'globals.dart';
import 'dart:io';

/*
//Starts db
  box = Hive.openBox(box_name);
  */


// init of box variable
var box;

//    All the startup for the Hive Database
void DataBaseInit() async {
  //        Gets Documents Directory
  final dir = await getApplicationSupportDirectory();

  //        Inits Hive db
  Hive.init(dir.path);
//Starts db
  box = Hive.openBox(box_name);
}

//Test Print function
void Printbox(var box){
  print(box);
}

