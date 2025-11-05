import 'package:flutter/material.dart';
import 'package:huella_carbono/routes/router.dart';
import 'package:huella_carbono/views/pages/glosario_page.dart';
import 'package:huella_carbono/views/pages/calculadora_page.dart';
import 'package:huella_carbono/views/pages/ods_page.dart';
import 'package:huella_carbono/views/pages/normativa_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? visitCount;

  @override
  void initState() {
    super.initState();
    _loadVisits();
  }

  Future<void> _loadVisits() async {
    final response = await AppRouter().route('/api/visits');
    if (response['visits'] != null) {
      setState(() {
        visitCount = response['visits'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // HEADER
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF1B5E20),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.06,
                  vertical: screenHeight * 0.01,
                ),
                child: Column(
                  children: [
                    // Icono principal
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.eco,
                        size: 30,
                        color: Color(0xFF1B5E20),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    
                    // Título
                    const Text(
                      'Educación Ambiental',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    
                    // Descripción
                    const Text(
                      'Aprende sobre sostenibilidad y protección del medio ambiente',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                        height: 1.4,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    
                    // Stats
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Módulos disponibles
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2E7D32),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.apps,
                                color: Colors.white,
                                size: 18,
                              ),
                              SizedBox(width: 8),
                              Text(
                                '4 Módulos',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        if (visitCount != null) ...[
                          const SizedBox(width: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF388E3C),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.visibility,
                                  color: Colors.white,
                                  size: 18,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  '$visitCount Visitas',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
            // CONTENIDO
            Expanded(
              child: Container(
                color: const Color(0xFFF5F5F5),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: screenHeight * 0.01),
                        
                        // Título de sección
                        Row(
                          children: [
                            Container(
                              width: 5,
                              height: 32,
                              decoration: BoxDecoration(
                                color: const Color(0xFF1B5E20),
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Explora Nuestros Módulos',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1B5E20),
                                  ),
                                ),
                                Text(
                                  'Selecciona un módulo para comenzar',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF558B2F),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        
                        // MÓDULOS
                        _buildModuloCard(
                          context: context,
                          titulo: 'Glosario Ambiental',
                          descripcion: 'Conceptos y definiciones clave',
                          icono: Icons.menu_book_rounded,
                          color: const Color(0xFF1B5E20),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const GlosarioPage()),
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        _buildModuloCard(
                          context: context,
                          titulo: 'Calculadora de Huella',
                          descripcion: 'Mide tu impacto ambiental',
                          icono: Icons.calculate_rounded,
                          color: const Color(0xFF0D47A1),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const CalculadoraPage()),
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        _buildModuloCard(
                          context: context,
                          titulo: 'Objetivos de Desarrollo',
                          descripcion: 'Conoce los ODS de la ONU',
                          icono: Icons.public_rounded,
                          color: const Color(0xFFE65100),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const ODSPage()),
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        _buildModuloCard(
                          context: context,
                          titulo: 'Normativa Ambiental',
                          descripcion: 'Leyes y regulaciones vigentes',
                          icono: Icons.gavel_rounded,
                          color: const Color(0xFF4A148C),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const NormativaPage()),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        
                        // Footer
                        Container(
                          padding: const EdgeInsets.all(22),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: const Color(0xFF1B5E20),
                              width: 2,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF1B5E20),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.forest,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              const SizedBox(width: 18),
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Juntos por el planeta',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF1B5E20),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Cada acción cuenta para un futuro sostenible',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xFF558B2F),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModuloCard({
    required BuildContext context,
    required String titulo,
    required String descripcion,
    required IconData icono,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              // Icono
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  icono,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              const SizedBox(width: 18),
              
              // Textos
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titulo,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: color,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      descripcion,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[700],
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Flecha
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.arrow_forward_rounded,
                  color: color,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}