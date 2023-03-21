import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_task/features/recipes/presentation/view/home_screen.dart';


enum AppRoute { home }

final goRouterProvider = Provider<GoRouter>((ref) {
  final router = AppRouters();

  return GoRouter(
      debugLogDiagnostics: true,
      routes: router._routes,
      initialLocation:'/');
});

class AppRouters {
  List<GoRoute> _routes = [
    GoRoute(
      path: "/",
      name: AppRoute.home.name,
      builder: (context, state) => HomeScreen(),
      routes: [],
    ),
  ];
}
