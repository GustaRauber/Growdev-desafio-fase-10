import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDateInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isRequired;
  final String? Function(String?)? validator;

  const CustomDateInput({
    super.key,
    required this.label,
    required this.controller,
    this.isRequired = true,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        labelText: label,
      ),
      keyboardType: TextInputType.number,
      validator: validator ??
          (value) {
            if (!isRequired) return null;
            if (value == null || value.isEmpty) return 'Campo obrigatório';
            return null;
          },
      onTap: () async {
        final selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(3000),
        );

        if (selectedDate != null) {
          controller.text = DateFormat('dd/MM/yyyy').format(selectedDate);
        }
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
