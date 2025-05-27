import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/actividad.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();
  factory DatabaseHelper() => instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    return _database ??= await _initDatabase();
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'actividades.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE actividades (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nombre TEXT,
            descripcion TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertActividad(Actividad actividad) async {
    final db = await database;
    return await db.insert('actividades', actividad.toMap());
  }

  Future<List<Actividad>> getActividades() async {
    final db = await database;
    final result = await db.query('actividades');
    return result.map((map) => Actividad.fromMap(map)).toList();
  }

  Future<int> updateActividad(Actividad actividad) async {
    final db = await database;
    return await db.update(
      'actividades',
      actividad.toMap(),
      where: 'id = ?',
      whereArgs: [actividad.id],
    );
  }

  Future<int> deleteActividad(int id) async {
    final db = await database;
    return await db.delete('actividades', where: 'id = ?', whereArgs: [id]);
  }
}
