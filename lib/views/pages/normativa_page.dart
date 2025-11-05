import 'package:flutter/material.dart';
import 'package:huella_carbono/views/widgets/normativa_section.dart';

class NormativaPage extends StatelessWidget {
  const NormativaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.gavel, size: 28),
            SizedBox(width: 12),
            Text(
              'Normativa Ambiental',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF5E35B1),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header informativo
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(28),
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
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: const Color(0xFF5E35B1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.account_balance,
                      size: 45,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Legislación Ambiental Colombiana',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF5E35B1),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF5E35B1).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Text(
                      'Marco legal para la protección ambiental',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF5E35B1),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Colombia cuenta con uno de los marcos legales ambientales más completos de América Latina, desarrollado para garantizar la protección y conservación de nuestros recursos naturales.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                      height: 1.6,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),

            // Secciones de normativa
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _buildNormativaCard(
                    titulo: 'Ley 99 de 1993',
                    subtitulo: 'Ley del Medio Ambiente',
                    icono: Icons.article_outlined,
                    color: const Color(0xFF5E35B1),
                    contenido: [
                      'La Ley 99 de 1993 es la norma marco de la gestión ambiental en Colombia. Esta ley creó el Ministerio del Medio Ambiente (hoy Ministerio de Ambiente y Desarrollo Sostenible) y organizó el Sistema Nacional Ambiental (SINA).',
                      '',
                      'Principios fundamentales:',
                      '',
                      '• El desarrollo económico y social se orienta por principios del desarrollo sostenible',
                      '',
                      '• La biodiversidad es patrimonio nacional y de interés de la humanidad',
                      '',
                      '• Las políticas ambientales son de obligatorio cumplimiento',
                      '',
                      '• La protección ambiental es tarea conjunta del Estado, comunidad y empresas',
                    ],
                  ),
                  const SizedBox(height: 16),

                  _buildNormativaCard(
                    titulo: 'Sistema Nacional Ambiental',
                    subtitulo: 'SINA - Estructura Institucional',
                    icono: Icons.account_tree_outlined,
                    color: const Color(0xFF7E57C2),
                    contenido: [
                      'El SINA permite implementar los principios ambientales de la Ley 99 de 1993, articulando las acciones de protección ambiental en todo el territorio nacional.',
                      '',
                      'Componentes principales:',
                      '',
                      '• Ministerio de Ambiente y Desarrollo Sostenible',
                      '',
                      '• Corporaciones Autónomas Regionales (CAR)',
                      '',
                      '• Institutos de investigación: IDEAM, INVEMAR, SINCHI',
                      '',
                      '• Autoridades ambientales urbanas',
                      '',
                      '• Entidades territoriales: departamentos y municipios',
                    ],
                  ),
                  const SizedBox(height: 16),

                  _buildNormativaCard(
                    titulo: 'Decreto 2811 de 1974',
                    subtitulo: 'Código Nacional de Recursos Naturales Renovables',
                    icono: Icons.eco_outlined,
                    color: const Color(0xFF66BB6A),
                    contenido: [
                      'Considerado la primera gran norma ambiental en Colombia, establece las bases para la administración y uso sostenible de los recursos naturales renovables del país.',
                      '',
                      'Aspectos principales:',
                      '',
                      '• Regula el uso y aprovechamiento de recursos como agua, suelo, flora y fauna',
                      '',
                      '• Establece principios de propiedad, uso y conservación de recursos naturales',
                      '',
                      '• Define mecanismos para prevenir y controlar la contaminación ambiental',
                      '',
                      '• Reglamenta la explotación forestal y protección de bosques',
                      '',
                      '• Establece normas para la preservación de áreas naturales protegidas',
                    ],
                  ),
                  const SizedBox(height: 16),

                  _buildNormativaCard(
                    titulo: 'Ley 1333 de 2009',
                    subtitulo: 'Procedimiento Sancionatorio Ambiental',
                    icono: Icons.gavel_outlined,
                    color: const Color(0xFFEF5350),
                    contenido: [
                      'Esta ley establece el procedimiento sancionatorio para quienes infringen la normativa ambiental, garantizando la protección efectiva del medio ambiente mediante sanciones y medidas correctivas.',
                      '',
                      'Elementos clave:',
                      '',
                      '• Define las infracciones ambientales y sus respectivas sanciones',
                      '',
                      '• Establece multas económicas que pueden alcanzar hasta 5.000 salarios mínimos',
                      '',
                      '• Contempla medidas preventivas como decomiso, suspensión de obras o cierre temporal',
                      '',
                      '• Permite la imposición de trabajo comunitario relacionado con restauración ambiental',
                      '',
                      '• Garantiza el debido proceso y derecho a la defensa del infractor',
                    ],
                  ),
                  const SizedBox(height: 16),

                  _buildNormativaCard(
                    titulo: 'Ley 1753 de 2015',
                    subtitulo: 'Plan Nacional de Desarrollo 2014-2018',
                    icono: Icons.trending_up_outlined,
                    color: const Color(0xFF42A5F5),
                    contenido: [
                      'Plan Nacional de Desarrollo que incluyó importantes disposiciones ambientales para promover el crecimiento verde y sostenible del país.',
                      '',
                      'Componentes ambientales:',
                      '',
                      '• Promoción del crecimiento verde como motor de desarrollo económico',
                      '',
                      '• Estrategias para la adaptación al cambio climático',
                      '',
                      '• Protección y conservación de ecosistemas estratégicos',
                      '',
                      '• Gestión integral de recursos hídricos',
                      '',
                      '• Incentivos para proyectos de energías limpias y renovables',
                    ],
                  ),
                  const SizedBox(height: 16),

                  _buildNormativaCard(
                    titulo: 'Resolución 0631 de 2015',
                    subtitulo: 'Vertimientos Puntuales a Cuerpos de Agua',
                    icono: Icons.water_drop_outlined,
                    color: const Color(0xFF26C6DA),
                    contenido: [
                      'Establece los parámetros y valores límites máximos permisibles en los vertimientos puntuales a cuerpos de agua superficiales y sistemas de alcantarillado público.',
                      '',
                      'Aspectos regulados:',
                      '',
                      '• Límites máximos de contaminantes como DBO, DQO, sólidos suspendidos y pH',
                      '',
                      '• Parámetros diferenciados según el sector productivo (minero, agroindustrial, manufactura)',
                      '',
                      '• Requisitos de medición y monitoreo de calidad de vertimientos',
                      '',
                      '• Plazos para cumplimiento gradual según tamaño de empresa',
                      '',
                      '• Obligación de implementar sistemas de tratamiento de aguas residuales',
                    ],
                  ),
                  const SizedBox(height: 16),

                  _buildNormativaCard(
                    titulo: 'Resolución 2254 de 2017',
                    subtitulo: 'Calidad del Aire y Niveles de Contaminación',
                    icono: Icons.air_outlined,
                    color: const Color(0xFF9575CD),
                    contenido: [
                      'Adopta la norma de calidad del aire ambiente y establece los niveles máximos permisibles de contaminantes en el aire para proteger la salud humana y el medio ambiente.',
                      '',
                      'Principales regulaciones:',
                      '',
                      '• Niveles máximos de Material Particulado (PM2.5 y PM10)',
                      '',
                      '• Límites para gases contaminantes: dióxido de azufre, dióxido de nitrógeno, ozono',
                      '',
                      '• Establecimiento de Índice de Calidad del Aire (ICA)',
                      '',
                      '• Protocolos de monitoreo y medición de calidad del aire',
                      '',
                      '• Medidas de prevención y contingencia ante episodios de alta contaminación',
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Nota informativa destacada
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xFF5E35B1).withOpacity(0.3),
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF5E35B1).withOpacity(0.1),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF5E35B1).withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.verified_outlined,
                            size: 35,
                            color: Color(0xFF5E35B1),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          '¿Sabías qué?',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF5E35B1),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'La normativa ambiental colombiana es reconocida internacionalmente como uno de los marcos legales más completos y avanzados de América Latina, estableciendo estándares de protección para nuestros ecosistemas.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[800],
                            height: 1.6,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNormativaCard({
    required String titulo,
    required String subtitulo,
    required IconData icono,
    required Color color,
    required List<String> contenido,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header de la tarjeta
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    icono,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titulo,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: color,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitulo,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Contenido
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: contenido.map((texto) {
                if (texto.isEmpty) {
                  return const SizedBox(height: 8);
                }
                
                final esTitulo = !texto.startsWith('•') && 
                               !texto.contains('Decreto') &&
                               !texto.contains('Ley') &&
                               !texto.contains('Resolución') &&
                               contenido.indexOf(texto) > 0 &&
                               contenido.indexOf(texto) < contenido.length - 1 &&
                               !contenido[contenido.indexOf(texto) - 1].startsWith('•');
                
                final esNorma = texto.contains('Decreto') ||
                               texto.contains('Ley') ||
                               texto.contains('Resolución');
                
                if (esTitulo) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Row(
                      children: [
                        Container(
                          width: 4,
                          height: 20,
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          texto,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: color,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                
                if (esNorma) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      texto,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[900],
                        height: 1.5,
                      ),
                    ),
                  );
                }
                
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: 6,
                    left: texto.startsWith('•') ? 0 : 0,
                  ),
                  child: Text(
                    texto,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
                      height: 1.6,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}