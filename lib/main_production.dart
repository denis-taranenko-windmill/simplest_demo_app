import 'package:authentication_repository/authentication_repository.dart';
import 'package:simplest_demo_app/app/app.dart';
import 'package:simplest_demo_app/bootstrap.dart';
import 'package:user_repository/user_repository.dart';

void main() {
  bootstrap(
    () => App(
      userRepository: UserRepository(),
      authenticationRepository: AuthenticationRepository(),
    ),
  );
}
