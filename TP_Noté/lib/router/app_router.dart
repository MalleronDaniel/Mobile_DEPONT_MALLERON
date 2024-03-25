import 'dart:js';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:td3/router/shell_routes.dart';
import 'package:td3/ui/homesreen.dart';

final GlobalKey<NavigatorState> _routenavigatorkey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellnavigatorkey = GlobalKey<NavigatorState>();


final router = GoRouter(
    navigatorKey: _routenavigatorkey,
    initialLocation: '/home',
    routes: <RouteBase>[
      GoRoute(
          path: '/',
          redirect: (context,state){
            return '/home';
          }
      ),
      GoRoute(
          path: '/home',
          name: 'home',
          builder: (context, state) => const HomeScreen(),
          routes: <RouteBase> [
            ShellRoute(
                navigatorKey: _shellnavigatorkey,
                builder: (BuildContext context, GoRouterState state, Widget child) {
                  return ScaffoldWithNavBar(child: child);
                },
                routes: [
                  GoRoute(
                      path: 'Scores',
                      builder: (context, state) {
                        return const ScreenA();
                      },
                  ),
                  GoRoute(
                      path: 'Jouer',
                      builder: (context, state) {
                        return const ScreenB();
                      },
                  ),
                  GoRoute(
                      path: 'Regles',
                      builder: (context, state) {
                        return const ScreenC();
                      },
                  ),
                ]
            )

          ]
      ),
    ]
);