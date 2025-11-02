import '../../controllers/carbono/carbonoController.dart';

class CarbonoRouter {
  final controller = CarbonoController();

  Map<String, dynamic> handle(String endpoint, Map<String, dynamic> payload) {
    if (endpoint == '/api/calculate') {
      return controller.calculate(payload);
    }
    return {'error': 'Ruta /carbono no válida'};
  }
}