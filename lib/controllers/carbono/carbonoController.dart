import '../../models/carbono/carbonoModel.dart';

class CarbonoController {
  final model = CarbonoModel();

  Map<String, dynamic> calculate(Map<String, dynamic> data) {
    return model.calculateTotal(data);
  }
}