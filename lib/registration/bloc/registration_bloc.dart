import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simplest_demo_app/registration/models/models.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final AuthenticationRepository repository;

  RegistrationBloc(this.repository) : super(const RegistrationState()) {
    on<RegistrationEmailChanged>(_onEmailChanged);
    on<RegistrationPasswordChanged>(_onPasswordChanged);
    on<RegistrationSubmitted>(_onSubmitted);
  }

  void _onEmailChanged(
    RegistrationEmailChanged event,
    Emitter<RegistrationState> emit,
  ) {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(email: email),
    );
  }

  void _onPasswordChanged(
    RegistrationPasswordChanged event,
    Emitter<RegistrationState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(password: password),
    );
  }

  Future<void> _onSubmitted(
    RegistrationSubmitted event,
    Emitter<RegistrationState> emit,
  ) async {
    if (state.filled) {
      repository.register(email: state.email.value, password: state.password.value);
    }
  }
}
