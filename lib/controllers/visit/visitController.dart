import '../../models/visit/visitModel.dart';

class VisitController {
  final model = VisitModel();

  Future<Map<String, dynamic>> getVisits() async {
    await model.increment();
    final count = await model.getCount();
    return {'visits': count};
  }
}