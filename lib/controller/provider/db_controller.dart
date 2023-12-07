import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DbController extends ChangeNotifier {
  List<Map<String, dynamic>> todoList = [];
  List<Map<String, dynamic>> stillSearchTodo = [];

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
    final id = db.insert('items', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    notifyListeners();
    return id;
  }

  Future<void> getItems() async {
    final db = await DbController().db();
    todoList = await db.query('items', orderBy: 'id');
    notifyListeners();
  }

  Future<void> deleteValues(int id) async {
    final db = await DbController().db();
    await db.delete('items', where: 'id = ?', whereArgs: [id]);
    notifyListeners();
  }

  TextEditingController search = TextEditingController();
  Future<void> searchTodo(String query) async {
    List<Map<String, dynamic>> result = [];
    if (query.isEmpty) {
      result = todoList;
      notifyListeners();
    } else {
      result = todoList
          .where((element) => element['title']
              .toString()
              .toLowerCase()
              .trim()
              .startsWith(query.toLowerCase().trim()))
          .toList();
    }
    stillSearchTodo = result;
    notifyListeners();
  }

  void clearSearch() {
    search.clear();
  }
}
