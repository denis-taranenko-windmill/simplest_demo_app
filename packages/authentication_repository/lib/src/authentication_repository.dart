import 'dart:async';

enum AuthenticationStatus { unauthenticated, authenticated, unknown }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    // Imitate delay
    await Future<void>.delayed(const Duration(seconds: 1));

    yield AuthenticationStatus.unauthenticated;

    yield* _controller.stream;
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
    await Future.delayed(
      const Duration(milliseconds: 700),
      () => _controller.add(AuthenticationStatus.authenticated),
    );
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
