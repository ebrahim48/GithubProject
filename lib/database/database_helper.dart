import 'dart:async';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:sqflite/sqflite.dart';

import '../models/github_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  late sqflite.Database? _database;

  Future<sqflite.Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<sqflite.Database> initDatabase() async {
    String databasesPath = await sqflite.getDatabasesPath();
    String dbPath = path.join(databasesPath, 'Github Repositories');

    return await sqflite.openDatabase(
      dbPath,
      version: 1,
      onCreate: (sqflite.Database db, int version) async {
        await db.execute('''
          CREATE TABLE github_repositories (
            id INTEGER PRIMARY KEY,
            name TEXT,
            stargazersCount INTEGER,
            watchersCount INTEGER
          )
        ''');
      },
    );
  }

  Future<void> insertRepositories(List<Items> repositories) async {
    final sqflite.Database db = await database;

    Batch batch = db.batch();
    repositories.forEach((repository) {
      batch.insert('github_repositories', {
        'id': repository.id,
        'name': repository.name,
        'stargazersCount': repository.stargazersCount,
        'watchersCount': repository.watchersCount,
      });
    });

    await batch.commit();
  }

  Future<List<Items>> getRepositories() async {
    final sqflite.Database db = await database;
    List<Map<String, dynamic>> results = await db.query('github_repositories');
    return results.map((map) => Items.fromJson(map)).toList();
  }
}
