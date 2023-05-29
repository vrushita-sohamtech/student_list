import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


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
    Database myDb = await openDatabase(path, onCreate: _onCreate, version: 1);
    return myDb;
  }
  _onCreate(Database db, int version)async {
    await db.execute('''CREATE TABLE "students"(
    id PRIMARY KEY,
    name TEXT,
    dob TEXT,
    email TEXT,
    mobile TEXT
    )
    ''');
    print('Create DATABASE AND TABLE =========================');
  }

  Future<int> insertData(String sql) async{
    Database? mydb = await db;
    int rep = await mydb!.rawInsert(sql);
    return rep;
  }


  Future<int> updateData(String sql) async{
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  Future<int> deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }
 }




