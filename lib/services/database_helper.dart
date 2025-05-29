import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/actividad.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'actividades.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

    Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE actividades(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT,
        descripcion TEXT,
        fecha TEXT
      )
    ''');
  }

  Future<int> insertActivity(Actividad actividad) async {
    final db = await database;
    return await db.insert('actividades', actividad.toMap());
  }

  Future<List<Actividad>> getActivities() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('actividades');
    return List.generate(maps.length, (i) {
      return Actividad.fromMap(maps[i]);
    });
  }

  Future<int> updateActivity(Actividad actividad) async {
    final db = await database;
    return await db.update(
      'actividades',
      actividad.toMap(),
      where: 'id = ?',
      whereArgs: [actividad.id],
    );
  }

  Future<int> deleteActivity(int id) async {
    final db = await database;
    return await db.delete(
      'actividades',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}


