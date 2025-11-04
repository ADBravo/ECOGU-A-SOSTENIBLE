import 'package:flutter/material.dart';
import 'package:huella_carbono/routes/router.dart';
import 'package:huella_carbono/views/pages/glosario_page.dart';
import 'package:huella_carbono/views/pages/calculadora_page.dart';
import 'package:huella_carbono/views/pages/ods_page.dart';
import 'package:huella_carbono/views/pages/normativa_page.dart';
import 'package:huella_carbono/views/widgets/modulo_card.dart';

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
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF2E7D32), Color(0xFF66BB6A)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                child: Column(
                  children: [
                    const Icon(Icons.eco, size: 80, color: Colors.white),
                    const SizedBox(height: 20),
                    Text(
                      'Educación Ambiental',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Aprende sobre sostenibilidad y medio ambiente',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    if (visitCount != null) ...[
                      const SizedBox(height: 16),
                      Text(
                        '👀 Visitas: $visitCount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 0.9,
                      children: [
                        ModuloCard(
                          titulo: 'Glosario\nAmbiental',
                          icono: Icons.menu_book,
                          color: const Color(0xFF2E7D32),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const GlosarioPage()),
                          ),
                        ),
                        ModuloCard(
                          titulo: 'Calculadora\nde Huella',
                          icono: Icons.calculate,
                          color: const Color(0xFF1976D2),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const CalculadoraPage()),
                          ),
                        ),
                        ModuloCard(
                          titulo: 'Objetivos de\nDesarrollo',
                          icono: Icons.public,
                          color: const Color(0xFFFF6F00),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const ODSPage()),
                          ),
                        ),
                        ModuloCard(
                          titulo: 'Normativa\nAmbiental',
                          icono: Icons.gavel,
                          color: const Color(0xFF5E35B1),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const NormativaPage()),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}