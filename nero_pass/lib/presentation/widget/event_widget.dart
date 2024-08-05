import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/themes.dart';

class EventWidget extends StatelessWidget {
  final String name;
  final String imageUrl;

  const EventWidget({
    Key? key,
    required this.name,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed('attendance-detail', queryParameters: {
          'event': name,
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: ColorPallete.neroNearWhite,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: ColorPallete.neroDark,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: ColorPallete.neroGrey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  imageUrl,
                  width: MediaQuery.of(context).size.width * 0.45 * 0.7,
                  height: MediaQuery.of(context).size.width *
                      0.45, // Maintain aspect ratio
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: ColorPallete.neroDark,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
