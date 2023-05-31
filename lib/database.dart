import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


// class SqlDb {
//
//   static Database? _db;
//
//   Future<Database?> get db async{
//     if(_db == null) {
//       _db = await initialDb();
//       return _db;
//     }else {
//       return _db;
//     }
//   }
//
//   initialDb() async{
//     String databasePath = await getDatabasesPath();
//     String path = join(databasePath, 'StudentDetails.db');
//     Database myDb = await openDatabase(path, onCreate: _onCreate, version: 1);
//     return myDb;
//   }
//   _onCreate(Database db, int version)async {
//     await db.execute('''CREATE TABLE "students"(
//     id PRIMARY KEY,
//     name TEXT,
//     dob TEXT,
//     email TEXT,
//     mobile TEXT
//     )
//     ''');
//     print('Create DATABASE AND TABLE =========================');
//   }
//
//   Future<int> insertData(String sql) async{
//     Database? mydb = await db;
//     int rep = await mydb!.rawInsert(sql);
//     return rep;
//   }
//
//
//   Future<int> updateData(String sql) async{
//     Database? mydb = await db;
//     int response = await mydb!.rawUpdate(sql);
//     return response;
//   }
//
//   Future<int> deleteData(String sql) async {
//     Database? mydb = await db;
//     int response = await mydb!.rawDelete(sql);
//     return response;
//   }
//  }



class DatabaseHelper {
  static const _databaseName = 'StudentDetails.db';
  static const table = 'my_table';
  static const databaseVersion = 1;
  static const columnId = '_id';
  static const columnName = '_name';
  static const columnDob = '_dob';
  static const columnEmail = '_email';
  static const columnMobile = '_mobile';

  late Database db;

  Future<void> init() async{
    final documentDirectory = await getApplicationSupportDirectory();
    final path = join(documentDirectory.path, _databaseName);
    db = await openDatabase(
      path,
      version: databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async{
    await db.execute('''
        CREATE TABLE $table(
          $columnId INTEGER PRIMARY KEY,
          $columnName TEXT NOT NULL,
          $columnDob TEXT NOT NULL,
          $columnEmail TEXT NOT NULL,
          $columnMobile TEXT NOT NULL,
        )
    ''');
  }

  Future<int> insert (Map<String, dynamic>row) async{
    return await db.insert(table,row);
  }

  Future<List<Map<String, dynamic>>> queryAllRow() async{
    return await db.query(table);
  }

  Future<int> update(Map<String, dynamic>row) async{
    int id = row[columnId];
    return await db.update(
      table,
      row,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  Future<int> delete(Map<String, dynamic>row) async {
    int id = row[columnId];
    return await db.delete(
      table,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}
