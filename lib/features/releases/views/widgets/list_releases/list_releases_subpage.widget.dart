import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../../shared/views/modals/error.modal.dart';
import '../../releases.store.dart';
import '../consolidated_value.widget.dart';
import 'list_releases.widget.dart';

class ListReleasesSubPage extends StatelessWidget {
  final ReleasesStore store;
  const ListReleasesSubPage({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Observer(
          builder: (_) {
            return ConsolidatedValue(
              amountValue: store.walletBalance,
              isLoading: store.isLoadingBalance,
            );
          },
        ),
        Expanded(
          child: Observer(builder: (context) {
            if (store.isLoadingReleases) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(15),
              child: ListReleases(
                releases: store.releases,
                onRemoveRelease: (int id) async {
                  await store.removeRelease(id);
                  if (store.errorRemoveRelease != null) {
                    ErrorModal.show(
                        context: context, message: store.errorRemoveRelease!);
                  }
                },
              ),
            );
          }),
        )
      ],
    );
  }
}
