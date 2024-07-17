import 'package:flutter/material.dart';
import 'config/router.dart';
import 'config/themes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      routeInformationParser: AppRouter.router.routeInformationParser,
      routerDelegate: AppRouter.router.routerDelegate,
      title: "Avia Saga",
      debugShowCheckedModeBanner: false,
      theme: myTheme,
    );
  }
}
