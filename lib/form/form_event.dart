part of 'form_bloc.dart';

@immutable
abstract class FormEvent {}

class TextChangedEent extends FormEvent {
  final String emailValue;
  final String passwordValue;

  TextChangedEent(
    this.emailValue,
    this.passwordValue,
  );
}

class SubmitEvent extends FormEvent {
  final String emial;
  final String password;

  SubmitEvent(
    this.emial,
    this.password,
  );
}
