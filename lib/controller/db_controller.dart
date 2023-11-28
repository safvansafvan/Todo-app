import 'package:sqflite/sqflite.dart' as sql;

class DbController {
  static Future<void> createTable(sql.Database database) async {
    await database.execute("""CREATE TABLE items (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  title TEXT
) """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'db.db',
      version: 1,
      onCreate: (db, version) async {
        await createTable(db);
      },
    );
  }

  static Future<int> addItems(String title) async {
    final db = await DbController.db();
    final data = {'title': title};
    final id = db.insert('items', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await DbController.db();
    return db.query('items', orderBy: 'id');
  }
}
