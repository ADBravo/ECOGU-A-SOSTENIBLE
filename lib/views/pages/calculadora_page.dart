import 'package:flutter/material.dart';
import 'package:huella_carbono/routes/router.dart';
import 'package:huella_carbono/views/widgets/numeric_input_field.dart';
import 'package:huella_carbono/views/widgets/dropdown_input_field.dart';

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  final formKey = GlobalKey<FormState>();
  final Map<String, dynamic> data = {
    'project_name': '',
    'infrastructure': {},
    'development': {},
    'runtime': {},
  };

  Map<String, dynamic>? result;

  Future<void> submit() async {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();

    final response = await AppRouter().route('/api/calculate', payload: data);
    setState(() {
      result = response;
    });
  }

  Widget buildStatusMessage(String status) {
    switch (status) {
      case 'bajo':
        return const Text(
          '✅ Las emisiones están bien. Puedes continuar sin cambios.',
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        );
      case 'medio':
        return const Text(
          '⚠️ Las emisiones son moderadas. Revisa las recomendaciones.',
          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
        );
      case 'alto':
        return const Text(
          '❌ Las emisiones son altas. Sigue las recomendaciones al pie de la letra.',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        );
      default:
        return const SizedBox();
    }
  }

  Widget buildResultView() {
    if (result == null) return const SizedBox();
    if (result!['error'] != null) return Text('❌ Error: ${result!['error']}');

    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(top: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('📌 Proyecto: ${data['project_name']}', style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Text('🌍 Total Emisiones: ${result!['total_emissions']} kg CO₂',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            if (result!['status'] != null) ...[
              const SizedBox(height: 12),
              buildStatusMessage(result!['status']),
            ],
            const SizedBox(height: 12),
            Text('📊 Breakdown:', style: const TextStyle(fontWeight: FontWeight.bold)),
            ...result!['breakdown'].entries.map((e) => Text('• ${e.key}: ${e.value} kg CO₂')),
            const SizedBox(height: 12),
            Text('💡 Recomendaciones:', style: const TextStyle(fontWeight: FontWeight.bold)),
            ...List<String>.from(result!['recommendations']).map((r) => Text('• $r')),
            const SizedBox(height: 12),
            Text('🔁 Equivalencias:', style: const TextStyle(fontWeight: FontWeight.bold)),
            ...result!['equivalents'].entries.map((e) => Text('• ${e.key}: ${e.value}')),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora de Huella'), backgroundColor: const Color(0xFF1976D2)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: data['project_name'],
                decoration: const InputDecoration(
                  labelText: 'Nombre del Proyecto',
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (value) => value == null || value.isEmpty ? 'Requerido' : null,
                onChanged: (value) => data['project_name'] = value,
                onSaved: (value) => data['project_name'] = value!,
              ),
              const SizedBox(height: 20),

              const Text('🔌 Infraestructura Cloud', style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownInputField(
                label: 'Proveedor',
                section: 'infrastructure',
                keyName: 'provider',
                options: ['aws_us', 'aws_eu', 'gcp_eu'],
                data: data,
              ),
              NumericInputField(label: 'Número de Instancias', section: 'infrastructure', keyName: 'num_instances', isInt: true, data: data),
              NumericInputField(label: 'Horas Mensuales', section: 'infrastructure', keyName: 'monthly_hours', data: data),
              NumericInputField(label: 'Uso Promedio CPU (%)', section: 'infrastructure', keyName: 'avg_cpu_usage', max100: true, data: data),
              NumericInputField(label: 'Potencia por Instancia (W)', section: 'infrastructure', keyName: 'instance_power_watts', data: data),

              const SizedBox(height: 20),
              const Text('💻 Ciclo de Desarrollo', style: TextStyle(fontWeight: FontWeight.bold)),
              NumericInputField(label: 'Builds Diarios', section: 'development', keyName: 'daily_builds', isInt: true, data: data),
              NumericInputField(label: 'Tests Diarios', section: 'development', keyName: 'daily_tests', isInt: true, data: data),
              NumericInputField(label: 'Deploys Mensuales', section: 'development', keyName: 'monthly_deployments', isInt: true, data: data),
              NumericInputField(label: 'CI/CD Mensuales', section: 'development', keyName: 'ci_cd_runs', isInt: true, data: data),

              const SizedBox(height: 20),
              const Text('⚙️ Runtime', style: TextStyle(fontWeight: FontWeight.bold)),
              NumericInputField(label: 'Requests Mensuales', section: 'runtime', keyName: 'monthly_requests', isInt: true, data: data),
              NumericInputField(label: 'Tiempo de Respuesta (ms)', section: 'runtime', keyName: 'avg_response_time_ms', data: data),
              NumericInputField(label: 'CPU por Request (%)', section: 'runtime', keyName: 'cpu_per_request', max100: true, data: data),

              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1976D2),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Calcular Emisiones'),
              ),
              if (result != null) buildResultView(),
            ],
          ),
        ),
      ),
    );
  }
}