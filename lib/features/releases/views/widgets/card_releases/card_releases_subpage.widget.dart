import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nikel_app/shared/views/modals/error.modal.dart';
import '../../releases.store.dart';
import '../consolidated_value.widget.dart';
import 'list_card_releases.widget.dart';

class CardReleasesSubPage extends StatelessWidget {
  final ReleasesStore store;
  const CardReleasesSubPage({super.key, required this.store});

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
              child: Row(
                children: [
                  Expanded(
                    child: ListCardReleases(
                      isInflow: true,
                      releases: store.inFlowReleases,
                      onRemoveRelease: (int id) async {
                        await store.removeRelease(id);
                        if (store.errorRemoveRelease != null) {
                          ErrorModal.show(
                              context: context,
                              message: store.errorRemoveRelease!);
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: ListCardReleases(
                      isInflow: false,
                      releases: store.outFlowReleases,
                      onRemoveRelease: (int id) async {
                        await store.removeRelease(id);
                        if (store.errorRemoveRelease != null) {
                          ErrorModal.show(
                              context: context,
                              message: store.errorRemoveRelease!);
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }
}
