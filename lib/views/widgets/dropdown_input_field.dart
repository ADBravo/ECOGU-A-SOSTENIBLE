import 'package:flutter/material.dart';

class DropdownInputField extends StatelessWidget {
  final String label;
  final String section;
  final String keyName;
  final List<String> options;
  final Map<String, dynamic> data;

  const DropdownInputField({
    required this.label,
    required this.section,
    required this.keyName,
    required this.options,
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currentValue = data[section]?[keyName];

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: DropdownButtonFormField<String>(
        value: currentValue,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
        ),
        items: options.map((opt) => DropdownMenuItem(value: opt, child: Text(opt))).toList(),
        validator: (value) => value == null || value.isEmpty ? 'Requerido' : null,
        onChanged: (value) => data[section][keyName] = value!,
        onSaved: (value) => data[section][keyName] = value!,
      ),
    );
  }
}