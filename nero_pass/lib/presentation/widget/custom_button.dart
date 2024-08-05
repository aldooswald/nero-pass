import 'package:flutter/material.dart';

import '../../config/themes.dart';

enum ButtonType { elevated, outlined }

class CustomButton extends StatelessWidget {
  final ButtonType buttonType;
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;

  const CustomButton({
    super.key,
    required this.buttonType,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    const defaultBackgroundColor =
        ColorPallete.neroDark; // Default background color
    const defaultForegroundColor =
        ColorPallete.neroNearWhite; // Default text color
    const defaultBorderColor = ColorPallete.neroDark; // Default border color

    final bgColor = backgroundColor ?? defaultBackgroundColor;
    final fgColor = foregroundColor ?? defaultForegroundColor;
    final brColor = borderColor ?? defaultBorderColor;

    switch (buttonType) {
      case ButtonType.outlined:
        return OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: fgColor,
            side: BorderSide(color: brColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: fgColor,
            ),
          ),
        );
      case ButtonType.elevated:
        return ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: fgColor,
            backgroundColor: bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: fgColor,
            ),
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
