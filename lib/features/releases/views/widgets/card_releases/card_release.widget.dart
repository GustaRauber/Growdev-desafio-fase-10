import 'package:flutter/material.dart';
import 'package:nikel_app/features/releases/views/widgets/value_release.widget.dart';
import '../../../../../theme/app_colors.dart';
import '../../../models/release.model.dart';
import '../date_release.widget.dart';

class CardRelease extends StatelessWidget {
  final Release release;
  const CardRelease({super.key, required this.release});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    return Container(
      height: 110,
      padding: const EdgeInsets.all(8),
      margin: release.isInflow
          ? const EdgeInsets.only(right: 2.5)
          : const EdgeInsets.only(left: 2.5),
      decoration: BoxDecoration(
        border: Border.all(
          color: appColors.lineColor,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            child: ValueRelease(
              amount: release.value,
              isInflow: release.isInflow,
            ),
          ),
          Text(
            release.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13,
            ),
          ),
          DateRelease(date: release.date),
        ],
      ),
    );
  }
}
