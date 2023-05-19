import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:student_list/screens/studentsList.dart';
import 'package:student_list/studentDetails.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final database = openDatabase(
//     join(await getDatabasesPath(), 'StudentDetails_database.db'),
//     onCreate: (db, version) {
//       return db.execute('CREATE TABLE StudentDetails('
//           'id INTEGER PRIMARY KEY, name TEXT, dob TEXT, email TEXT, mobile TEXT)',
//       );
//     },
//     version: 1
//   );
//
//   Future<void> insertStudentDetails(student) async {
//     final db = await database;
//     await db.insert('StudentDetails', student.toMap(),
//     );
//   }
//
//   Future<List<StudentDetails>> students() async {
//     final db = await database;
//     final List<Map<String, dynamic>> maps = await db.query('students');
//     return List.generate(maps.length,  (i) {
//       return StudentDetails(
//           id: maps[i]['id'],
//           name: maps[i]['name'],
//           dob: maps[i]['dob'],
//           email: maps[i]['email'],
//           mobile: maps[i]['mobile'],
//       );
//     });
//   }
// }



class MyDb {
  late Database db;

  Future open() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');
    print(path);

    Database db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
                  CREATE TABLE IF NOT EXISTS students( 
                        id primary key,
                        name varchar(255) not null,
                        dob int not null,
                        email not null,
                        mobile not null,
                    );
                ''');
          print("Table Created");
        });
  }
}