import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'models/local_todo_model.dart';

class  DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  static Database? _db;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'todos.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Todos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        completed INTEGER NOT NULL,
        date_time TEXT NOT NULL
      )
    ''');
  }

  Future<List<Map<String, dynamic>>> getTodos() async {
    final db = await this.db;
    final maps = await db.query('Todos');
    return maps;
  }

  Future<List<Map<String, dynamic>>> getTodosByDate(DateTime dateTime) async {
    final db = await this.db;
    final maps = await db.query(
      'Todos',
      where: 'date_time = ?',
      whereArgs: [dateTime.toIso8601String().substring(0,10)]
    );
    return  maps;
  }


  Future<void> insertTodo(TodoModel todo) async {
    final db = await this.db;
    await db.insert('Todos', todo.toMap());
  }

  // Future<void> updateTodo(TodoModel todo) async {
  //   final db = await this.db;
  //   await db.update('Todos', todo.toMap(), where: 'id = ?', whereArgs: [todo.id]);
  // }

  Future<void> updateTodo(TodoModel todo, String newTitle) async {
    final db = await this.db;
    await db.rawUpdate('UPDATE Todos SET title = ? WHERE id = ?', [newTitle, todo.id]);
  }

  Future<void> deleteTodo(int id) async {
    final db = await this.db;
    await db.delete('Todos', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> completeTodo(int todoId) async {
    final db = await this.db;
    await db.update(
      'Todos',
      {'completed' : '1'},
      where: 'id = ?',
      whereArgs: [todoId]
    );
  }

  Future<void> uncompleteTodo(int todoId) async {
    final db = await this.db;
    await db.update(
        'Todos',
        {'completed' : '0'},
        where: 'id = ?',
        whereArgs: [todoId]
    );
  }
}
