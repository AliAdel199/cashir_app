import '../db/users.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandler {





  // هذا الداله تقوم بتوليد ملف قاعدة البيانات

  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'example.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL,age INTEGER NOT NULL, country TEXT NOT NULL, email TEXT)",
        );
        await database.execute(
          "CREATE TABLE products(id INTEGER PRIMARY KEY AUTOINCREMENT, barcode TEXT NOT NULL, proname TEXT NOT NULL,proprice INTEGER NOT NULL,boxprice INTEGER NOT NULL, type TEXT NOT NULL)",
        );
        await database.execute(
          "CREATE TABLE invoice(id INTEGER PRIMARY KEY AUTOINCREMENT, barcode TEXT NOT NULL, proname TEXT NOT NULL,proprice INTEGER NOT NULL,procount INTEGER NOT NULL)",
        );
      },
      version: 1,
    );
  }

  Future<void> insertUser(User user) async {
    // Get a reference to the database.
    final Database db = await initializeDB();

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> insertUsers(List<User> users) async {
    int result = 0;
    final Database db = await initializeDB();
    for(var user in users){
      result = await db.insert('users', user.toMap());
    }
    return result;
  }

  Future<List<User>> retrieveUsers() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('users');
    return queryResult.map((e) => User.fromMap(e)).toList();
  }


  Future<void> deleteUser(int id) async {
    final db = await initializeDB();
    await db.delete(
      'users',
      where: "id = ?",
      whereArgs: [id],
    );
  }


}
