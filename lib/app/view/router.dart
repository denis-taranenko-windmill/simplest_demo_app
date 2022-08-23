import 'package:flutter/material.dart';
import 'package:simplest_demo_app/content/view/content_page.dart';
import 'package:simplest_demo_app/registration/view/set_email_page.dart';
import 'package:simplest_demo_app/registration/view/set_password_page.dart';
import 'package:simplest_demo_app/splash/view/splash_page.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  late final Widget page;

  switch (settings.name) {
    case Routes.splash:
      page = const SplashPage();
      break;

    case Routes.content:
      page = const ContentPage();
      break;

    case Routes.setEmail:
      page = const SetEmailPage();
      break;

    case Routes.setPassword:
      page = const SetPasswordPage();
      break;
  }

  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
  );
}

class Routes {
  static const splash = '/splash';
  static const content = '/content';
  static const setPassword = '/set_password';
  static const setEmail = '/set_email';
  static const successRegistration = '/success_registration';
}
