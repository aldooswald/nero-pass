import 'package:flutter/material.dart';

import '../../config/themes.dart';
import '../widget/menu_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(
              height: 32,
            ),
            _buildMenu(),
            const SizedBox(
              height: 32,
            ),
            _buildRecentActivity()
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hey Nerosian!",
                    style: const TextStyle()
                        .semiBold
                        .large
                        .myColor(AppTextColor.primary)),
                Text("Welcome back to NeroPass.",
                    style: const TextStyle()
                        .regular
                        .mediumSize
                        .myColor(AppTextColor.primary)),
              ]),
        ],
      ),
    );
  }

  Widget _buildMenu() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Menu",
                style: const TextStyle()
                    .bold
                    .mediumSize
                    .myColor(AppTextColor.primary)),
          ],
        ),
        const SizedBox(height: 12),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MenuWidget(
              icon: 'assets/images/attendance_menu.png',
              title: 'Attendance',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRecentActivity() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Attendance History",
                style: const TextStyle()
                    .bold
                    .mediumSize
                    .myColor(AppTextColor.primary)),
            TextButton(
              onPressed: () {},
              child: Text("View All",
                  style: const TextStyle()
                      .regular
                      .small
                      .myColor(AppTextColor.primary)),
            )
          ],
        ),
      ],
    );
  }
}
