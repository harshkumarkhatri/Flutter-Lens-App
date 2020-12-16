import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _dbName = 'myDatabase.db';
  static final _dbVersion = 1;
  static final _tableName = 'myTable';

  static final columnId = '_id';
  static final columnName = 'name';
  static final columnName2 = 'items';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;

  // This will return the database
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initiateDatabase();
    return _database;
  }

  // This will get the dirctory from the phone where the application data is stored
  _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    print("direc is $directory");
    // Setting the path where our database file will be created and stored
    String path = join(directory.path, _dbName);
    print("path is $path");

    // Opening the database with the specified version and then creating tables in it.
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) {
    db.execute('''
      CREATE TABLE $_tableName(
      $columnId INTEGER PRIMARY KEY,
      $columnName TEXT NOT NULL,
       $columnName2 TEXT NOT NULL)
      ''');
  }

  Future<int> insert(tableName, Map<String, dynamic> row) async {
    Database db = await instance.database;

    // Once the insert is successfully performed it will be returning the primary key/Unique Id
    return await db.insert(tableName, row);
  }

  Future<List<Map<String, dynamic>>> queryAll(tableName) async {
    Database db = await instance.database;

    // Returns the list of rows with data in them
    return await db.query(tableName);
  }

  // Updating data of particular row
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];

    // It retuns the number of rows which were updated
    return await db
        .update(_tableName, row, where: '$columnId=?', whereArgs: [id]);
  }

  // Deleting the data from the table
  Future<int> delete(int id) async {
    Database db = await instance.database;

    // Deleted id will be returned
    return await db.delete(_tableName, where: '$columnId=?', whereArgs: [id]);
  }
}
