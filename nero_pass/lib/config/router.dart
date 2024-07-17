import 'package:go_router/go_router.dart';
import 'package:nero_pass/presentation/view/home_page.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomePage(),
      ),
      // GoRoute(
      //   name: 'security',
      //   path: '/onboarding/security',
      //   builder: (context, state) => const OnboardingSecurity(),
      // ),
      // GoRoute(
      //   name: 'register1',
      //   path: '/onboarding/register/1',
      //   builder: (context, state) => RegisterFirst(),
      // ),
    ],
  );

  static GoRouter get router => _router;
}
