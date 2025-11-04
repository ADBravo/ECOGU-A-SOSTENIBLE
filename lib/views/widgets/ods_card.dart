import 'package:flutter/material.dart';

class ODSCard extends StatelessWidget {
  final Map<String, dynamic> objetivo;

  const ODSCard({required this.objetivo, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: objetivo['color'].withOpacity(0.4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              title: Row(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: objetivo['color'],
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${objetivo['numero']}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      objetivo['titulo'],
                      style: const TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
              content: Text(
                objetivo['descripcion'],
                style: const TextStyle(fontSize: 15, height: 1.5),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(foregroundColor: objetivo['color']),
                  child: const Text('Cerrar'),
                ),
              ],
            ),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [objetivo['color'], objetivo['color'].withOpacity(0.8)],
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 55,
                height: 55,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '${objetivo['numero']}',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: objetivo['color'],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Text(
                objetivo['titulo'],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}