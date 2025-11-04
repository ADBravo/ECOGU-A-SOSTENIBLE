import 'package:flutter/material.dart';

class NormativaSection extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final IconData icono;
  final Color color;
  final List<String> contenido;

  const NormativaSection({
    required this.titulo,
    required this.subtitulo,
    required this.icono,
    required this.color,
    required this.contenido,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icono, size: 30, color: color),
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
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ...contenido.map((texto) {
              if (texto.isEmpty) return const SizedBox(height: 8);

              final esTitulo = texto.contains('📌') ||
                  texto.contains('🏛️') ||
                  texto.contains('📜') ||
                  texto.contains('⚖️') ||
                  texto.contains('📋') ||
                  texto.contains('💧') ||
                  texto.contains('🌬️');

              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  texto,
                  style: TextStyle(
                    fontSize: esTitulo ? 15 : 14,
                    height: 1.6,
                    color: esTitulo ? Colors.black87 : Colors.grey[800],
                    fontWeight: esTitulo ? FontWeight.w600 : FontWeight.normal,
                  ),
                  textAlign: TextAlign.justify,
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}