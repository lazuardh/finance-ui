import 'package:flutter/material.dart';
import '../../../lib.dart';

class PageRouter {
  Route<dynamic>? getRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      /* splash */
      //-------------------------------------------------------

      case PagePath.signIn:
        return _buildRouter(
          settings: settings,
          builder: (arguments) => const SignInPage(),
        );

      //------------------------------------------------------

      /* Bottom Nav */
      //-------------------------------------------------------
      case PagePath.bottomNav:
        return _buildRouter(
          settings: settings,
          builder: (arguments) => const BottomNav(),
        );
      //------------------------------------------------------

      default:
        return null;
    }
  }

  Route<dynamic> _buildRouter({
    required RouteSettings settings,
    required Widget Function(Object? arguments) builder,
  }) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => builder(settings.arguments),
    );
  }
}
