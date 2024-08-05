import 'package:flutter/material.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.construction,
              size: 100,
            ),
            SizedBox(height: 16),
            Text(
              'Coming Soon',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
