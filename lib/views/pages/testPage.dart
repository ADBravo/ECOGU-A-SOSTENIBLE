import 'package:flutter/material.dart';
import '../../routes/router.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final formKey = GlobalKey<FormState>();
  final Map<String, dynamic> data = {
    'project_name': '',
    'infrastructure': {},
    'development': {},
    'runtime': {},
  };

  Map<String, dynamic>? result;
  int? visitCount;

  @override
  void initState() {
    super.initState();
    loadVisits();
  }

  Future<void> loadVisits() async {
    final response = await AppRouter().route('/api/visits');
    if (response['visits'] != null) {
      setState(() {
        visitCount = response['visits'];
      });
    }
  }

  Future<void> submit() async {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();

    final response = await AppRouter().route('/api/calculate', payload: data);
    setState(() {
      result = response;
    });
  }

  Widget buildResultView() {
    if (result == null) return const SizedBox();
    if (result!['error'] != null) return Text('❌ Error: ${result!['error']}');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('🌍 Total Emisiones: ${result!['total_emissions']} kg CO₂',
            style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Text('📊 Breakdown:'),
        ...result!['breakdown'].entries.map(
          (e) => Text('• ${e.key}: ${e.value} kg CO₂'),
        ),
        const SizedBox(height: 10),
        Text('💡 Recomendaciones:'),
        ...List<String>.from(result!['recommendations']).map((r) => Text('• $r')),
        const SizedBox(height: 10),
        Text('🔁 Equivalencias:'),
        ...result!['equivalents'].entries.map(
          (e) => Text('• ${e.key}: ${e.value}'),
        ),
      ],
    );
  }

  Widget buildNumericInput({
    required String label,
    required String section,
    required String key,
    bool isInt = false,
    String? helper,
  }) {
    return TextFormField(
      decoration: InputDecoration(labelText: label, helperText: helper),
      keyboardType: TextInputType.number,
      validator: (value) => value == null || value.isEmpty ? 'Requerido' : null,
      onSaved: (value) {
        final parsed = isInt ? int.parse(value!) : double.parse(value!);
        data[section][key] = parsed;
      },
    );
  }

  Widget buildTextInput({
    required String label,
    required String section,
    required String key,
    String? helper,
  }) {
    return TextFormField(
      decoration: InputDecoration(labelText: label, helperText: helper),
      validator: (value) => value == null || value.isEmpty ? 'Requerido' : null,
      onSaved: (value) => data[section][key] = value!,
    );
  }

  Widget buildSectionTitle(String title, String formula) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text(formula, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        const SizedBox(height: 10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora de Huella de Carbono')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              if (visitCount != null)
                Text('👀 Visitas (modo prueba): $visitCount',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nombre del Proyecto'),
                validator: (value) => value == null || value.isEmpty ? 'Requerido' : null,
                onSaved: (value) => data['project_name'] = value!,
              ),
              const SizedBox(height: 20),

              buildSectionTitle(
                '🔌 Infraestructura Cloud',
                'Energía = (W / 1000) × Horas × (CPU% / 100) × Instancias\nEmisiones = Energía × Factor',
              ),
              buildTextInput(
                label: 'Proveedor (aws_us, aws_eu, gcp_eu)',
                section: 'infrastructure',
                key: 'provider',
                helper: 'Ej: aws_us',
              ),
              buildNumericInput(
                label: 'Número de Instancias',
                section: 'infrastructure',
                key: 'num_instances',
                isInt: true,
              ),
              buildNumericInput(
                label: 'Horas Mensuales',
                section: 'infrastructure',
                key: 'monthly_hours',
              ),
              buildNumericInput(
                label: 'Uso Promedio CPU (%)',
                section: 'infrastructure',
                key: 'avg_cpu_usage',
              ),
              buildNumericInput(
                label: 'Potencia por Instancia (W)',
                section: 'infrastructure',
                key: 'instance_power_watts',
              ),

              const SizedBox(height: 20),
              buildSectionTitle(
                '💻 Ciclo de Desarrollo',
                'Builds = D × 22 × 0.02\nTests = D × 22 × 0.015\nDeploys = M × 0.025\nCI/CD = M × 0.03',
              ),
              buildNumericInput(label: 'Builds Diarios', section: 'development', key: 'daily_builds'),
              buildNumericInput(label: 'Tests Diarios', section: 'development', key: 'daily_tests'),
              buildNumericInput(label: 'Deploys Mensuales', section: 'development', key: 'monthly_deployments'),
              buildNumericInput(label: 'CI/CD Mensuales', section: 'development', key: 'ci_cd_runs'),

              const SizedBox(height: 20),
              buildSectionTitle(
                '⚙️ Runtime',
                'Horas CPU = (Requests × Tiempo) / 3600\nEnergía = Horas × (CPU% / 100) × (W / 1000)\nEmisiones = Energía × 0.38',
              ),
              buildNumericInput(label: 'Requests Mensuales', section: 'runtime', key: 'monthly_requests'),
              buildNumericInput(label: 'Tiempo de Respuesta (ms)', section: 'runtime', key: 'avg_response_time_ms'),
              buildNumericInput(label: 'CPU por Request (%)', section: 'runtime', key: 'cpu_per_request'),

              const SizedBox(height: 20),
              ElevatedButton(onPressed: submit, child: const Text('Calcular Emisiones')),
              const SizedBox(height: 20),
              if (result != null) buildResultView(),
            ],
          ),
        ),
      ),
    );
  }
}