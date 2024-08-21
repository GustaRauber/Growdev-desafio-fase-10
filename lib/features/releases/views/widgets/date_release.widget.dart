import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../theme/app_colors.dart';

class DateRelease extends StatelessWidget {
  final DateTime date;
  const DateRelease({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    return Row(
      children: [
        Icon(
          Icons.calendar_month_outlined,
          color: appColors.primaryColor,
          size: 20,
        ),
        const SizedBox(
          width: 5,
        ),
        FittedBox(
          child: Text(
            DateFormat('dd/MM/yyyy').format(date),
          ),
        )
      ],
    );
  }
}
