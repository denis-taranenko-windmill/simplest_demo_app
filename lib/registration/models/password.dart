import 'package:equatable/equatable.dart';

enum PasswordValidationError { empty }

class Password extends Equatable {
  final String value;

  const Password._(this.value);

  const Password.empty() : this._('');

  const Password.dirty(String value) : this._(value);

  PasswordValidationError? validate() {
    if (value.isEmpty) {
      return PasswordValidationError.empty;
    }
    return null;
  }

  @override
  List<Object?> get props => [value];
}
