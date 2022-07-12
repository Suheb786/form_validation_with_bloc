part of 'form_bloc.dart';

@immutable
abstract class SignInFormState {}

class FormInitial extends SignInFormState {}

class FormError extends SignInFormState {
  final String errorMsg;

  FormError(this.errorMsg);
}

class FormValid extends SignInFormState {}

class FormLoading extends SignInFormState {}
