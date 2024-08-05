import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nero_pass/config/themes.dart';

class NavigationPage extends StatefulWidget {
  final Widget child;

  const NavigationPage({super.key, required this.child});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child, // Display the content of the current route
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          final route = _getRouteForIndex(index);
          GoRouter.of(context).go(route);
        },
        selectedItemColor: ColorPallete.neroDark,
        unselectedItemColor: ColorPallete.neroGrey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Attendance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_rounded),
            label: 'Member',
          ),
        ],
      ),
    );
  }

  String _getRouteForIndex(int index) {
    switch (index) {
      case 0:
        return '/home';
      case 1:
        return '/attendance';
      case 2:
        return '/member';
      default:
        return '/home';
    }
  }
}
