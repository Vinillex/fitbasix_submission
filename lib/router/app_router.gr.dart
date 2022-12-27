// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../screen/dashboard_screen.dart' as _i1;
import '../screen/home_screen.dart' as _i3;
import '../screen/my_fitness_screen.dart' as _i2;
import 'page_route_builder.dart' as _i6;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return _i4.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.DashboardScreen(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    MyFitnessRoute.name: (routeData) {
      return _i4.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.MyFitnessScreen(),
        customRouteBuilder: _i6.myCustomRouteBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeRoute.name: (routeData) {
      return _i4.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreen(),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'dashboard',
          fullMatch: true,
        ),
        _i4.RouteConfig(
          DashboardRoute.name,
          path: 'dashboard',
          children: [
            _i4.RouteConfig(
              HomeRoute.name,
              path: 'home-screen',
              parent: DashboardRoute.name,
            )
          ],
        ),
        _i4.RouteConfig(
          MyFitnessRoute.name,
          path: 'myFitness',
        ),
        _i4.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.DashboardScreen]
class DashboardRoute extends _i4.PageRouteInfo<void> {
  const DashboardRoute({List<_i4.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          path: 'dashboard',
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i2.MyFitnessScreen]
class MyFitnessRoute extends _i4.PageRouteInfo<void> {
  const MyFitnessRoute()
      : super(
          MyFitnessRoute.name,
          path: 'myFitness',
        );

  static const String name = 'MyFitnessRoute';
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home-screen',
        );

  static const String name = 'HomeRoute';
}
