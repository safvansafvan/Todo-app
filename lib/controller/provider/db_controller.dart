import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DbController extends ChangeNotifier {
  List<Map<String, dynamic>> todoList = [];

  Future<void> createTable(sql.Database database) async {
    await database.execute("""CREATE TABLE items (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  title TEXT,
  createdAt TEXT
) """);
  }

  Future<sql.Database> db() async {
    return sql.openDatabase(
      'db.db',
      version: 1,
      onCreate: (db, version) async {
        await createTable(db);
      },
    );
  }

  Future addItems(String title, String date) async {
    final db = await DbController().db();
    final data = {
      'title': title,
      'id': DateTime.now().millisecondsSinceEpoch,
      'createdAt': date
    };
    db.insert('items', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    notifyListeners();
  }

  Future<void> getItems() async {
    final db = await DbController().db();
    todoList = await db.query('items', orderBy: 'id');
    notifyListeners();
  }
}
