import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:td3/router/shell_routes.dart';
import 'package:td3/ui/ScreenJeu.dart';
import 'package:td3/ui/ScreenScore.dart';

import '../ui/ScreenRegles.dart';


final GlobalKey<NavigatorState> _routenavigatorkey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellnavigatorkey = GlobalKey<NavigatorState>();


final router = GoRouter(
    navigatorKey: _routenavigatorkey,
    initialLocation: '/home/Jouer',
    routes: <RouteBase>[
      GoRoute(
          path: '/home',
          redirect: (context,state){
            return '/home/Jouer';
          }
      ),
      GoRoute(
          path: '/home',
          redirect: (context,state){
            return '/home/Jouer';
          }
      ),
      GoRoute(
          path: '/home',
          name: 'home',
          builder: (context, state) => const ScreenJeu(),
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
                        return const ScreenScore();
                      },
                  ),
                  GoRoute(
                      path: 'Jouer',
                      builder: (context, state) {
                        return const ScreenJeu();
                      },
                  ),
                  GoRoute(
                      path: 'Regles',
                      builder: (context, state) {
                        return const ScreenRegles();
                      },
                  ),
                ]
            )

          ]
      ),
    ]
);