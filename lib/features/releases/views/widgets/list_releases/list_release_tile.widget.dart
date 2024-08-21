import 'package:flutter/material.dart';

import '../../../models/release.model.dart';
import '../date_release.widget.dart';
import '../value_release.widget.dart';

class ListReleaseTile extends StatelessWidget {
  final Release release;
  const ListReleaseTile({super.key, required this.release});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DateRelease(date: release.date),
            const SizedBox(height: 12),
            Text(release.description)
          ],
        ),
        ValueRelease(
          isInflow: release.isInflow,
          amount: release.value,
        )
      ],
    );
  }
}
