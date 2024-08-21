import 'package:flutter/material.dart';

import '../../../models/release.model.dart';
import 'card_release.widget.dart';

class ListCardReleases extends StatelessWidget {
  final List<Release> releases;
  final bool isInflow;
  final void Function(int) onRemoveRelease;

  const ListCardReleases({
    super.key,
    required this.isInflow,
    required this.releases,
    required this.onRemoveRelease,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              isInflow ? "Entradas" : "Saídas",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Icon(
              isInflow ? Icons.arrow_circle_up : Icons.arrow_circle_down,
              size: 35,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          thickness: 1,
        ),
        Expanded(
          child: ListView.separated(
            itemCount: releases.length,
            separatorBuilder: (_, __) => const SizedBox(height: 5),
            itemBuilder: (_, index) {
              final release = releases[index];
              return InkWell(
                onLongPress: () => onRemoveRelease(release.id),
                child: CardRelease(release: release),
              );
            },
          ),
        )
      ],
    );
  }
}
