import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/themes.dart';
import '../widget/clock_and_date_widget.dart';
import '../widget/scanner_button_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          children: [
            _buildHeader(),
            _buildBody(context),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          const CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage('assets/images/nerosia_logo.png'),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ClockAndDateWidget(),
            const SizedBox(height: 32),
            ScannerCircularButton(
              onTap: () {
                context.push('/scanner');
              },
              icon: Icons.qr_code,
            ),
          ],
        ),
      ),
    );
  }
}
