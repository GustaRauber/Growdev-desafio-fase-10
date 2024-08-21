import 'package:flutter/material.dart';

class OptionalSetings extends StatelessWidget {
  final Widget child;

  final void Function()? onPressed;

  const OptionalSetings({
    super.key,
    required this.child,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onPressed,
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: child,
          ),
        ),
        const Divider(
          thickness: 1,
        ),
      ],
    );
  }
}
