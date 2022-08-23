import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:simplest_demo_app/auth/auth.dart';
import 'package:simplest_demo_app/l10n/l10n.dart';
import 'package:simplest_demo_app/registration/registration.dart';
import 'package:user_repository/user_repository.dart';

import 'router.dart';
import 'theme.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.authenticationRepository,
    required this.userRepository,
  });

  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(userRepository, authenticationRepository),
        ),
        BlocProvider<RegistrationBloc>(
          create: (context) => RegistrationBloc(authenticationRepository),
        ),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      theme: theme,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.unauthenticated:
                _navigator.pushNamedAndRemoveUntil(
                  Routes.setEmail,
                  (route) => false,
                );
                break;
              case AuthenticationStatus.authenticated:
                _navigator.pushNamedAndRemoveUntil(Routes.content, (route) => false);
                break;
              case AuthenticationStatus.unknown:
                _navigator.pushNamedAndRemoveUntil(
                  Routes.splash,
                  (route) => false,
                );
                break;
            }
          },
          child: child,
        );
      },
      initialRoute: Routes.splash,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
