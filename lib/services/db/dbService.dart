import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

class DBService {
  static Database? _db;

  static Future<void> init() async {
    final path = join(await databaseFactory.getDatabasesPath(), 'app_database.db');
    _db = await databaseFactory.openDatabase(path, options: OpenDatabaseOptions(
      version: 1,
      onCreate: (db, _) async {
        await db.execute('''
          CREATE TABLE visit_counter (
            id INTEGER PRIMARY KEY,
            count INTEGER NOT NULL DEFAULT 0
          );
        ''');
        await db.insert('visit_counter', {'id': 1, 'count': 0},
          conflictAlgorithm: ConflictAlgorithm.ignore);
      },
    ));
  }

  static Database get db {
    if (_db == null) {
      throw Exception('Base de datos no inicializada. Llama a DBService.init() primero.');
    }
    return _db!;
  }
}