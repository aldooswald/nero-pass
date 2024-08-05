import 'package:flutter/material.dart';
import 'package:nero_pass/config/themes.dart';

import '../presentation/widget/custom_dialog.dart';

void showCustomAlertDialog({
  required BuildContext context,
  required String message,
  required AlertType type,
  bool hasTwoButtons = false,
  required String positiveButtonText,
  String? negativeButtonText,
  required VoidCallback onPositiveButtonPressed,
  VoidCallback? onNegativeButtonPressed,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return CustomDialog(
        message: message,
        type: type,
        hasTwoButtons: hasTwoButtons,
        positiveButtonText: positiveButtonText,
        negativeButtonText: negativeButtonText,
        onPositiveButtonPressed: onPositiveButtonPressed,
        onNegativeButtonPressed: onNegativeButtonPressed,
      );
    },
  );
}

Widget showProgressIndicator(BuildContext context) {
  return const Center(
    child: CircularProgressIndicator(
      color: ColorPallete.neroDark,
    ),
  );
}
