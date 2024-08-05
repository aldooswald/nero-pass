import 'package:go_router/go_router.dart';
import 'package:nero_pass/presentation/view/attendance_detail_page.dart';
import 'package:nero_pass/presentation/view/coming_soon_page.dart';
import 'package:nero_pass/presentation/view/home_page.dart';
import 'package:nero_pass/presentation/view/attendance_page.dart';
import 'package:nero_pass/presentation/view/scanner_page.dart';
import 'package:nero_pass/presentation/view/navigation_page.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
    initialLocation: '/home',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return NavigationPage(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HomePage(),
            ),
          ),
          GoRoute(
            path: '/attendance',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: AttendancePage(),
            ),
          ),
          GoRoute(
            path: '/member',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ComingSoonPage(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/scanner',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: ScannerPage(),
        ),
      ),
      GoRoute(
        name: 'attendance-detail',
        path: '/attendance-detail',
        pageBuilder: (context, state) => NoTransitionPage(
          child:
              AttendanceDetailPage(event: state.uri.queryParameters['event']!),
        ),
      ),
    ],
  );

  static GoRouter get router => _router;
}
