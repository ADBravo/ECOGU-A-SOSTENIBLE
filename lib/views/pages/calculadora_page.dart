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
    String message;
    switch (status) {
      case 'bajo':
        message = 'Las emisiones están en un nivel óptimo. Puedes continuar sin cambios.';
        break;
      case 'medio':
        message = 'Las emisiones son moderadas. Revisa las recomendaciones para mejorar.';
        break;
      case 'alto':
        message = 'Las emisiones son altas. Es importante seguir las recomendaciones.';
        break;
      default:
        return const SizedBox();
    }
    
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        message,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          height: 1.4,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget buildResultView() {
    if (result == null) return const SizedBox();
    if (result!['error'] != null) {
      return Container(
        margin: const EdgeInsets.only(top: 24),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFFFFEBEE),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFD32F2F), width: 2),
        ),
        child: Row(
          children: [
            const Icon(Icons.error_outline, color: Color(0xFFD32F2F), size: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'Error: ${result!['error']}',
                style: const TextStyle(
                  color: Color(0xFFD32F2F),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Color statusColor;
    Color statusBgColor;
    IconData statusIcon;
    
    switch (result!['status']) {
      case 'bajo':
        statusColor = const Color(0xFF2E7D32);
        statusBgColor = const Color(0xFFE8F5E9);
        statusIcon = Icons.check_circle;
        break;
      case 'medio':
        statusColor = const Color(0xFFEF6C00);
        statusBgColor = const Color(0xFFFFF3E0);
        statusIcon = Icons.warning_amber;
        break;
      case 'alto':
        statusColor = const Color(0xFFD32F2F);
        statusBgColor = const Color(0xFFFFEBEE);
        statusIcon = Icons.error;
        break;
      default:
        statusColor = const Color(0xFF0D47A1);
        statusBgColor = const Color(0xFFE3F2FD);
        statusIcon = Icons.info;
    }

    return Column(
      children: [
        const SizedBox(height: 24),
        
        // Título de resultados
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xFF2E7D32),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.eco, color: Colors.white, size: 24),
              SizedBox(width: 8),
              Text(
                'Resultados del Análisis',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Card principal con el total de emisiones
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: statusBgColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: statusColor, width: 2),
          ),
          child: Column(
            children: [
              Icon(statusIcon, color: statusColor, size: 48),
              const SizedBox(height: 12),
              Text(
                data['project_name'],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: statusColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.co2, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      '${result!['total_emissions']} kg CO₂',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              buildStatusMessage(result!['status']),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Desglose de emisiones
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4CAF50).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.analytics,
                        color: Color(0xFF4CAF50),
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Desglose de Emisiones',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2E7D32),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ...result!['breakdown'].entries.map((e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Color(0xFF66BB6A),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          e.key,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        '${e.value} kg CO₂',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2E7D32),
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Recomendaciones
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF81C784).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.lightbulb,
                        color: Color(0xFF558B2F),
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Recomendaciones',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF558B2F),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ...List<String>.from(result!['recommendations']).map((r) => Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F8E9),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFFAED581), width: 1),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.arrow_right,
                        color: Color(0xFF558B2F),
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          r,
                          style: const TextStyle(
                            fontSize: 14,
                            height: 1.4,
                            color: Color(0xFF33691E),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Equivalencias
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4DB6AC).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.compare_arrows,
                        color: Color(0xFF00695C),
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Equivalencias',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00695C),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ...result!['equivalents'].entries.map((e) => Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0F2F1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.eco,
                        color: Color(0xFF00695C),
                        size: 18,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF004D40),
                            ),
                            children: [
                              TextSpan(
                                text: '${e.key}: ',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: '${e.value}'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECEFF1),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.calculate, size: 24),
            ),
            const SizedBox(width: 12),
            const Text(
              'Calculadora de Huella',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF0D47A1),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Nombre del Proyecto
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF0D47A1).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.folder_open,
                            color: Color(0xFF0D47A1),
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Información del Proyecto',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFF0D47A1),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      initialValue: data['project_name'],
                      decoration: InputDecoration(
                        labelText: '📝 Nombre del Proyecto',
                        prefixIcon: const Icon(Icons.edit, color: Color(0xFF0D47A1)),
                        filled: true,
                        fillColor: Colors.grey[50],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Color(0xFF0D47A1), width: 2),
                        ),
                      ),
                      validator: (value) => value == null || value.isEmpty ? 'Requerido' : null,
                      onChanged: (value) => data['project_name'] = value,
                      onSaved: (value) => data['project_name'] = value!,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Infraestructura Cloud
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF0D47A1).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.cloud_outlined,
                            color: Color(0xFF0D47A1),
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Infraestructura Cloud',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFF0D47A1),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    DropdownInputField(
                      label: '☁️ Proveedor de nube',
                      section: 'infrastructure',
                      keyName: 'provider',
                      options: ['aws_us', 'aws_eu', 'gcp_eu'],
                      data: data,
                    ),
                    const SizedBox(height: 12),
                    NumericInputField(
                      label: '🖥️ ¿Cuántas instancias usas?',
                      section: 'infrastructure',
                      keyName: 'num_instances',
                      isInt: true,
                      data: data,
                    ),
                    const SizedBox(height: 12),
                    NumericInputField(
                      label: '⏰ Horas activas al mes',
                      section: 'infrastructure',
                      keyName: 'monthly_hours',
                      data: data,
                    ),
                    const SizedBox(height: 12),
                    NumericInputField(
                      label: '📊 Uso promedio de CPU (%)',
                      section: 'infrastructure',
                      keyName: 'avg_cpu_usage',
                      max100: true,
                      data: data,
                    ),
                    const SizedBox(height: 12),
                    NumericInputField(
                      label: '⚡ Potencia por instancia (W)',
                      section: 'infrastructure',
                      keyName: 'instance_power_watts',
                      data: data,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Ciclo de Desarrollo
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF0D47A1).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.code,
                            color: Color(0xFF0D47A1),
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Ciclo de Desarrollo',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFF0D47A1),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    NumericInputField(
                      label: '🔨 Compilaciones diarias',
                      section: 'development',
                      keyName: 'daily_builds',
                      isInt: true,
                      data: data,
                    ),
                    const SizedBox(height: 12),
                    NumericInputField(
                      label: '🧪 Pruebas al día',
                      section: 'development',
                      keyName: 'daily_tests',
                      isInt: true,
                      data: data,
                    ),
                    const SizedBox(height: 12),
                    NumericInputField(
                      label: '🚀 Despliegues mensuales',
                      section: 'development',
                      keyName: 'monthly_deployments',
                      isInt: true,
                      data: data,
                    ),
                    const SizedBox(height: 12),
                    NumericInputField(
                      label: '🔄 Ejecuciones CI/CD al mes',
                      section: 'development',
                      keyName: 'ci_cd_runs',
                      isInt: true,
                      data: data,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Runtime
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF0D47A1).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.settings,
                            color: Color(0xFF0D47A1),
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Runtime',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFF0D47A1),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    NumericInputField(
                      label: '📨 Peticiones al mes',
                      section: 'runtime',
                      keyName: 'monthly_requests',
                      isInt: true,
                      data: data,
                    ),
                    const SizedBox(height: 12),
                    NumericInputField(
                      label: '⚡ Tiempo de respuesta (ms)',
                      section: 'runtime',
                      keyName: 'avg_response_time_ms',
                      data: data,
                    ),
                    const SizedBox(height: 12),
                    NumericInputField(
                      label: '🎯 CPU por petición (%)',
                      section: 'runtime',
                      keyName: 'cpu_per_request',
                      max100: true,
                      data: data,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Botón de calcular
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF0D47A1).withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ElevatedButton.icon(
                onPressed: submit,
                icon: const Icon(Icons.calculate, size: 24),
                label: const Text(
                  'Calcular Emisiones',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0D47A1),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
              ),
            ),
            
            if (result != null) buildResultView(),
          ],
        ),
      ),
    );
  }
}