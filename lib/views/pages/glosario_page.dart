import 'package:flutter/material.dart';

class GlosarioPage extends StatefulWidget {
  const GlosarioPage({Key? key}) : super(key: key);

  @override
  State<GlosarioPage> createState() => _GlosarioPageState();
}

class _GlosarioPageState extends State<GlosarioPage> with SingleTickerProviderStateMixin {
  late AnimationController _listController;

  static final List<Map<String, String>> terminos = [
    {
      'termino': 'Desarrollo Sostenible',
      'definicion': 'El desarrollo sostenible es un concepto que busca satisfacer las necesidades del presente sin comprometer la capacidad de las futuras generaciones para satisfacer sus propias necesidades. Este enfoque integra tres pilares fundamentales: el crecimiento económico, la inclusión social y la protección ambiental. Implica utilizar los recursos naturales de manera responsable, promover energías limpias, reducir la contaminación y garantizar que todas las personas tengan acceso a una vida digna. Es un modelo que busca el equilibrio entre el progreso humano y la conservación del planeta.'
    },
    {
      'termino': 'Cambio Climático',
      'definicion': 'El cambio climático se refiere a las variaciones significativas y duraderas en los patrones climáticos globales o regionales. Aunque el clima de la Tierra ha cambiado naturalmente a lo largo de su historia, el cambio climático actual es causado principalmente por actividades humanas, especialmente la quema de combustibles fósiles que libera gases de efecto invernadero como el dióxido de carbono y el metano. Esto provoca el calentamiento global, derretimiento de glaciares, aumento del nivel del mar, eventos climáticos extremos más frecuentes y alteraciones en los ecosistemas que afectan la vida en todo el planeta.'
    },
    {
      'termino': 'Biodiversidad',
      'definicion': 'La biodiversidad, o diversidad biológica, es la variedad de todas las formas de vida en la Tierra, incluyendo la diversidad de especies de plantas, animales, hongos y microorganismos, así como la variedad genética dentro de cada especie y la diversidad de ecosistemas como bosques, océanos, desiertos y humedales. La biodiversidad es esencial para el funcionamiento de los ecosistemas, proporciona servicios vitales como la polinización, purificación del agua y aire, regulación del clima, y es fuente de alimentos, medicinas y materiales. La pérdida de biodiversidad amenaza el equilibrio ecológico y la supervivencia humana.'
    },
    {
      'termino': 'Huella de Carbono',
      'definicion': 'La huella de carbono es la cantidad total de gases de efecto invernadero, principalmente dióxido de carbono (CO₂), que son emitidos directa o indirectamente por una persona, organización, evento o producto durante su ciclo de vida. Se mide en toneladas de CO₂ equivalente y considera todas las actividades desde la producción, transporte, uso hasta la disposición final. Incluye emisiones de energía, transporte, alimentación, consumo de bienes y servicios. Calcular y reducir nuestra huella de carbono es fundamental para combatir el cambio climático mediante acciones como usar transporte público, consumir productos locales, reducir el desperdicio y optar por energías renovables.'
    },
    {
      'termino': 'Economía Circular',
      'definicion': 'La economía circular es un modelo económico alternativo al sistema lineal tradicional de "extraer-producir-usar-desechar". Se basa en tres principios: eliminar residuos y contaminación desde el diseño, mantener productos y materiales en uso el mayor tiempo posible, y regenerar sistemas naturales. Promueve la reutilización, reparación, remanufactura y reciclaje de materiales y productos. Este enfoque busca crear un sistema cerrado donde los recursos se aprovechan al máximo, se reduce la extracción de materias primas, se minimiza la generación de residuos y se crea valor económico mientras se protege el medio ambiente.'
    },
    {
      'termino': 'Energías Renovables',
      'definicion': 'Las energías renovables son fuentes de energía que se obtienen de recursos naturales que se regeneran continuamente y son prácticamente inagotables a escala humana. Incluyen la energía solar (del sol), eólica (del viento), hidroeléctrica (del agua), geotérmica (del calor interno de la Tierra), mareomotriz (de las mareas) y biomasa (de materia orgánica). A diferencia de los combustibles fósiles, no emiten gases de efecto invernadero durante su operación, son limpias y sostenibles. Su desarrollo y uso masivo es crucial para la transición energética, reducir la dependencia de combustibles fósiles y combatir el cambio climático, creando además empleo y desarrollo económico sostenible.'
    },
    {
      'termino': 'Efecto Invernadero',
      'definicion': 'El efecto invernadero es un fenómeno natural por el cual ciertos gases en la atmósfera terrestre, como el dióxido de carbono, metano, vapor de agua y óxido nitroso, atrapan el calor del sol y mantienen la temperatura del planeta en niveles que permiten la vida. Sin este efecto, la Tierra sería demasiado fría. Sin embargo, las actividades humanas, principalmente la quema de combustibles fósiles, deforestación y agricultura industrial, han aumentado significativamente la concentración de estos gases, intensificando el efecto invernadero natural y provocando el calentamiento global. Este desequilibrio genera cambios climáticos peligrosos con consecuencias severas para ecosistemas y sociedades humanas.'
    },
    {
      'termino': 'Deforestación',
      'definicion': 'La deforestación es la pérdida permanente de bosques y selvas debido a la conversión de tierras forestales para otros usos, principalmente agricultura, ganadería, minería, urbanización y extracción maderera. Los bosques son vitales porque absorben CO₂, producen oxígeno, regulan el ciclo del agua, previenen la erosión del suelo y albergan más del 80% de la biodiversidad terrestre. La deforestación contribuye significativamente al cambio climático, destruye hábitats de especies, afecta comunidades indígenas, altera regímenes de lluvias y aumenta el riesgo de inundaciones y sequías. Su combate requiere políticas de conservación, reforestación, consumo responsable y protección de áreas naturales.'
    },
  ];

  @override
  void initState() {
    super.initState();

    _listController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _listController.forward();
  }

  @override
  void dispose() {
    _listController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E8),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        title: Column(
          children: [
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.menu_book, size: 26),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Glosario Ambiental',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: const Color(0xFF2E7D32),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.auto_stories,
                  color: Color(0xFF2E7D32),
                  size: 20,
                ),
                const SizedBox(width: 10),
                Text(
                  '${terminos.length} términos ambientales',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF2E7D32),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              itemCount: terminos.length,
              itemBuilder: (context, index) {
                final termino = terminos[index];
                return AnimatedBuilder(
                  animation: _listController,
                  builder: (context, child) {
                    final delay = index * 0.08;
                    final animationValue = Curves.easeOut.transform(
                      ((_listController.value - delay) / (1 - delay)).clamp(0.0, 1.0),
                    );
                    
                    return Transform.translate(
                      offset: Offset(0, 30 * (1 - animationValue)),
                      child: Opacity(
                        opacity: animationValue,
                        child: child,
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Card(
                      elevation: 2,
                      shadowColor: Colors.black26,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Container(
                                constraints: const BoxConstraints(maxWidth: 400),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(20),
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF2E7D32),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          topRight: Radius.circular(16),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: const Icon(
                                              Icons.eco,
                                              color: Color(0xFF2E7D32),
                                              size: 24,
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Text(
                                              termino['termino']!,
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(24),
                                      constraints: const BoxConstraints(maxHeight: 400),
                                      child: SingleChildScrollView(
                                        child: Text(
                                          termino['definicion']!,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            height: 1.6,
                                            color: Colors.black87,
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          onPressed: () => Navigator.pop(context),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: const Color(0xFF2E7D32),
                                            foregroundColor: Colors.white,
                                            padding: const EdgeInsets.symmetric(vertical: 12),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            elevation: 0,
                                          ),
                                          child: const Text(
                                            'Cerrar',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Hero(
                                tag: 'icon_$index',
                                child: Container(
                                  width: 56,
                                  height: 56,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF2E7D32),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(
                                    Icons.eco,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      termino['termino']!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 17,
                                        color: Color(0xFF2E7D32),
                                        letterSpacing: 0.3,
                                        height: 1.3,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      termino['definicion']!.substring(0, termino['definicion']!.length > 85 ? 85 : termino['definicion']!.length) + '...',
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Color(0xFF2E7D32),
                                        height: 1.4,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 6),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.touch_app,
                                          size: 14,
                                          color: Color(0xFF2E7D32),
                                        ),
                                        const SizedBox(width: 4),
                                        const Text(
                                          'Ver más',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Color(0xFF2E7D32),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Color(0xFF2E7D32),
                              ),
                            ],
                          ),
                        ),
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
}