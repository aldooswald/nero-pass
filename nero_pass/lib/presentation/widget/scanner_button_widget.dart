import 'package:flutter/material.dart';

import '../../config/themes.dart';

class ScannerCircularButton extends StatefulWidget {
  final VoidCallback onTap;
  final IconData icon;

  const ScannerCircularButton(
      {super.key, required this.onTap, required this.icon});

  @override
  // ignore: library_private_types_in_public_api
  _ScannerCircularButtonState createState() => _ScannerCircularButtonState();
}

class _ScannerCircularButtonState extends State<ScannerCircularButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1.0, end: 0.75).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    _controller.reverse().then((_) {
      widget.onTap();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: () => _controller.reverse(),
      child: ScaleTransition(
        scale: _animation,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.45,
          height: MediaQuery.of(context).size.width * 0.45,
          decoration: BoxDecoration(
            border: Border.all(
              color: ColorPallete.neroDark,
              width: 4,
            ),
            shape: BoxShape.circle,
            color: ColorPallete.neroLight,
            boxShadow: [
              BoxShadow(
                color: ColorPallete.neroLight.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 15,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                color: ColorPallete.neroDark,
                size: MediaQuery.of(context).size.width *
                    0.15, // Adjust the icon size as needed
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Scan ID',
                style: const TextStyle()
                    .semiBold
                    .large
                    .myColor(AppTextColor.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
