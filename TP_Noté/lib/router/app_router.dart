import 'dart:js';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:td3/router/shell_routes.dart';
import 'package:td3/ui/aboutscreen.dart';
import 'package:td3/ui/homesreen.dart';
import 'package:td3/ui/detailssreen.dart';

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
            GoRoute(
                path: 'about',
                builder: (context, state) {
                  return const AboutScreen();
                }
            ),
            ShellRoute(
                navigatorKey: _shellnavigatorkey,
                builder: (BuildContext context, GoRouterState state, Widget child) {
                  return ScaffoldWithNavBar(child: child);
                },
                routes: [
                  GoRoute(
                      path: 'a',
                      builder: (context, state) {
                        return const ScreenA();
                      },
                      routes: [
                        GoRoute(
                            parentNavigatorKey: _routenavigatorkey,
                            path: "details",
                            builder: (BuildContext context,GoRouterState state){
                              return const DetailSreenNavBar(label: "A");
                            }
                        )
                      ]
                  ),
                  GoRoute(
                      path: 'b',
                      builder: (context, state) {
                        return const ScreenB();
                      },
                      routes: [
                        GoRoute(
                          parentNavigatorKey: _routenavigatorkey,
                            path: "details",
                            builder: (BuildContext context,GoRouterState state){
                              return const DetailSreenNavBar(label: "B");
                            }
                        )
                      ]
                  ),
                  GoRoute(
                      path: 'c',
                      builder: (context, state) {
                        return const ScreenC();
                      },
                      routes: [
                        GoRoute(
                            parentNavigatorKey: _routenavigatorkey,
                            path: "details",
                          builder: (BuildContext context,GoRouterState state){
                            return const DetailSreenNavBar(label: "C");
                          }
                        )
                      ]

                  ),
                ]
            )

          ]
      ),
      GoRoute(
        path: '/details/:id',
        name: 'details-on-id',
        builder: (context, state) {
          final id = state.pathParameters["id"];
          return DetailScreen(id: int.parse(id!));
        },
      ),
      GoRoute(
        path: '/details',
        name: 'details',
        builder: (context, state) {
          final id = state.uri.queryParameters['search'];
          return DetailScreen(id: int.parse(id!));
        },
      ),
    ]
);