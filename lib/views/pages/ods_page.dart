import 'package:flutter/material.dart';
import 'package:huella_carbono/views/widgets/ods_card.dart';

class ODSPage extends StatelessWidget {
  const ODSPage({Key? key}) : super(key: key);

  static final List<Map<String, dynamic>> ods = [
    {
      'numero': 1,
      'titulo': 'Fin de la Pobreza',
      'descripcion': 'Poner fin a la pobreza en todas sus formas en todo el mundo.',
      'detalle': 'Erradicar la pobreza extrema para todas las personas en el mundo, reducir al menos a la mitad la proporción de personas que viven en pobreza y garantizar protección social para todos.',
      'color': Color(0xFFE5243B),
    },
    {
      'numero': 2,
      'titulo': 'Hambre Cero',
      'descripcion': 'Lograr la seguridad alimentaria y mejorar la nutrición.',
      'detalle': 'Poner fin al hambre, lograr la seguridad alimentaria y la mejora de la nutrición, y promover la agricultura sostenible para garantizar alimentación nutritiva para todos.',
      'color': Color(0xFFDDA63A),
    },
    {
      'numero': 3,
      'titulo': 'Salud y Bienestar',
      'descripcion': 'Garantizar una vida sana y promover el bienestar.',
      'detalle': 'Garantizar una vida sana y promover el bienestar de todos a todas las edades, reduciendo la mortalidad y mejorando el acceso a servicios de salud de calidad.',
      'color': Color(0xFF4C9F38),
    },
    {
      'numero': 4,
      'titulo': 'Educación de Calidad',
      'descripcion': 'Garantizar una educación inclusiva y de calidad.',
      'detalle': 'Garantizar una educación inclusiva, equitativa y de calidad, promoviendo oportunidades de aprendizaje durante toda la vida para todas las personas.',
      'color': Color(0xFFC5192D),
    },
    {
      'numero': 5,
      'titulo': 'Igualdad de Género',
      'descripcion': 'Lograr la igualdad entre los géneros.',
      'detalle': 'Lograr la igualdad entre los géneros y empoderar a todas las mujeres y niñas, eliminando la discriminación y la violencia de género en todos los ámbitos.',
      'color': Color(0xFFFF3A21),
    },
    {
      'numero': 6,
      'titulo': 'Agua Limpia y Saneamiento',
      'descripcion': 'Garantizar la disponibilidad de agua y saneamiento.',
      'detalle': 'Garantizar la disponibilidad de agua, su gestión sostenible y el saneamiento para todos, mejorando la calidad del agua y la eficiencia de su uso.',
      'color': Color(0xFF26BDE2),
    },
    {
      'numero': 7,
      'titulo': 'Energía Asequible y No Contaminante',
      'descripcion': 'Acceso a energía sostenible para todos.',
      'detalle': 'Garantizar el acceso a una energía asequible, segura, sostenible y moderna para todos, aumentando la proporción de energía renovable en el mundo.',
      'color': Color(0xFFFCC30B),
    },
    {
      'numero': 8,
      'titulo': 'Trabajo Decente y Crecimiento Económico',
      'descripcion': 'Promover empleo pleno y crecimiento económico.',
      'detalle': 'Promover el crecimiento económico sostenido, inclusivo y sostenible, el empleo pleno y productivo, y el trabajo decente para todos.',
      'color': Color(0xFFA21942),
    },
    {
      'numero': 9,
      'titulo': 'Industria, Innovación e Infraestructura',
      'descripcion': 'Fomentar la innovación y la infraestructura sostenible.',
      'detalle': 'Construir infraestructuras resilientes, promover la industrialización inclusiva y sostenible, y fomentar la innovación tecnológica.',
      'color': Color(0xFFFD6925),
    },
    {
      'numero': 10,
      'titulo': 'Reducción de las Desigualdades',
      'descripcion': 'Reducir la desigualdad en y entre los países.',
      'detalle': 'Reducir la desigualdad dentro y entre los países, promoviendo la inclusión social, económica y política de todas las personas.',
      'color': Color(0xFFDD1367),
    },
    {
      'numero': 11,
      'titulo': 'Ciudades y Comunidades Sostenibles',
      'descripcion': 'Hacer las ciudades inclusivas y resilientes.',
      'detalle': 'Lograr que las ciudades y los asentamientos humanos sean inclusivos, seguros, resilientes y sostenibles, mejorando la calidad de vida urbana.',
      'color': Color(0xFFFD9D24),
    },
    {
      'numero': 12,
      'titulo': 'Producción y Consumo Responsables',
      'descripcion': 'Garantizar modalidades sostenibles de producción y consumo.',
      'detalle': 'Garantizar modalidades de consumo y producción sostenibles, reduciendo el desperdicio y promoviendo el uso eficiente de los recursos naturales.',
      'color': Color(0xFFBF8B2E),
    },
    {
      'numero': 13,
      'titulo': 'Acción por el Clima',
      'descripcion': 'Combatir el cambio climático y sus efectos.',
      'detalle': 'Adoptar medidas urgentes para combatir el cambio climático y sus efectos, fortaleciendo la resiliencia y la capacidad de adaptación.',
      'color': Color(0xFF3F7E44),
    },
    {
      'numero': 14,
      'titulo': 'Vida Submarina',
      'descripcion': 'Conservar los océanos y recursos marinos.',
      'detalle': 'Conservar y utilizar de forma sostenible los océanos, los mares y los recursos marinos, protegiendo los ecosistemas acuáticos.',
      'color': Color(0xFF0A97D9),
    },
    {
      'numero': 15,
      'titulo': 'Vida de Ecosistemas Terrestres',
      'descripcion': 'Proteger los ecosistemas terrestres y bosques.',
      'detalle': 'Proteger, restablecer y promover el uso sostenible de los ecosistemas terrestres, gestionar los bosques de forma sostenible y detener la pérdida de biodiversidad.',
      'color': Color(0xFF56C02B),
    },
    {
      'numero': 16,
      'titulo': 'Paz, Justicia e Instituciones Sólidas',
      'descripcion': 'Promover sociedades pacíficas e inclusivas.',
      'detalle': 'Promover sociedades pacíficas e inclusivas para el desarrollo sostenible, facilitar el acceso a la justicia y crear instituciones eficaces y responsables.',
      'color': Color(0xFF00689D),
    },
    {
      'numero': 17,
      'titulo': 'Alianzas para Lograr los Objetivos',
      'descripcion': 'Revitalizar la Alianza Mundial para el Desarrollo Sostenible.',
      'detalle': 'Fortalecer los medios de implementación y revitalizar la Alianza Mundial para el Desarrollo Sostenible, promoviendo la cooperación internacional.',
      'color': Color(0xFF19486A),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.public, size: 28),
            SizedBox(width: 12),
            Text(
              'Objetivos de Desarrollo',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF8D6E63),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Header informativo
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF5D4037),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.public,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Agenda 2030 - Naciones Unidas',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4E342E),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF5D4037).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    '17 objetivos para transformar nuestro mundo',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF4E342E),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Los Objetivos de Desarrollo Sostenible (ODS) constituyen un llamado universal a la acción para poner fin a la pobreza, proteger el planeta y mejorar las vidas y las perspectivas de las personas en todo el mundo.',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[700],
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  'En 2015, todos los Estados Miembros de las Naciones Unidas aprobaron 17 Objetivos como parte de la Agenda 2030 para el Desarrollo Sostenible, estableciendo un plan de 15 años para alcanzar estos objetivos y sus 169 metas.',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[700],
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          
          // Lista de ODS
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: ods.length,
              itemBuilder: (context, index) {
                final objetivo = ods[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: () {
                      _showODSDetail(context, objetivo);
                    },
                    borderRadius: BorderRadius.circular(16),
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Row(
                        children: [
                          // Número del ODS
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: objetivo['color'],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                '${objetivo['numero']}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          
                          // Título
                          Expanded(
                            child: Text(
                              objetivo['titulo'],
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[900],
                                height: 1.3,
                              ),
                            ),
                          ),
                          
                          // Icono de ver más
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey[700],
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showODSDetail(BuildContext context, Map<String, dynamic> objetivo) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          children: [
            // Handle bar
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            
            // Contenido
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Encabezado
                    Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: objetivo['color'],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Text(
                              '${objetivo['numero']}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ODS ${objetivo['numero']}',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: objetivo['color'],
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                objetivo['titulo'],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: objetivo['color'],
                                  height: 1.3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    
                    // Descripción corta
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: objetivo['color'].withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        objetivo['descripcion'],
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: objetivo['color'],
                          height: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    
                    // Detalle completo
                    const Row(
                      children: [
                        Icon(Icons.info_outline, size: 20, color: Color(0xFF666666)),
                        SizedBox(width: 8),
                        Text(
                          'Descripción Completa',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF333333),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      objetivo['detalle'],
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[800],
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Botón cerrar
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: objetivo['color'],
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Cerrar',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}