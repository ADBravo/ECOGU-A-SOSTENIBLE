import 'package:flutter/material.dart';
import 'package:huella_carbono/views/widgets/normativa_section.dart';

class NormativaPage extends StatelessWidget {
  const NormativaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Normativa Ambiental'),
        backgroundColor: const Color(0xFF5E35B1),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Center(
              child: Column(
                children: [
                  const Icon(Icons.gavel, size: 70, color: Color(0xFF5E35B1)),
                  const SizedBox(height: 16),
                  Text(
                    'Legislación Ambiental\nColombiana',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Marco legal para la protección del medio ambiente',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Secciones
            const NormativaSection(
              titulo: 'Ley 99 de 1993',
              subtitulo: 'Ley del Medio Ambiente',
              icono: Icons.article,
              color: Color(0xFF5E35B1),
              contenido: [
                'La Ley 99 de 1993 es la norma marco de la gestión ambiental en Colombia. Esta ley creó el Ministerio del Medio Ambiente (hoy Ministerio de Ambiente y Desarrollo Sostenible) y organizó el Sistema Nacional Ambiental (SINA).',
                '',
                '📌 Principios fundamentales:',
                '',
                '• El desarrollo económico y social se orienta por principios del desarrollo sostenible.',
                '• La biodiversidad es patrimonio nacional y de interés de la humanidad.',
                '• Las políticas ambientales son de obligatorio cumplimiento.',
                '• La protección ambiental es tarea conjunta del Estado, comunidad y empresas.',
              ],
            ),
            const SizedBox(height: 24),

            const NormativaSection(
              titulo: 'Sistema Nacional Ambiental (SINA)',
              subtitulo: 'Estructura Institucional',
              icono: Icons.account_tree,
              color: Color(0xFF5E35B1),
              contenido: [
                'El SINA permite implementar los principios ambientales de la Ley 99 de 1993.',
                '',
                '🏛️ Componentes principales:',
                '',
                '• Ministerio de Ambiente y Desarrollo Sostenible',
                '• Corporaciones Autónomas Regionales (CAR)',
                '• Institutos de investigación: IDEAM, INVEMAR, SINCHI',
                '• Autoridades ambientales urbanas',
                '• Entidades territoriales: departamentos y municipios',
              ],
            ),
            const SizedBox(height: 24),

            const NormativaSection(
              titulo: 'Otras Normas Relevantes',
              subtitulo: 'Marco Legal Complementario',
              icono: Icons.menu_book,
              color: Color(0xFF5E35B1),
              contenido: [
                '📜 Decreto 2811 de 1974 - Código Nacional de Recursos Naturales Renovables',
                '⚖️ Ley 1333 de 2009 - Procedimiento sancionatorio ambiental',
                '📋 Ley 1753 de 2015 - Plan Nacional de Desarrollo con disposiciones ambientales',
                '💧 Resolución 0631 de 2015 - Parámetros de vertimientos puntuales',
                '🌬️ Resolución 2254 de 2017 - Norma de calidad del aire ambiente',
              ],
            ),
            const SizedBox(height: 32),

            // Nota informativa
            Card(
              elevation: 3,
              color: const Color(0xFF5E35B1).withOpacity(0.1),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    const Icon(Icons.info_outline, size: 40, color: Color(0xFF5E35B1)),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'La normativa ambiental colombiana es uno de los marcos legales más completos de América Latina.',
                        style: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey[800],
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}