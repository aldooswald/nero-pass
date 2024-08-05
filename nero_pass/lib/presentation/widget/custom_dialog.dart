import 'package:flutter/material.dart';

import '../../config/themes.dart';
import 'custom_button.dart';

enum AlertType { success, failed, info }

class CustomDialog extends StatelessWidget {
  final String message;
  final AlertType type;
  final bool hasTwoButtons;
  final String positiveButtonText;
  final String? negativeButtonText;
  final VoidCallback onPositiveButtonPressed;
  final VoidCallback? onNegativeButtonPressed;

  const CustomDialog({
    super.key,
    required this.message,
    required this.type,
    this.hasTwoButtons = false,
    required this.positiveButtonText,
    this.negativeButtonText,
    required this.onPositiveButtonPressed,
    this.onNegativeButtonPressed,
  });

  Color _getAccentColor() {
    switch (type) {
      case AlertType.success:
        //return this color 05E5A9
        return const Color.fromARGB(255, 9, 97, 73);
      case AlertType.failed:
        return const Color.fromARGB(255, 155, 23, 14);
      default:
        return ColorPallete.neroDark;
    }
  }

  Color _getTextColor() {
    return ColorPallete.neroNearWhite;
  }

  Icon _getIcon() {
    switch (type) {
      case AlertType.success:
        return Icon(Icons.check_circle, color: _getAccentColor(), size: 48);
      case AlertType.failed:
        return Icon(Icons.error, color: _getAccentColor(), size: 48);
      default:
        return Icon(Icons.info, color: _getAccentColor(), size: 48);
    }
  }

  String _getTitle() {
    switch (type) {
      case AlertType.success:
        return 'Woo Hoo!';
      case AlertType.failed:
        return 'Oops!';
      default:
        return 'Information';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorPallete.neroNearWhite,
      shadowColor: ColorPallete.neroDark,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _getIcon(),
              const SizedBox(width: 8), // Space between icon and title
              Expanded(
                child: Text(
                  _getTitle(),
                  style: const TextStyle()
                      .semiBold
                      .large
                      .myColor(AppTextColor.primary),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16), // Space between title and message
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle().semiBold.medium.myColor(AppTextColor.grey),
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (hasTwoButtons)
              CustomButton(
                buttonType: ButtonType.outlined,
                text: negativeButtonText ?? 'Cancel',
                onPressed: onNegativeButtonPressed ??
                    () {
                      Navigator.of(context).pop();
                    },
                foregroundColor: _getAccentColor(),
                borderColor: _getAccentColor(),
              ),
            if (hasTwoButtons)
              const SizedBox(width: 8), // Space between buttons
            CustomButton(
              buttonType: ButtonType.elevated,
              text: positiveButtonText,
              onPressed: onPositiveButtonPressed,
              backgroundColor: _getAccentColor(),
              foregroundColor: _getTextColor(),
            ),
          ],
        ),
      ],
    );
  }
}
