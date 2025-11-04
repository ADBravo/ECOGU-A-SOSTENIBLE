import 'package:flutter/material.dart';
import 'package:huella_carbono/views/widgets/ods_card.dart';

class ODSPage extends StatelessWidget {
  const ODSPage({Key? key}) : super(key: key);

  static final List<Map<String, dynamic>> ods = [
    {
      'numero': 1,
      'titulo': 'Fin de la Pobreza',
      'descripcion': 'Poner fin a la pobreza en todas sus formas en todo el mundo.',
      'color': Color(0xFFE5243B),
    },
    {
      'numero': 2,
      'titulo': 'Hambre Cero',
      'descripcion': 'Lograr la seguridad alimentaria y mejorar la nutrición.',
      'color': Color(0xFFDDA63A),
    },
    {
      'numero': 3,
      'titulo': 'Salud y Bienestar',
      'descripcion': 'Garantizar una vida sana y promover el bienestar.',
      'color': Color(0xFF4C9F38),
    },
    {
      'numero': 4,
      'titulo': 'Educación de Calidad',
      'descripcion': 'Garantizar una educación inclusiva y de calidad.',
      'color': Color(0xFFC5192D),
    },
    {
      'numero': 5,
      'titulo': 'Igualdad de Género',
      'descripcion': 'Lograr la igualdad entre los géneros.',
      'color': Color(0xFFFF3A21),
    },
    {
      'numero': 6,
      'titulo': 'Agua Limpia y Saneamiento',
      'descripcion': 'Garantizar la disponibilidad de agua y saneamiento.',
      'color': Color(0xFF26BDE2),
    },
    {
      'numero': 7,
      'titulo': 'Energía Asequible y No Contaminante',
      'descripcion': 'Acceso a energía sostenible para todos.',
      'color': Color(0xFFFCC30B),
    },
    {
      'numero': 8,
      'titulo': 'Trabajo Decente y Crecimiento Económico',
      'descripcion': 'Promover empleo pleno y crecimiento económico.',
      'color': Color(0xFFA21942),
    },
    {
      'numero': 9,
      'titulo': 'Industria, Innovación e Infraestructura',
      'descripcion': 'Fomentar la innovación y la infraestructura sostenible.',
      'color': Color(0xFFFD6925),
    },
    {
      'numero': 10,
      'titulo': 'Reducción de las Desigualdades',
      'descripcion': 'Reducir la desigualdad en y entre los países.',
      'color': Color(0xFFDD1367),
    },
    {
      'numero': 11,
      'titulo': 'Ciudades y Comunidades Sostenibles',
      'descripcion': 'Hacer las ciudades inclusivas y resilientes.',
      'color': Color(0xFFFD9D24),
    },
    {
      'numero': 12,
      'titulo': 'Producción y Consumo Responsables',
      'descripcion': 'Garantizar modalidades sostenibles de producción y consumo.',
      'color': Color(0xFFBF8B2E),
    },
    {
      'numero': 13,
      'titulo': 'Acción por el Clima',
      'descripcion': 'Combatir el cambio climático y sus efectos.',
      'color': Color(0xFF3F7E44),
    },
    {
      'numero': 14,
      'titulo': 'Vida Submarina',
      'descripcion': 'Conservar los océanos y recursos marinos.',
      'color': Color(0xFF0A97D9),
    },
    {
      'numero': 15,
      'titulo': 'Vida de Ecosistemas Terrestres',
      'descripcion': 'Proteger los ecosistemas terrestres y bosques.',
      'color': Color(0xFF56C02B),
    },
    {
      'numero': 16,
      'titulo': 'Paz, Justicia e Instituciones Sólidas',
      'descripcion': 'Promover sociedades pacíficas e inclusivas.',
      'color': Color(0xFF00689D),
    },
    {
      'numero': 17,
      'titulo': 'Alianzas para Lograr los Objetivos',
      'descripcion': 'Revitalizar la Alianza Mundial para el Desarrollo Sostenible.',
      'color': Color(0xFF19486A),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Objetivos de Desarrollo Sostenible'),
        backgroundColor: const Color(0xFFFF6F00),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFFF6F00).withOpacity(0.1),
              border: Border(
                bottom: BorderSide(color: Colors.grey[300]!, width: 1),
              ),
            ),
            child: Column(
              children: [
                const Icon(Icons.public, size: 50, color: Color(0xFFFF6F00)),
                const SizedBox(height: 12),
                const Text(
                  'Agenda 2030 - ONU',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  '17 objetivos para transformar nuestro mundo',
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.9,
              ),
              itemCount: ods.length,
              itemBuilder: (context, index) {
                final objetivo = ods[index];
                return ODSCard(objetivo: objetivo);
              },
            ),
          ),
        ],
      ),
    );
  }
}