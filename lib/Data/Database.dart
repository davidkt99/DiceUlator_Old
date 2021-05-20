import 'package:sqflite/sqflite.dart';

Future<void> StartDatabase () async {
  var db = await openDatabase('my_db.db');
}

