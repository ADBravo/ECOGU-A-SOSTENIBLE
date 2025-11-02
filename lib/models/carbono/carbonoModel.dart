class CarbonoModel {
  static const Map<String, double> cloudFactors = {
    'aws_us': 0.415,
    'aws_eu': 0.295,
    'gcp_eu': 0.250,
  };

  double _calculateCloud(Map<String, dynamic> infra) {
    final powerKw = infra['instance_power_watts'] / 1000;
    final hours = infra['monthly_hours'];
    final cpu = infra['avg_cpu_usage'] / 100;
    final instances = infra['num_instances'];
    final factor = cloudFactors[infra['provider']] ?? 0.415;

    final energy = powerKw * hours * cpu * instances;
    return double.parse((energy * factor).toStringAsFixed(2));
  }

  double _calculateDevelopment(Map<String, dynamic> dev) {
    final builds = dev['daily_builds'] * 22 * 0.02;
    final tests = dev['daily_tests'] * 22 * 0.015;
    final deploys = dev['monthly_deployments'] * 0.025;
    final cicd = dev['ci_cd_runs'] * 0.03;
    return double.parse((builds + tests + deploys + cicd).toStringAsFixed(2));
  }

  double _calculateRuntime(Map<String, dynamic> run) {
    final requests = run['monthly_requests'];
    final timeSec = run['avg_response_time_ms'] / 1000;
    final cpu = run['cpu_per_request'] / 100;
    final powerKw = 25 / 1000;

    final hours = (requests * timeSec) / 3600;
    final energy = hours * cpu * powerKw;
    return double.parse((energy * 0.38).toStringAsFixed(3));
  }

  Map<String, dynamic> calculateTotal(Map<String, dynamic> data) {
    final infra = Map<String, dynamic>.from(data['infrastructure']);
    final dev = Map<String, dynamic>.from(data['development']);
    final run = Map<String, dynamic>.from(data['runtime']);

    final cloud = _calculateCloud(infra);
    final development = _calculateDevelopment(dev);
    final runtime = _calculateRuntime(run);
    final total = double.parse(
      (cloud + development + runtime).toStringAsFixed(2),
    );

    return {
      'total_emissions': total,
      'breakdown': {
        'infrastructure': cloud,
        'development': development,
        'runtime': runtime,
      },
      'recommendations': _generateRecommendations(total),
      'equivalents': _calculateEquivalents(total),
    };
  }

  List<String> _generateRecommendations(double total) {
    if (total > 1000) {
      return [
        'Optimiza consultas y reduce procesamiento redundante',
        'Usa caché y reduce tamaño de imágenes Docker',
        'Migra a regiones con energía renovable',
        'Reduce instancias o tamaño si CPU bajo',
        'Optimiza tiempos de respuesta',
      ];
    } else if (total > 500) {
      return [
        'Optimiza algoritmos intensivos en CPU',
        'Comprime recursos estáticos',
        'Implementa lazy loading',
        'Programa tareas en horarios de baja demanda',
        'Monitorea consumo energético',
      ];
    } else {
      return [
        'Mantén monitoreo energético',
        'Documenta prácticas sostenibles',
        'Establece métricas de eficiencia',
        'Reduce tiempos de respuesta',
        'Optimiza uso de CPU',
      ];
    }
  }

  Map<String, dynamic> _calculateEquivalents(double kg) => {
    'trees_year': double.parse((kg / 21).toStringAsFixed(2)),
    'km_car': double.parse((kg / 0.192).toStringAsFixed(2)),
    'smartphone_charges': (kg / 0.008).floor(),
    'hours_laptop': (kg / 0.05).floor(),
  };
}
