import 'dart:async';
import 'dart:io' as io;

import 'package:myapp/database/model/person.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "main.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE Person(id INTEGER PRIMARY KEY, firstname TEXT, lastname TEXT)");
  }

  Future<int> savePerson(Person person) async {
    var dbClient = await db;
    int res = await dbClient.insert("Person", person.toMap());
    return res;
  }

  Future<List<Person>> getPerson() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Person');
    List<Person> employees = new List();
    for (int i = 0; i < list.length; i++) {
      var person =
          new Person(list[i]["firstname"], list[i]["lastname"], list[i]["hoursday"], list[i]["avatar"]);
      person.setPersonId(list[i]["id"]);
      employees.add(person);
    }
    print(employees.length);
    return employees;
  }

  Future<int> deletePersons(Person person) async {
    var dbClient = await db;

    int res =
        await dbClient.rawDelete('DELETE FROM Person WHERE id = ?', [person.id]);
    return res;
  }

  Future<bool> update(Person person) async {
    var dbClient = await db;

    int res =   await dbClient.update("Person", person.toMap(),
        where: "id = ?", whereArgs: <int>[person.id]);

    return res > 0 ? true : false;
  }
}
