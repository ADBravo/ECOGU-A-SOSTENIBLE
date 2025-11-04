import 'package:flutter/material.dart';

class ModuloCard extends StatelessWidget {
  final String titulo;
  final IconData icono;
  final Color color;
  final VoidCallback onTap;

  const ModuloCard({
    required this.titulo,
    required this.icono,
    required this.color,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: color.withOpacity(0.4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color, color.withOpacity(0.7)],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icono, size: 56, color: Colors.white),
              const SizedBox(height: 16),
              Text(
                titulo,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}