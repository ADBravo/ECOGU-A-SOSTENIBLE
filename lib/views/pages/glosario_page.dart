import 'package:flutter/material.dart';

class GlosarioPage extends StatelessWidget {
  const GlosarioPage({Key? key}) : super(key: key);

  static final List<Map<String, String>> terminos = [
    {
      'termino': 'Desarrollo Sostenible',
      'definicion': 'Satisface necesidades actuales sin comprometer las futuras, equilibrando economía, sociedad y ambiente.'
    },
    {
      'termino': 'Cambio Climático',
      'definicion': 'Variación del clima causada por factores naturales y humanos, como gases de efecto invernadero.'
    },
    {
      'termino': 'Biodiversidad',
      'definicion': 'Diversidad de vida en la Tierra, esencial para el equilibrio ecológico y la supervivencia humana.'
    },
    {
      'termino': 'Huella de Carbono',
      'definicion': 'Cantidad de gases de efecto invernadero emitidos por actividades humanas, medida en CO₂ equivalente.'
    },
    {
      'termino': 'Economía Circular',
      'definicion': 'Modelo que reduce residuos y reutiliza recursos, contrario al sistema lineal de producción y consumo.'
    },
    {
      'termino': 'Energías Renovables',
      'definicion': 'Fuentes naturales que se regeneran: solar, eólica, hidroeléctrica, geotérmica y biomasa.'
    },
    {
      'termino': 'Efecto Invernadero',
      'definicion': 'Fenómeno natural intensificado por el ser humano, que provoca el calentamiento global.'
    },
    {
      'termino': 'Deforestación',
      'definicion': 'Pérdida de bosques por actividades humanas, afecta el clima y la biodiversidad.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Glosario Ambiental'),
        backgroundColor: const Color(0xFF2E7D32),
        foregroundColor: Colors.white,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: terminos.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final termino = terminos[index];
          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    title: Row(
                      children: [
                        const Icon(Icons.eco, color: Color(0xFF2E7D32), size: 28),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            termino['termino']!,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    content: Text(
                      termino['definicion']!,
                      style: const TextStyle(fontSize: 15, height: 1.5),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        style: TextButton.styleFrom(foregroundColor: const Color(0xFF2E7D32)),
                        child: const Text('Cerrar'),
                      ),
                    ],
                  ),
                );
              },
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2E7D32).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.eco, color: Color(0xFF2E7D32), size: 28),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        termino['termino']!,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}