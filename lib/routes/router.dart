import 'carbono/carbonoRouter.dart';
import 'visit/visitRouter.dart';

class AppRouter {
  final carbono = CarbonoRouter();
  final visit = VisitRouter();

  Future<Map<String, dynamic>> route(String path, {Map<String, dynamic>? payload}) async {
    if (path.startsWith('/api/calculate')) {
      return carbono.handle(path, payload ?? {});
    } else if (path == '/api/visits') {
      return await visit.handle(path);
    }
    return {'error': 'Ruta /api no válida'};
  }
}
