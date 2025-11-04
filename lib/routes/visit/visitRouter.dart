import '../../controllers/visit/visitController.dart';

class VisitRouter {
  final controller = VisitController();

  Future<Map<String, dynamic>> handle(String endpoint) async {
    if (endpoint == '/api/visits') {
      return await controller.getVisits();
    }
    return {'error': 'Ruta /visit no válida'};
  }
}