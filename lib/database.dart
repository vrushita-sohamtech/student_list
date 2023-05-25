import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:student_list/studentDetails.dart';

class DbHelper {

  static Database? _db;

  Future<Database?> get db async{
    if(_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }

  initDatabase() async{
    var documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'StudentDetails.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate (Database db, int version) async{
    await db.execute("CREATE TABLE StudentDetails("
        "id PRIMARY KEY, "
        "name TEXT NOT NULL,"
        " dob TEXT NOT NULL,"
        " email TEXT,"
        " mobile TEXT,"
        " )"
    );
  }

  Future<StudentDetails> insert(StudentDetails studentDetails) async{
    var DbClient = await db;
    await DbClient?.insert('students', studentDetails.toMap());
    return studentDetails;
  }

  Future<StudentDetails> update(StudentDetails studentDetails) async{
    var DbClient = await db;
    await DbClient?.update('students', studentDetails.toMap());
    return studentDetails;
  }

  Future<StudentDetails> delete(StudentDetails studentDetails) async{
    var DbClient = await db;
    await DbClient?.delete('students');
    return studentDetails;
  }
}
