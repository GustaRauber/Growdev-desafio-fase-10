import 'package:flutter/material.dart';

class ValueRelease extends StatelessWidget {
  final double amount;
  final bool isInflow;
  const ValueRelease({
    super.key,
    required this.amount,
    required this.isInflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '${isInflow ? '+' : '-'} R\$ $amount',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: isInflow ? Colors.green : Colors.red,
      ),
    );
  }
}
