import '../../services/db/dbService.dart';

class VisitModel {
  Future<void> increment() async {
    await DBService.db.rawUpdate('UPDATE visit_counter SET count = count + 1 WHERE id = 1');
  }

  Future<int> getCount() async {
    final result = await DBService.db.rawQuery('SELECT count FROM visit_counter WHERE id = 1');
    return result.first['count'] as int;
  }
}
