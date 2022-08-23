part of 'registration_bloc.dart';

class RegistrationState extends Equatable {
  const RegistrationState({
    this.email = const Email.empty(),
    this.password = const Password.empty(),
  });

  final Email email;
  final Password password;

  RegistrationState copyWith({
    Email? email,
    Password? password,
  }) {
    return RegistrationState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  bool get filled => email.validate() == null && password.validate() == null;

  @override
  List<Object> get props => [email, password];
}
