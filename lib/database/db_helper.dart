import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:student_data/models/student_model.dart';

class Databasehelper{
  static final databasename = "studentlist.db";
  static final databaseversion = 3;

  static final table = "student_table";

  static final columnID = "id";
  static final columnName = "name";
  static final columnEmail = "email";
  static final columnAddress = "address";
  static final columnPhoneno = "phoneno";
  static final columnClassno = "classno";
  static final columnHobby = "hobby";
  static final columnSubject = "subject";

  static Database? _database;

  Databasehelper.privateconstructor();
  static final Databasehelper instance = Databasehelper.privateconstructor();

  Future<Database?> get database async{
    if (_database != null)return _database;
    _database = await initDatabase();
    return _database;
  }
  initDatabase() async{
    Directory documentdirecoty = await getApplicationDocumentsDirectory();
    String path = join(documentdirecoty.path, databasename);
    return await openDatabase(path, version: databaseversion,onCreate: onCreate);
  }
  Future onCreate(Database db , int version) async {
    await db.execute(
        '''
      CREATE TABLE $table(
      $columnID INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnName TEXT NOT NULL,
      $columnEmail TEXT NOT NULL,
      $columnAddress TEXT NOT NULL,
      $columnPhoneno TEXT NOT NULL,
      $columnClassno TEXT NOT NULL,
      $columnHobby TEXT NOT NULL,
      $columnSubject TEXT NOT NULL
      )
      '''
    );
  }
  Future<int> insert(StudentModel studentModel)async {
    Database? db = await instance.database;
    return await db!.insert(table, {'name': studentModel.name,'email': studentModel.email,'address': studentModel.address,'classno': studentModel.classno,'phoneno': studentModel.phoneno,'hobby':studentModel.hobby,'subject':studentModel.subject});
  }
  Future<List<Map<String , dynamic>>> queryall() async{
    Database? db = await instance.database;
    return db!.query(table);
  }

  Future<int> update(StudentModel studentModel)async{
    Database? db = await instance.database;
    Object? id = studentModel.id;
    return await db!.update(table, studentModel.toMap(),where: '$columnID = ?',whereArgs: [id]);
}


Future<int> delete(int id)async{
    Database? db = await instance.database;
    return await db!.delete(table,where: '$columnID = ?',whereArgs: [id]);
  }

  Future<int> deleteAll()async{
    Database? db = await instance.database;
    return await db!.delete(table,where: null,whereArgs: null);
  }

}