import 'baza.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database? _db;

  DatabaseHelper._instance();

  String table = 'products';

  Future<Database> get db async {
    _db ??= await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    String path = await getDatabasesPath();
    path = '$path/my_database.db';
    final database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE $table(id INTEGER PRIMARY KEY AUTOINCREMENT, text TEXT, timeH TEXT, timeM TEXT, date TEXT)',
        );
      },
    );
    return database;
  }

  Future<int> insertData(Baza data) async {
    final db = await instance.db;
    return await db.insert(instance.table, data.toMap());
  }

  Future<List<Baza>> getData([DateTime? selectedDate]) async {
    final db = await instance.db;
    final List<Map<String, dynamic>> maps = await db.query(
      instance.table,
      //   where: selectedDate != null ? 'date LIKE ?' : null,
      //   whereArgs: selectedDate != null
      //       ? ['${DateFormat('yyyy-MM-dd').format(selectedDate)}%']
      //       : null,
    );

    return List.generate(maps.length, (i) {
      return Baza.fromMap(maps[i]);
    });
  }
}