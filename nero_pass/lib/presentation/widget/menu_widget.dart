import 'package:flutter/material.dart';

import '../../config/themes.dart';

class MenuWidget extends StatelessWidget {
  final String icon;
  final String title;
  const MenuWidget({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: 135,
        decoration: BoxDecoration(
          color: ColorPallete.neroLight,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: ColorPallete.neroDark,
            width: 1,
          ),
        ),
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // _buildMenuItem("Home", Icons.home),
                // _buildMenuItem("Profile", Icons.person),
                // _buildMenuItem("Settings", Icons.settings),
                Image.asset(
                  icon,
                  width: 50,
                  height: 50,
                ),
                Text(title,
                    style: const TextStyle()
                        .regular
                        .mediumSize
                        .myColor(AppTextColor.primary)),
              ],
            ),
          ),
        ));
  }
}
