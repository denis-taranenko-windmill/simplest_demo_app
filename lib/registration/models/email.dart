import 'package:equatable/equatable.dart';

enum EmailValidationError { empty }

class Email extends Equatable {
  final String value;

  const Email._(this.value);

  const Email.empty() : this._('');

  const Email.dirty(String value) : this._(value);

  EmailValidationError? validate() {
    if (value.isEmpty) {
      return EmailValidationError.empty;
    }
    return null;
  }

  @override
  List<Object?> get props => [value];
}
