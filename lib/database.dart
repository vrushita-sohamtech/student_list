import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Future<Database> db() async{
    return openDatabase(
        'Student.db',
        version: 1,
        onCreate: (database, version) {
      createTable(database);
    });

  }

 static Future<void> createTable(database) async{
    await database.execute("""
        CREATE TABLE table(
         Id INTEGER PRIMARY KEY,
         Name TEXT,
         Dob TEXT,
         Email TEXT,
         Mobile INTEGER,
        )
        """);
  }

  Future<void> insert({
    required int id,
    required String name,
    required int dob,
    required String email,
    required int mobile,
  }) async {
    final db = await DatabaseHelper.db();
    final data = {'id': id, 'name': name, 'dob': dob, 'email': email, 'mobile': mobile};
    db.insert('table', data, conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData() async{
    final db= await DatabaseHelper.db();
    return db.query('StudentDetails');
  }

  Future<dynamic> update({
    required int id,
    required String name,
    required int dob,
    required String email,
    required int mobile,
  }) async{
    final db = await DatabaseHelper.db();
    final data = {'id': id, 'name': name, 'dob': dob, 'email': email, 'mobile': mobile};
    db.update('table', data, where: 'Id = ?', whereArgs: [id],
    );
  }
}
