import 'package:flutter/material.dart';
import 'package:nero_pass/data/models/remote/history_model.dart';

import '../../config/themes.dart';

class HistoryWidget extends StatelessWidget {
  final HistoryDatum data;
  final bool isRecentActivity;

  const HistoryWidget({
    super.key,
    required this.data,
    required this.isRecentActivity,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        isRecentActivity ? ColorPallete.neroDark : ColorPallete.neroLight;
    final textColor =
        isRecentActivity ? AppTextColor.nearWhite : AppTextColor.primary;
    final trailingTextColor =
        isRecentActivity ? AppTextColor.primary : AppTextColor.secondary;
    final trailingBackgroundColor =
        isRecentActivity ? ColorPallete.neroLight : ColorPallete.neroDark;
    final trailingText = isRecentActivity ? data.time : data.onlyTime;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: backgroundColor,
      ),
      child: ListTile(
        title: Text(
          data.name,
          style: const TextStyle().regular.medium.myColor(textColor),
        ),
        subtitle: Text(
          data.origin,
          style: const TextStyle().regular.medium.myColor(textColor),
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: trailingBackgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            trailingText,
            style: const TextStyle().regular.medium.myColor(trailingTextColor),
          ),
        ),
      ),
    );
  }
}
