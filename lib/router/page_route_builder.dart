import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Route<T> myCustomRouteBuilder<T>(
    BuildContext context, Widget child, CustomPage<T> page) {
  if (Platform.isIOS) {
    return CupertinoPageRoute(
      builder: (_) => child,
      settings: page,
    );
  } else {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => child,
      settings: page,
      transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
          ) =>
          SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
    );
  }
}