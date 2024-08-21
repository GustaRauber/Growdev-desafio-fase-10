import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final void Function()? onPressed;
  final bool isLoading;
  final String label;
  final Color? color;
  const CustomButton({
    super.key,
    this.width = 150,
    this.isLoading = false,
    this.onPressed,
    required this.label,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 40,
      child: ElevatedButton(
        style: color != null
            ? ElevatedButton.styleFrom(backgroundColor: color)
            : null,
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(),
              )
            : Text(label),
      ),
    );
  }
}
