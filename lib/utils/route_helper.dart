import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/login/login_page.dart';

class RouteHelper {
  static GoRouter routes = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage();
        },
      ),
    ],
  );
}
