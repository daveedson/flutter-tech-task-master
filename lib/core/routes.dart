import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_task/features/recipes/presentation/view/home_screen.dart';
import 'package:tech_task/features/recipes/presentation/view/ingredients_screen.dart';
import 'package:tech_task/features/recipes/presentation/view/recepie_screen.dart';

enum AppRoute { home, ingredients, reciepe }

final goRouterProvider = Provider<GoRouter>((ref) {
  final router = AppRouters();

  return GoRouter(
      debugLogDiagnostics: true, routes: router._routes, initialLocation: '/');
});

class AppRouters {
  List<GoRoute> _routes = [
    GoRoute(
      path: "/",
      name: AppRoute.home.name,
      builder: (context, state) => HomeScreen(),
      routes: [
        GoRoute(
          path: "ingridents",
          name: AppRoute.ingredients.name,
          pageBuilder: (context, state) => MaterialPage(
            fullscreenDialog: true,
            child: IngredientsScreen(),
          ),
        ),
        GoRoute(
          path: "reciepe",
          name: AppRoute.reciepe.name,
          builder: (context, state) => ReciepeScreen(),
        ),
      ],
    ),
  ];
}
