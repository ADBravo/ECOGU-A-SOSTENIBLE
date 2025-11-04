import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumericInputField extends StatelessWidget {
  final String label;
  final String section;
  final String keyName;
  final bool isInt;
  final bool max100;
  final Map<String, dynamic> data;

  const NumericInputField({
    required this.label,
    required this.section,
    required this.keyName,
    required this.data,
    this.isInt = false,
    this.max100 = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currentValue = data[section]?[keyName]?.toString() ?? '';

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        initialValue: currentValue,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
          if (max100)
            TextInputFormatter.withFunction((oldValue, newValue) {
              final text = newValue.text;
              final parsed = double.tryParse(text);
              if (parsed != null && parsed > 100) {
                return oldValue;
              }
              return newValue;
            }),
        ],
        validator: (value) {
          if (value == null || value.isEmpty) return 'Requerido';
          final parsed = double.tryParse(value);
          if (parsed == null) return 'Número inválido';
          if (max100 && parsed > 100) return 'Máximo permitido: 100';
          return null;
        },
        onChanged: (value) {
          if (value.isEmpty) return;
          final parsed = isInt ? int.tryParse(value) : double.tryParse(value);
          if (parsed != null) {
            data[section][keyName] = parsed;
          }
        },
        onSaved: (value) {
          final parsed = isInt ? int.parse(value!) : double.parse(value!);
          data[section][keyName] = parsed;
        },
      ),
    );
  }
}