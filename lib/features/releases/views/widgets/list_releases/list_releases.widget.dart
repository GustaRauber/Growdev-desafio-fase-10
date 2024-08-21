import 'package:flutter/material.dart';

import '../../../models/release.model.dart';
import 'list_release_tile.widget.dart';

class ListReleases extends StatelessWidget {
  final List<Release> releases;
  final void Function(int) onRemoveRelease;
  const ListReleases({
    super.key,
    required this.releases,
    required this.onRemoveRelease,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Todos os lançamentos",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        const Divider(thickness: 1),
        Expanded(
          child: ListView.separated(
            itemCount: releases.length,
            separatorBuilder: (_, __) => const Divider(thickness: 1),
            itemBuilder: (_, index) {
              final release = releases[index];
              return InkWell(
                onLongPress: () => onRemoveRelease(release.id),
                child: ListReleaseTile(release: release),
              );
            },
          ),
        ),
      ],
    );
  }
}
