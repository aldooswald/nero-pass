import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nero_pass/data/repositories/history_repository.dart';
import 'package:nero_pass/presentation/cubit/attendance/attendance_cubit.dart';
import 'package:nero_pass/presentation/cubit/history/history_cubit.dart';
import 'config/router.dart';
import 'config/themes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HistoryCubit(repository: HistoryRepository()),
        ),
        BlocProvider(
          create: (context) => AttendanceCubit(repository: HistoryRepository()),
        ),
      ],
      child: MaterialApp.router(
        routeInformationProvider: AppRouter.router.routeInformationProvider,
        routeInformationParser: AppRouter.router.routeInformationParser,
        routerDelegate: AppRouter.router.routerDelegate,
        title: "Nero Pass",
        debugShowCheckedModeBanner: false,
        theme: myTheme,
        themeMode: ThemeMode.light,
      ),
    );
  }
}
