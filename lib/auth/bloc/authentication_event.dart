part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final User? user;

  const AuthenticationState._({this.status = AuthenticationStatus.unknown, this.user});

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  const AuthenticationState.authenticated({required User user})
      : this._(user: user, status: AuthenticationStatus.authenticated);

  const AuthenticationState.unknown() : this._();

  @override
  List<Object?> get props => [status, user];
}
