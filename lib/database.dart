import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:student_list/studentDetails.dart';


class SqlDb {

  static Database? _db;

  Future<Database?> get db async{
    if(_db == null) {
      _db = await initialDb();
      return _db;
    }else {
      return _db;
    }
  }

  initialDb() async{
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'StudentDetails.db');
    Database myDb = await openDatabase(path, onCreate: _onCreate);
    return myDb;
  }
  _onCreate(Database db, int version)async {
    await db.execute('''CREATE TABLE "students"(
    id AUTOINCREMENT NOT NULL PRIMARY KEY, 
    name TEXT, 
    dob TEXT, 
    email TEXT, 
    mobile TEXT
    )
    ''');
    print('Create DATABASE AND TABLE =========================');
  }
}