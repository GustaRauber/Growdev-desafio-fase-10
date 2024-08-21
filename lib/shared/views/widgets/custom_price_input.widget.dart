import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';

class CustomPriceInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isRequired;
  final String? Function(String?)? validator;

  final CurrencyTextInputFormatter formatter;
  const CustomPriceInput({
    super.key,
    required this.label,
    required this.controller,
    required this.formatter,
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
            if (formatter.getUnformattedValue() == 0) return 'Digite um valor';
            return null;
          },
      inputFormatters: [formatter],
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
